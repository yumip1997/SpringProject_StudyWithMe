package com.project.study.board.dao;

import java.util.List;

import com.project.study.board.model.BoardVO;

public interface IBoardService {
	// 스터디 모집 글 전체 목록보기
	public List<BoardVO> getBoardList();

	// 스터디 타입에 따른 스터디 모집 글 목록보기
	public List<BoardVO> getBoardListByType(String studyType);

	// 스터디 모집 글 상세조회
	public BoardVO getBoard(int num);

	// 스터디 모집 글 검색
	public List<BoardVO> searchBoard(String searchOption, String keyword, String studyType);

	// 검색된 스터디의 갯수
	public int countBoard(String searchOption, String keyword, String studyType);

	// 스터디 모집 글 삽입
	public void insertBoard(BoardVO board);

	// 스터디 모집 글 수정
	public void updateBoard(BoardVO board);

	// 스터디 모집 마감 여부 변경
	public void updateCloseBoard(char enabled, int boardNum);

	// 특정 회원의 게시글 삭제
	public void deleteBoardbyMem(String userId);

	// 조회수 증가
	public void increaseViews(int num);

	// 스터디 모집 글 번호의 최대 값
	public int getMaxBoardNum();
}
