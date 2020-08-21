package com.project.study.websocket.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/study")
public class ChatController {
	public String chat(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String user = (String) authentication.getPrincipal();
		model.addAttribute("userId", user);
		return "/chatRoom";
	}

}
