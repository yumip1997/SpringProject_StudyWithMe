package com.project.study.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.study.board.dao.IBoardService;
import com.project.study.comment.dao.ICommentService;
import com.project.study.file.dao.IFileService;
import com.project.study.qna.dao.IQnAService;
import com.project.study.study.dao.IStudyService;
import com.project.study.study.model.StudyVO;
import com.project.study.util.PageMaker;

@Controller
@PreAuthorize("isAuthenticated() and hasAnyRole('ROLE_USER','ROLE_ADMIN')")
public class StudyController {

	@Autowired
	IStudyService studyService;

	@Autowired
	IBoardService boardService;

	@Autowired
	IQnAService qnaService;

	@Autowired
	IFileService fileService;

	@Autowired
	ICommentService commentService;

	@PostMapping("/join")
	@ResponseBody
	public boolean checkDuplication(int boardNum, String userId) {
		StudyVO study = new StudyVO();
		study.setBoardNum(boardNum);
		study.setUserId(userId);

		if (!studyService.checkDuplication(study)) {
			studyService.insertStudy(study);
			return true;
		} else {
			return false;
		}
	}

	// 관리자 권한 스터디 목록 보기
	@GetMapping("/studyList_Admin")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String studyListAdmin(Model model, @RequestParam(required = false, defaultValue = "1") int page) {
		model.addAttribute("studies", boardService.getBoardList("all", "writedate", page));
		model.addAttribute("pageMaker", new PageMaker(boardService.getBoardCount("all"), page));
		return "/study/studyList_Admin";
	}

	// 회원 별 스터디 목록
	@GetMapping("/studyList")
	public String studyList(Model model, @RequestParam(required = false, defaultValue = "1") int page) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userId = auth.getName();
		model.addAttribute("studies", studyService.getStudyListByMem(userId, page));
		model.addAttribute("pageMaker", new PageMaker(studyService.getCountStudyByMem(userId), page));
		return "/study/studyList";
	}
	
	// 스터디 시작
	@GetMapping("/studyView/{boardNum}")
	public String startStudy(Model model, @PathVariable int boardNum) {
		model.addAttribute("study", boardService.getBoard(boardNum));
		return "/study/studyView";
	}

	// 스터디 삭제
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/deleteStudy")
	public String deleteStudy(@RequestParam("boardNum") int boardNum) {

		// 해당 스터디의 스터디 모집글, qna, file의 댓글 리스트 삭제
		commentService.deleteCommentList(boardNum);
		// 해당 스터디의 전체 qna 삭제
		qnaService.deleteQnAList(boardNum);
		// 해당 스터디의 전체 file 삭제
		fileService.deleteFileList(boardNum);
		// 해당 스터디의 회원 목록 삭제
		studyService.deleteStudyMem(boardNum);
		// 해당 스터디의 스터디 모집 글 좋아요 기록 삭제
		boardService.deleteLikeList(boardNum);
		// 해당 스터디의 스터디 모집 글 삭제
		boardService.deleteBoard(boardNum);

		return "redirect:/studyList";
	}

}
