package com.project.study.comment.dao;

import java.util.List;

import com.project.study.comment.model.CommentVO;

public interface ICommentService {
	// 댓글 목록
	List<CommentVO> getCommentList(int postNum, String postType);

	// 특정 댓글
	CommentVO getComment(int commentNum);

	// 댓글 번호의 최댓 값 +1
	int getMaxCommentNum();

	// 같은 부모 댓글을 가지는 그룹의 최대 순서
	int getMaxGroupOrder(int parentNum);

	// 댓글 삽입
	void insertComment(CommentVO comment);

	// 답글 삽입
	void insertReply(CommentVO comment);

	// 댓글 수정
	void updateComment(CommentVO comment);

	// 댓글 삭제
	void deleteComment(int commentNum);

	// 특정 게시글(스터디 모집글, QnA, File) 별 댓글 개수
	int getCountComment(int postNum, String postType);

	// 특정 게시글(스터디 모집글, QnA, File)의 댓글 리스트 삭제
	void deleteComListByType(int postNum, String postType);
}
