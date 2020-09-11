package com.project.study.comment.model;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;

public class CommentVO {
	
	int commentNum;
	
	@NotEmpty
	String commentContent;
	
	Date writedate;
	
	String userId;

	// 글 번호(board 글번호 or QnA 글번호 or File 글번호)
	int postNum;

	// 글 타입(board 글번호 or QnA or File)
	int postType;

}
