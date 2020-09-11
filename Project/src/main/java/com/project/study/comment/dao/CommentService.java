package com.project.study.comment.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.study.comment.model.CommentVO;

@Service
public class CommentService implements ICommentService{

	@Autowired
	private ICommentRepository commentRepository;
	
	@Override
	public List<CommentVO> getCommentList(int postNum) {
		// TODO Auto-generated method stub
		return commentRepository.getCommentList(postNum);
	}

	@Override
	public void insertComment(CommentVO comment) {
		// TODO Auto-generated method stub
		commentRepository.insertComment(comment);
	}

	@Override
	public void updateComment(CommentVO comment) {
		// TODO Auto-generated method stub
		commentRepository.updateComment(comment);
	}

	@Override
	public void deleteComment(int commentNum) {
		// TODO Auto-generated method stub
		commentRepository.deleteComment(commentNum);
	}

}
