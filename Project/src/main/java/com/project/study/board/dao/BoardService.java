package com.project.study.board.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.study.board.model.BoardVO;

@Service
public class BoardService implements IBoardService {

	@Autowired
	private IBoardRepository boardRepository;
	
	@Override
	public int getBoardCount(String studyType) {
		// TODO Auto-generated method stub
		return boardRepository.getBoardCount(studyType);
	}

	@Override
	public List<BoardVO> getBoardList(String studyType, int page) {
		// TODO Auto-generated method stub
		return boardRepository.getBoardList(studyType, page);
	}

	@Override
	public BoardVO getBoard(int num) {
		// TODO Auto-generated method stub
		return boardRepository.getBoard(num);
	}

	@Override
	public List<BoardVO> searchBoard(String searchOption, String keyword, String studyType) {
		// TODO Auto-generated method stub
		return boardRepository.searchBoard(searchOption, keyword, studyType);
	}

	@Override
	public int countBoard(String searchOption, String keyword, String studyType) {
		// TODO Auto-generated method stub
		return boardRepository.countBoard(searchOption, keyword, studyType);
	}

	@Transactional("txManager")
	@Override
	public void insertBoard(BoardVO board) {
		// TODO Auto-generated method stub
		boardRepository.insertBoard(board);

	}

	@Transactional("txManager")
	@Override
	public void updateBoard(BoardVO board) {
		// TODO Auto-generated method stub
		boardRepository.updateBoard(board);
	}

	@Transactional("txManager")
	@Override
	public void updateCloseBoard(char enabled, int boardNum) {
		// TODO Auto-generated method stub
		boardRepository.updateCloseBoard(enabled, boardNum);
	}

	@Transactional("txManager")
	@Override
	public void increaseViews(int num) {
		// TODO Auto-generated method stub
		boardRepository.increaseViews(num);
	}
	
	@Override
	public int getLikeCount(int boardNum) {
		// TODO Auto-generated method stub
		return boardRepository.getLikeCount(boardNum);
	}
	
	@Override
	public boolean checkLike(int boardNum, String userId) {
		// TODO Auto-generated method stub
		return boardRepository.checkLike(boardNum, userId);
	}
	
	@Transactional("txManager")
	@Override
	public void insertLike(int boardNum, String userId) {
		// TODO Auto-generated method stub
		boardRepository.insertLike(boardNum, userId);
	}

	@Transactional("txManager")
	@Override
	public void deleteLike(int boardNum, String userId) {
		// TODO Auto-generated method stub
		boardRepository.deleteLike(boardNum, userId);
	}
	
	@Transactional("txManager")
	@Override
	public void increaseLikes(int boardNum) {
		// TODO Auto-generated method stub
		boardRepository.increaseLikes(boardNum);
	}
	
	@Transactional("txManager")
	@Override
	public void decreaseLikes(int boardNum) {
		// TODO Auto-generated method stub
		boardRepository.decreaseLikes(boardNum);
	}

	@Override
	public int getMaxBoardNum() {
		// TODO Auto-generated method stub
		return boardRepository.getMaxBoardNum();
	}

	@Override
	public List<HashMap<String, Object>> gettTop3Study(String studyType) {
		// TODO Auto-generated method stub
		return boardRepository.gettTop3Study(studyType);
	}
}
