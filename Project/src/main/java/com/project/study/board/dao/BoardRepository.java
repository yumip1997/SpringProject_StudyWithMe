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
	public int getBoardCount(String studyType) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("studyType", studyType);
		return sqlSessionTemplate.selectOne("boardDAO.getBoardCount", map);
	}

	@Override
	public List<BoardVO> getBoardList(String studyType, String listOption, int page) {
		// TODO Auto-generated method stub
		int start = (page-1)*10;
		int end = start+10;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("studyType", studyType);
		map.put("listOption", listOption);
		map.put("start",start);
		map.put("end", end);
		return sqlSessionTemplate.selectList("boardDAO.getBoardList", map);
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
	public void increaseViews(int num) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("boardDAO.increaseViews", num);
	}
	
	@Override
	public int getLikeCount(int boardNum) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("likeDAO.getLikeCount", boardNum);
	}
	
	@Override
	public boolean checkLike(int boardNum, String userId) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", boardNum);
		map.put("userId", userId);
		return sqlSessionTemplate.selectOne("likeDAO.checkLike", map);
	}
	
	@Override
	public void insertLike(int boardNum, String userId) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", boardNum);
		map.put("userId", userId);
		sqlSessionTemplate.insert("likeDAO.insertLike", map);
	}

	@Override
	public void deleteLike(int boardNum, String userId) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", boardNum);
		map.put("userId", userId);
		sqlSessionTemplate.delete("likeDAO.deleteLike", map);
	}
	
	@Override
	public void increaseLikes(int boardNum) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("likeDAO.increaseLikes", boardNum);
	}

	@Override
	public void decreaseLikes(int boardNum) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("likeDAO.decreaseLikes", boardNum);
	}
	
	@Override
	public int getMaxBoardNum() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("boardDAO.getMaxBoardNum");
	}

	@Override
	public List<HashMap<String, Object>> gettTop3Study(String studyType) {
		// TODO Auto-generated method stub
		//boardDAO.getTop3Study에서 파라미터로 studyType을 설정
		//HashMap으로 설정해주어 getter로 값을 불러올 수 있도록 하기 위해 (String으로 보내면 getter가 없기에 오류)
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("studyType", studyType);
		return sqlSessionTemplate.selectList("boardDAO.gettTop3Study", map);
	}

	@Override
	public void deleteBoard(int boardNum) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("boardDAO.deleteBoard", boardNum);
	}

	@Override
	public void deleteLikeList(int boardNum) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("likeDAO.deleteLikeList", boardNum);
	}

	
	
}
