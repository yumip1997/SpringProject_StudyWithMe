package com.project.study.qna.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
import com.project.study.qna.dao.IQnAService;
import com.project.study.qna.model.QnAVO;

@Controller
@RequestMapping("/qna")
public class QnAController {

	@Autowired
	IQnAService qnaService;
	
	@Autowired
	IBoardService boardService;
	
	@GetMapping("/qnaList/{boardNum}")
	String getQnAList(Model model, @PathVariable int boardNum) {
		String studyTitle = boardService.getBoard(boardNum).getStudyTitle();
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("studyTitle", studyTitle);
		model.addAttribute("qnaList", qnaService.getQnAList(boardNum));
		return "/study/qna/qnaList";
	}
	
	@GetMapping("/{qnaNum}")
	String viewQnA(Model model, @PathVariable int qnaNum) {
		model.addAttribute("qna", qnaService.getQnA(qnaNum));
		qnaService.increaseViews(qnaNum);
		return "/study/qna/qnaView";
	}
	
	@GetMapping("/insertQnA/{boardNum}")
	String insertQnA(Model model, @PathVariable int boardNum) {
		QnAVO qna = new QnAVO();
		qna.setBoardNum(boardNum);
		model.addAttribute("qna", qna);
		return "/study/qna/insertQnA";
	}
	
	@PostMapping("/insertQnA")
	String insertQnA(@ModelAttribute("qna")@Valid QnAVO qna, BindingResult result) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if(result.hasErrors()) {
			return "/study/qna/insertQnA";
		}
	
		qna.setUserId(auth.getName());
		qnaService.insertQnA(qna);
		return "redirect:/qna/qnaList/"+qna.getBoardNum();
	}
	
	@PostMapping("/updateQnAPage")
	String updateQnAPage(Model model, @RequestParam("qnaNum")int qnaNum) {
		model.addAttribute("qna", qnaService.getQnA(qnaNum));
		return "/study/qna/updateQnA";
	}
	
	@PostMapping("/updateQnA")
	String updateQnA(@ModelAttribute("qna")@Valid QnAVO qna, BindingResult result) {
		if(result.hasErrors()) {
			return "/study/qna/updateQnA";
		}
		qnaService.updateQnA(qna);
		return "redirect:/qna/"+ qna.getQnaNum();
	}
	
	@PostMapping("/deleteQnA")
	String deleteQnA(@RequestParam("qnaNum")int qnaNum, @RequestParam("boardNum")int boardNum) {
		qnaService.deleteQnA(qnaNum);
		return "redirect:/qna/qnaList/"+boardNum;
	}
}
