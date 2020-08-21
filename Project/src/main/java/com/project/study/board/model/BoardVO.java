package com.project.study.board.model;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

public class BoardVO {
	//스터디 모집 글번호
	private int boardNum;
	
	//스터디 모집 글 제목
	@Length(min=2, max=20)
	private String boardTitle;
	
	@NotEmpty
	//스터디 모집글 내용
	private String boardContent;
	
	@Length(min=2, max=20)
	//스터디 이름
	private String studyTitle;
	
	@NotEmpty
	//스터디 타입
	private String studyType;
	
	//작성일
	private Date writedate;
	
	//조회수
	private int views;
	
	//좋아요
	private int likes;
	
	//작성자
	private String userId;
	
	//모집 마감 여부
	private char enabled;

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getStudyTitle() {
		return studyTitle;
	}

	public void setStudyTitle(String studyTitle) {
		this.studyTitle = studyTitle;
	}

	public String getStudyType() {
		return studyType;
	}

	public void setStudyType(String studyType) {
		this.studyType = studyType;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public char getEnabled() {
		return enabled;
	}

	public void setEnabled(char enabled) {
		this.enabled = enabled;
	}
	
}
