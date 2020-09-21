package com.project.study.board.controller;

import java.security.Principal;
import java.util.HashMap;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.study.board.dao.IBoardService;
import com.project.study.board.model.BoardVO;
import com.project.study.comment.dao.ICommentService;
import com.project.study.study.dao.IStudyService;
import com.project.study.study.model.StudyVO;
import com.project.study.util.PageMaker;

@Controller
@PreAuthorize("isAuthenticated()")
@RequestMapping("/board")
public class BoardController {

	@Autowired
	IBoardService boardService;

	@Autowired
	IStudyService studyService;

	@Autowired
	ICommentService commentService;

	// 스터디 타입에 따른 스터디 모집 글 목록보기
	@GetMapping("/boardList/{studyType}")
	public String boardListbyType(Model model, @PathVariable String studyType, @RequestParam(required=false, defaultValue="1")int page) {
		model.addAttribute("boardList", boardService.getBoardList(studyType, page));
		model.addAttribute("pageMaker", new PageMaker(boardService.getBoardCount(studyType), page));
		model.addAttribute("Top3List", boardService.gettTop3Study(studyType));
		model.addAttribute("studyType", studyType);
		return "board/boardList";
	}

	// 스터디 모집 글 상세조회
	@GetMapping("/{boardNum}")
	public String viewBoard(Model model, @PathVariable int boardNum) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		boolean checkLike = boardService.checkLike(boardNum, auth.getName());
		model.addAttribute("checkLike", checkLike);
		model.addAttribute("board", boardService.getBoard(boardNum));
		model.addAttribute("commentList", commentService.getCommentList(boardNum));
		model.addAttribute("commentCount", commentService.getCountComment(boardNum));
		boardService.increaseViews(boardNum);
		return "board/boardDetail";
	}

	// 스터디 검색
	@PostMapping("/search")
	public String searchStudy(Model model, @RequestParam("searchOption") String searchOption,
			@RequestParam("keyword") String keyword, @RequestParam("studyType") String studyType) {
		model.addAttribute("boardList", boardService.searchBoard(searchOption, keyword, studyType));
		model.addAttribute("count", boardService.countBoard(searchOption, keyword, studyType));
		return "board/boardList";
	}

	// GetMapping 스터디 모집글 작성
	@GetMapping("/insertBoard")
	public String insertBoard(Model model) {
		model.addAttribute("board", new BoardVO());
		return "board/insertBoard";
	}

	// PostMapping 스터디 모집글 작성 & 스터디 생성
	@PostMapping("/insertBoard")
	public String insertBoard(@ModelAttribute("board") @Valid BoardVO board, BindingResult result,
			Principal principal) {
		if (result.hasErrors()) {
			return "board/insertBoard";
		}

		String userId = principal.getName();
		board.setUserId(userId);
		boardService.insertBoard(board);

		StudyVO study = new StudyVO();
		study.setBoardNum(boardService.getMaxBoardNum());
		study.setUserId(userId);
		studyService.insertStudy(study);

		return "redirect:/board/boardList/all";
	}

	// PoatMapping 스터디 모집 글 수정페이지로 이동
	@PreAuthorize("hasRole('ROLE_ADMIN') or(principal == #userId)")
	@PostMapping("/updateBoardPage")
	public String updateBoardPage(@RequestParam("boardNum") int boardNum, @RequestParam("userId") String userId,
			Model model) {
		BoardVO board = boardService.getBoard(boardNum);
		model.addAttribute("board", board);
		return "board/updateBoard";
	}

	// PostMapping 스터디 모집 글 수정
	@PostMapping("/updateBoard")
	public String updateBoard(@ModelAttribute("board") @Valid BoardVO board, BindingResult result) {
		if (result.hasErrors()) {
			return "board/updateBoard";
		}
		boardService.updateBoard(board);
		return "redirect:/board/" + board.getBoardNum();
	}

	// PostMapping 스터디 모집여부 변경
	@PostMapping("/updateStudy")
	@ResponseBody
	public boolean updateStudy(int boardNum, char enabled) {
		if (enabled == '0') {
			boardService.updateCloseBoard('1', boardNum);
			return true;
		} else {
			boardService.updateCloseBoard('0', boardNum);
			return false;
		}
	}

	// 좋아요 여부 체크
	@PostMapping("/updateLike")
	@ResponseBody
	public HashMap<String, Object> updateLike(int boardNum, String userId) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (!boardService.checkLike(boardNum, userId)) {
			boardService.insertLike(boardNum, userId);
			boardService.increaseLikes(boardNum);
		} else {
			boardService.deleteLike(boardNum, userId);
			boardService.decreaseLikes(boardNum);
		}

		map.put("checkLike", boardService.checkLike(boardNum, userId));
		map.put("count", boardService.getLikeCount(boardNum));
		return map;
	}

}
