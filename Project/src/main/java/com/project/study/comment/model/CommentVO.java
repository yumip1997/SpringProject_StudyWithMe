package com.project.study.comment.model;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;

public class CommentVO {
	
	//댓글 번호
	int commentNum;
	
	//부모 댓글 번호
	int parentNum;
	
	//부모 댓글이면 0, 답글이면 순차적으로 증가
	int groupOrder;
	
	String commentContent;
	
	Date writedate;
	
	String userId;
	
	//스터디 모집글 번호
	int boardNum;

	// 글 번호(board 글번호 or QnA 글번호 or File 글번호)
	int postNum;

	// 글 타입(board 글번호 or QnA or File)
	String postType;

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

	public int getGroupOrder() {
		return groupOrder;
	}

	public void setGroupOrder(int groupOrder) {
		this.groupOrder = groupOrder;
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
	
	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public String getPostType() {
		return postType;
	}

	public void setPostType(String postType) {
		this.postType = postType;
	}
}
