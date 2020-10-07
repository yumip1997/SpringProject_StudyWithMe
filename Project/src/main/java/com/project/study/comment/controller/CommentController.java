package com.project.study.comment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.study.comment.dao.ICommentService;
import com.project.study.comment.model.CommentVO;

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	ICommentService commentService;
	
	@PostMapping("/commentList")
	@ResponseBody
	public List<CommentVO> commentList(int postNum, String postType){
		return commentService.getCommentList(postNum, postType);
	}
	
	@PostMapping("/insertComment")
	@ResponseBody
	public CommentVO insertComment(@ModelAttribute CommentVO comment) {
		//CommentVO의 나머지 변수들 설정 
		int num = commentService.getMaxCommentNum();
		comment.setCommentNum(num);
		comment.setParentNum(num);
		
		//Comment삽입
		commentService.insertComment(comment);
		return commentService.getComment(num);
	}
	
	@PostMapping("/insertReply")
	@ResponseBody
	public CommentVO insertReply(@ModelAttribute CommentVO reply) {
		int commentNum = commentService.getMaxCommentNum();
		int groupOrder = commentService.getMaxGroupOrder(reply.getParentNum());
		reply.setCommentNum(commentNum);
		reply.setGroupOrder(groupOrder);
		
		commentService.insertReply(reply);
		return commentService.getComment(commentNum);
	}
	
	@PostMapping("/deleteComment")
	@ResponseBody
	public void deleteComment(int commentNum) {
		commentService.deleteComment(commentNum);
	}
	
	@PostMapping("/deleteReply")
	@ResponseBody
	public void deleteReply(int commentNum) {
		commentService.deleteComment(commentNum);
	}
}
