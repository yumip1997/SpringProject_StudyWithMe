package com.project.study.comment.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.study.comment.dao.ICommentService;
import com.project.study.comment.model.CommentVO;

@Controller
@RequestMapping("/board")
public class CommentController {

	@Autowired
	ICommentService commentService;
	
	@PostMapping("/insertComment")
	@ResponseBody
	public HashMap<String,Object> insertComment(@ModelAttribute CommentVO comment) 
	{
		HashMap<String, Object>map = new HashMap<String, Object>();
		//CommentVO의 나머지 변수들 설정 
		int num = commentService.getMaxCommentNum();
		comment.setCommentNum(num);
		comment.setParentNum(num);
		
		//Comment삽입
		commentService.insertComment(comment);
		map.put("commentNum", comment.getCommentNum());
		map.put("commentContent", comment.getCommentContent());
		
		return map;
	}
	
	
	
	
}
