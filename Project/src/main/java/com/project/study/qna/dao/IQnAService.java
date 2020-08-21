package com.project.study.qna.dao;

import java.util.List;

import com.project.study.qna.model.QnAVO;

public interface IQnAService {

	// 스터디 별 QnA 목록
	List<QnAVO> getQnAList(int boardNum);

	// QnA 상세조회
	QnAVO getQnA(int qnaNum);

	// QnA 삽입
	void insertQnA(QnAVO qnaVO);

	// QnA 수정
	void updateQnA(QnAVO qnaVO);

	// QnA 삭제
	void deleteQnA(int qnaNum);

	// QnA 조회수 올리기
	void increaseViews(int qnaNum);

}
