package com.project.study.member.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.study.board.dao.IBoardService;
import com.project.study.member.dao.IMemberService;
import com.project.study.member.model.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private IBoardService boardService;

	@Autowired
	private BCryptPasswordEncoder bpe;

	// 회원 목록
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/memberList")
	public String memberList(Model model) {
		model.addAttribute("memberList", memberService.getMemberList());
		return "/member/memberList";
	}

	// 회원상세조회
	@PreAuthorize("hasRole('ROLE_ADMIN') or(principal == #userId)")
	@GetMapping("/{userId}")
	public String viewMember(Model model, @PathVariable String userId) {
		MemberVO member = new MemberVO();
		member = memberService.getMember(userId);
		
		String account = member.isEnabled() ? "활성화" : "비활성화";
		String auth = "ROLE_ADMIN".equals(member.getAuthority()) ? "관리자" : "회원";
		
		model.addAttribute("member", member);
		model.addAttribute("account", account);
		model.addAttribute("auth", auth);

		return "member/memberDetail";
	}
	
	//GetMapping 회원가입
	@PreAuthorize("isAnonymous()") 
	@GetMapping("/insertMember")
	public String insertMember(Model model) {
		model.addAttribute("member", new MemberVO());
		return "/member/insertMember";
	}
	
	//PostMapping 회원가입
	@PreAuthorize("isAnonymous()") 
	@PostMapping("/insertMember")
	public String insertMember(@ModelAttribute("member") @Valid MemberVO member, BindingResult result) {
		if (result.hasErrors()) {
			return "/member/insertMember";
		}
		member.setPassword(bpe.encode(member.getPassword()));
		member.setEnabled('1');
		memberService.insertMember(member);
		return "redirect:../index";
	}
	
	//GetMapping 회원정보 수정
	@PreAuthorize("hasRole('ROLE_ADMIN') or(principal == #userId)")
	@GetMapping("/updateMember")
	public String updateMember(Model model, @RequestParam String userId) {
		MemberVO member = new MemberVO();
		member = memberService.getMember(userId);
		
		String account = member.isEnabled() ? "활성화" : "비활성화";
		String auth = "ROLE_ADMIN".equals(member.getAuthority()) ? "관리자" : "회원";
		
		model.addAttribute("member", member);
		model.addAttribute("account", account);
		model.addAttribute("auth", auth);
		return "/member/updateMember";
	}
	
	//PostMapping 회원정보 수정
	@PreAuthorize("(principal == #userId)")
	@PostMapping("/updateMember")
	public String updateMember(@ModelAttribute("member") @Valid MemberVO member, BindingResult result,
			@RequestParam("userId")String userId) {
		if(result.hasErrors()) {
			return "member/updateMember";
		}
		memberService.updateMember(member);
		return "redirect:/member/"+userId;
	}
	
	//회원 활성화 여부, 권한 변경
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/updateAccount")
	public String updateAccount(@RequestParam("userId")String userId, @RequestParam("enabled")char enabled,
			@RequestParam("authority")String authority) {
		memberService.updateAuth(authority, userId);
		memberService.updateEnabled(enabled, userId);
		return "redirect:/member/"+userId;
	}
	
	//회원 탈퇴
	@PreAuthorize("hasRole('ROLE_ADMIN') or(principal == #userId)")
	@GetMapping("/deleteMember/{userId}")
	public String deleteMember(@PathVariable String userId, Principal principal, HttpSession session) {
		String currentUser = principal.getName();
		if(currentUser == userId) {
			session.invalidate();
			memberService.deleteMember(userId);
			return "redirect:../index";
		}else {
			memberService.deleteMember(userId);
			return "redirect:/member/memberList";
		}
	}
}
