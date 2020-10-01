package com.project.study.comment.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.study.comment.model.CommentVO;

@Service
public class CommentService implements ICommentService{

	@Autowired
	private ICommentRepository commentRepository;
	
	@Override
	public List<CommentVO> getCommentList(int postNum, String postType) {
		// TODO Auto-generated method stub
		return commentRepository.getCommentList(postNum, postType);
	}
	
	@Override
	public CommentVO getComment(int commentNum) {
		// TODO Auto-generated method stub
		return commentRepository.getComment(commentNum);
	}
	
	@Override
	public int getMaxCommentNum() {
		// TODO Auto-generated method stub
		return commentRepository.getMaxCommentNum();
	}

	@Override
	public int getMaxGroupOrder(int parentNum) {
		// TODO Auto-generated method stub
		return commentRepository.getMaxGroupOrder(parentNum);
	}
	
	@Transactional("txManager")
	@Override
	public void insertComment(CommentVO comment) {
		// TODO Auto-generated method stub
		commentRepository.insertComment(comment);
	}
	
	@Transactional("txManager")
	@Override
	public void insertReply(CommentVO comment) {
		// TODO Auto-generated method stub
		commentRepository.insertReply(comment);
	}

	@Transactional("txManager")
	@Override
	public void updateComment(CommentVO comment) {
		// TODO Auto-generated method stub
		commentRepository.updateComment(comment);
	}
	
	@Transactional("txManager")
	@Override
	public void deleteComment(int commentNum) {
		// TODO Auto-generated method stub
		commentRepository.deleteComment(commentNum);
	}

	@Override
	public int getCountComment(int postNum, String postType) {
		// TODO Auto-generated method stub
		return commentRepository.getCountComment(postNum, postType);
	}

	@Transactional("txManager")
	@Override
	public void deleteComListByType(int postNum, String postType) {
		// TODO Auto-generated method stub
		commentRepository.deleteComListByType(postNum, postType);
	}

	@Transactional("txManager")
	@Override
	public void deleteCommentList(int boardNum) {
		// TODO Auto-generated method stub
		commentRepository.deleteCommentList(boardNum);
	}
}
