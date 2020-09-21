package com.project.study.board.dao;

import java.util.HashMap;
import java.util.List;

import com.project.study.board.model.BoardVO;


public interface IBoardService {
	// 스터디 모집 글 전체 개수
	public int getBoardCount(String studyType);

	// 스터디 모집 글 목록 && 타입에 따른 목록
	public List<BoardVO> getBoardList(String studyType, int page);

	// 스터디 모집 글 상세조회
	public BoardVO getBoard(int num);

	// 스터디 모집 글 검색
	public List<BoardVO> searchBoard(String searchOption, String keyword, String studyType);

	// 검색된 스터디의 개수
	public int countBoard(String searchOption, String keyword, String studyType);

	// 스터디 모집 글 삽입
	public void insertBoard(BoardVO board);

	// 스터디 모집 글 수정
	public void updateBoard(BoardVO board);

	// 스터디 모집 마감 여부 변경
	public void updateCloseBoard(char enabled, int boardNum);

	// 조회수 증가
	public void increaseViews(int num);

	// 좋아요 수 가져오기
	public int getLikeCount(int boardNum);

	// 좋아요 여부 체크
	public boolean checkLike(int boardNum, String userId);

	// 좋아요 like_table 테이블에 반영
	public void insertLike(int boardNum, String userId);

	// 좋아요 like_table 테이블에 반영 취소
	public void deleteLike(int boardNum, String userId);

	// 좋아요 board테이블에 반영
	public void increaseLikes(int boardNum);

	// 좋아요 board테이블에 반영 취소
	public void decreaseLikes(int boardNum);

	// 스터디 모집 글 번호의 최대 값
	public int getMaxBoardNum();

	// 스터디 타입별 qna 개수, file개수 기준으로 총 개수가 많은 순으로 3개 스터디 목록
	public List<HashMap<String, Object>> gettTop3Study(String studyType);
}
