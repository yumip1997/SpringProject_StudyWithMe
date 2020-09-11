package com.project.study.comment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.study.comment.dao.ICommentService;

@Controller
public class CommentController {

	@Autowired
	ICommentService commentSerivce;
	
	
}
