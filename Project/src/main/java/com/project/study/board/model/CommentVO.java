package com.project.study.board.model;

import java.sql.Date;

public class CommentVO {
	//댓글 번호
	int commentNum;
	//상위 댓글 번호
	int parentNum;
	//댓글이 달린 게시글 번호
	int num;
	//댓글이면 0 대댓글이면 1 
	int depth;
	//댓글 내용
	String commentContent;
	//댓글 작성일
	Date writedate;
	//댓글 작성자
	String userId;
	
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public int getParentNum() {
		return parentNum;
	}
	public void setParentNum(int parentNum) {
		this.parentNum = parentNum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}
