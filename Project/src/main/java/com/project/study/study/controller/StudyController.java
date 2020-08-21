package com.project.study.study.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.study.board.dao.IBoardService;
import com.project.study.study.dao.IStudyService;
import com.project.study.study.model.StudyVO;

@Controller
public class StudyController {

	@Autowired
	IStudyService studyService;
	
	@Autowired
	IBoardService boardService;
	
	@GetMapping("/join/{boardNum}")
	public String joinStudy(@PathVariable int boardNum, Principal principal) {
		String currentUser = principal.getName();
		StudyVO study = new StudyVO();
		study.setBoardNum(boardNum);
		study.setUserId(currentUser);
		studyService.insertStudy(study);
		return "redirect:/board/"+boardNum;
	}
	
	@PostMapping("/idCheck")
	@ResponseBody
	public boolean checkDuplication(int boardNum, String userId) {
		StudyVO study = new StudyVO();
		study.setBoardNum(boardNum);
		study.setUserId(userId);
		return studyService.checkDuplication(study);
	}
	
	//회원 별 스터디 목록
	@GetMapping("/studyList")
	public String studyList(Model model, Principal principal) {
		String currentUser = principal.getName();
		model.addAttribute("studies", studyService.getStudyListByMem(currentUser));
		return "/study/studyList";
	}
	
	//스터디 시작
	@GetMapping("/studyView/{boardNum}")
	public String startStudy(Model model, @PathVariable int boardNum) {
		model.addAttribute("study", boardService.getBoard(boardNum));
		return "/study/studyView";
	}
}
