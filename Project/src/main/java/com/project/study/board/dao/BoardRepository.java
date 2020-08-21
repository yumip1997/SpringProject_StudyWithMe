package com.project.study.board.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.study.board.model.BoardVO;

@Repository
public class BoardRepository implements IBoardRepository{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<BoardVO> getBoardList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("boardDAO.getBoardList");
	}
	
	@Override
	public List<BoardVO> getBoardListByType(String studyType) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("boardDAO.getBoardListbyType", studyType);
	}

	@Override
	public BoardVO getBoard(int num) {
		// TODO Auto-generated method stub
		BoardVO board = (BoardVO) sqlSessionTemplate.selectOne("boardDAO.getBoard", num);
		return board;
	}
	
	@Override
	public List<BoardVO> searchBoard(String searchOption, String keyword, String studyType) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("studyType", studyType);
		return sqlSessionTemplate.selectList("boardDAO.searchBoard", map);
	}

	@Override
	public int countBoard(String searchOption, String keyword, String studyType) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("studyType", studyType);
		return sqlSessionTemplate.selectOne("boardDAO.countBoard", map);
	}

	@Override
	public void insertBoard(BoardVO board) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("boardDAO.insertBoard", board);
		
	}

	@Override
	public void updateBoard(BoardVO board) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("boardDAO.updateBoard", board);
	}
	
	@Override
	public void updateCloseBoard(char enabled, int boardNum) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("enabled", enabled);
		map.put("boardNum", boardNum);
		sqlSessionTemplate.update("boardDAO.updateCloseBoard", map);
	}
	
	@Override
	public void deleteBoardbyMem(String userId) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("boardDAO.deleteBoardbyMem", userId);
	}

	@Override
	public void increaseViews(int num) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("boardDAO.increaseViews", num);
	}

	@Override
	public int getMaxBoardNum() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("boardDAO.getMaxBoardNum");
	}	
}
