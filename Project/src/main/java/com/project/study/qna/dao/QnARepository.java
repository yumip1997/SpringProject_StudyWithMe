package com.project.study.qna.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.study.qna.model.QnAVO;

@Repository
public class QnARepository implements IQnARepository{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	@Override
	public List<QnAVO> getQnAList(int boardNum) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("qnaDAO.getQnAList",boardNum);
	}

	@Override
	public QnAVO getQnA(int qnaNum) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("qnaDAO.getQnA", qnaNum);
	}
	
	@Override
	public List<QnAVO> searchQnA(String searchOption, String keyword, int boardNum) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("boardNum", boardNum);
		return sqlSessionTemplate.selectList("qnaDAO.searchQnA", map);
	}

	@Override
	public int countQnA(String searchOption, String keyword, int boardNum) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("boardNum", boardNum);
		return sqlSessionTemplate.selectOne("qnaDAO.countQnA", map);
	}

	@Override
	public void insertQnA(QnAVO qnaVO) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("qnaDAO.insertQnA", qnaVO);
	}

	@Override
	public void updateQnA(QnAVO qnaVO) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("qnaDAO.updateQnA", qnaVO);
	}

	@Override
	public void deleteQnA(int qnaNum) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("qnaDAO.deleteQnA", qnaNum);
	}

	@Override
	public void increaseViews(int qnaNum) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("qnaDAO.increaseViews", qnaNum);	
	}

}
