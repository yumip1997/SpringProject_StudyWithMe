package com.project.study.qna.dao;

import java.util.List;

import com.project.study.qna.model.QnAVO;

public interface IQnAService {

	// 스터디 별 QnA 목록
	public List<QnAVO> getQnAList(int boardNum);

	// QnA 상세조회
	public QnAVO getQnA(int qnaNum);

	// QnA 검색
	public List<QnAVO> searchQnA(String searchOption, String keyword, int boardNum);

	// 검색된 QnA 개수
	public int countQnA(String searchOption, String keyword, int boardNum);

	// QnA 삽입
	public void insertQnA(QnAVO qnaVO);

	// QnA 수정
	public void updateQnA(QnAVO qnaVO);

	// QnA 삭제
	public void deleteQnA(int qnaNum);

	// QnA 조회수 올리기
	public void increaseViews(int qnaNum);

}
