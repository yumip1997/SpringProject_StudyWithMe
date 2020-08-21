package com.project.study.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.study.member.dao.IMemberService;

@Controller
public class LoginController {
	
	@Autowired
	IMemberService memberService;
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/index")
	public String index() {
		return "index";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}
	
	@GetMapping("/board/index")
	public void boardIndex() {}
	
	@RequestMapping("/loginCheck")
	public String loginCheck(Model model, HttpSession session) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_ADMIN"))
			|| authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_USER"))) {
			session.setAttribute("userId", authentication.getPrincipal());
			return "redirect:/index";
		} else {
			return "/login?error";
		}
	}

}
