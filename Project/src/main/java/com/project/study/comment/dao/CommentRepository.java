package com.project.study.comment.dao;

import java.util.HashMap;
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
	public List<CommentVO> getCommentList(int postNum, String postType) {
		// TODO Auto-generated method stub
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("postNum", postNum);
		map.put("postType", postType);
		return sqlSessionTemplate.selectList("commentDAO.getCommentList", map);
	}
	
	@Override
	public CommentVO getComment(int commentNum) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("commentDAO.getComment", commentNum);
	}
	
	@Override
	public int getMaxCommentNum() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("commentDAO.getMaxCommentNum");
	}

	@Override
	public int getMaxGroupOrder(int parentNum) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("commentDAO.getMaxGroupOrder", parentNum);
	}

	@Override
	public void insertComment(CommentVO comment) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("commentDAO.insertComment", comment);
	}
	
	@Override
	public void insertReply(CommentVO comment) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("commentDAO.insertReply", comment);
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

	@Override
	public int getCountComment(int postNum) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("commentDAO.getCountComment", postNum);
	}

	

}
