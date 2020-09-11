package com.project.study.comment.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.study.comment.model.CommentVO;

@Repository
public class CommentRepository implements ICommentRepository{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<CommentVO> getCommentList(int postNum) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("commentDAO.getCommentList", postNum);
	}

	@Override
	public void insertComment(CommentVO comment) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("commentDAO.insertComment", comment);
	}

	@Override
	public void updateComment(CommentVO comment) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("commentDAO.updateComment", comment);
	}

	@Override
	public void deleteComment(int commentNum) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("commentDAO.deleteComment", commentNum);
	}

}
