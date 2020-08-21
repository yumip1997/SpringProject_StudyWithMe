package com.project.study.board.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.study.board.model.CommentVO;

@Service
public class CommentService implements ICommentService{

	@Autowired
	ICommentRepository commentRepository;
	
	@Override
	public List<CommentVO> getCommentList(int num) {
		// TODO Auto-generated method stub
		return commentRepository.getCommentList(num);
	}

	@Override
	public void insertComment(CommentVO comment) {
		// TODO Auto-generated method stub
		commentRepository.insertComment(comment);
	}

}
