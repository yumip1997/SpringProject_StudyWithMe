package com.project.study.member.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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


import com.project.study.member.dao.IMemberService;
import com.project.study.member.model.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bpe;

	// 회원 목록
	@GetMapping("/memberList")
	public String memberList(Model model) {
		model.addAttribute("memberList", memberService.getMemberList());
		return "/member/memberList";
	}

	// 회원상세조회
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
	@GetMapping("/insertMember")
	public String insertMember(Model model) {
		model.addAttribute("member", new MemberVO());
		return "/member/insertMember";
	}
	
	//PostMapping 회원가입
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
	@PostMapping("/updateAccount")
	public String updateAccount(@RequestParam("userId")String userId, @RequestParam("enabled")char enabled,
			@RequestParam("authority")String authority) {
		memberService.updateAuth(authority, userId);
		memberService.updateEnabled(enabled, userId);
		return "redirect:/member/"+userId;
	}
	
	//회원 탈퇴
	@GetMapping("/deleteMember/{userId}")
	public String deleteMember(@PathVariable String userId, HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String currentUser = auth.getName();
		if(currentUser.equals(userId)) {
			session.invalidate();
			memberService.deleteMember(userId);
			return "redirect:/study/index";
		}else {
			memberService.deleteMember(userId);
			return "redirect:/member/memberList";
		}
	}
}
