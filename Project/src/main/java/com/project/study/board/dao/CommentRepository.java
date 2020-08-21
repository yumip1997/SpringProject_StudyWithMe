package com.project.study.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.study.board.model.CommentVO;

@Repository
public class CommentRepository implements ICommentRepository{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	@Override
	public List<CommentVO> getCommentList(int num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("commentDAO.getCommentList", num);
	}


	@Override
	public void insertComment(CommentVO comment) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("commentDAO.insertComment", comment);
		
	}

}
