package com.project.study.board.dao;

import java.util.List;

import com.project.study.board.model.CommentVO;

public interface ICommentService {
	// 특정 게시글의 댓글 목록
	List<CommentVO> getCommentList(int num);

	// 댓글 삽입
	void insertComment(CommentVO comment);

}
