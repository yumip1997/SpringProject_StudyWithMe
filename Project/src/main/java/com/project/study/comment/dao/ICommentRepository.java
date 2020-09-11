package com.project.study.comment.dao;

import java.util.List;

import com.project.study.comment.model.CommentVO;

public interface ICommentRepository {
	
	//댓글 목록
	List<CommentVO> getCommentList(int postNum);
	
	//댓글 삽입
	void insertComment(CommentVO comment);
	
	//댓글 수정
	void updateComment(CommentVO comment);
	
	//댓글 삭제
	void deleteComment(int commentNum);

}
