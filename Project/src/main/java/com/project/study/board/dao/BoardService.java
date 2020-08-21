package com.project.study.board.dao;

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
	public List<BoardVO> getBoardList() {
		// TODO Auto-generated method stub
		return boardRepository.getBoardList();
	}
	
	@Override
	public List<BoardVO> getBoardListByType(String studyType) {
		// TODO Auto-generated method stub
		return boardRepository.getBoardListByType(studyType);
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
	public void deleteBoardbyMem(String userId) {
		// TODO Auto-generated method stub
		boardRepository.deleteBoardbyMem(userId);
	}

	@Transactional("txManager")
	@Override
	public void increaseViews(int num) {
		// TODO Auto-generated method stub
		boardRepository.increaseViews(num);
	}

	@Override
	public int getMaxBoardNum() {
		// TODO Auto-generated method stub
		return boardRepository.getMaxBoardNum();
	}
}
