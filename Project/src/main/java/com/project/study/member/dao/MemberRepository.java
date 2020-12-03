package com.project.study.member.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.study.member.model.MemberVO;

@Repository
public class MemberRepository implements IMemberRepository {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<MemberVO> getMemberList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("memberDAO.getMemberList");
	}
	
	@Override
	public void insertMember(MemberVO member) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("memberDAO.insertMember", member);
	}
	
	@Override
	public boolean checkIdDuplication(String userId) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("memberDAO.checkIdDuplication", userId);
	}

	@Override
	public MemberVO getMember(String userId) {
		// TODO Auto-generated method stub
		MemberVO member = (MemberVO) sqlSessionTemplate.selectOne("memberDAO.getMember", userId);
		return member;
	}

	@Override
	public String getPassword(String userId) {
		// TODO Auto-generated method stub
		String password = (String) sqlSessionTemplate.selectOne("memberDAO.getPassword", userId);
		return password;
	}
	
	@Override
	public void updateMember(MemberVO member) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("memberDAO.updateMember", member);
	}

	@Override
	public void updateEnabled(char enabled, String userId) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("enabled", enabled);
		map.put("userId", userId);
		sqlSessionTemplate.selectList("memberDAO.updateEnabled", map);
	}

	@Override
	public void updateAuth(String authority, String userId) {
		// TODO Auto-generated method stub
		HashMap<String, String>map = new HashMap<String, String>();
		map.put("authority", authority);
		map.put("userId", userId);
		sqlSessionTemplate.selectList("memberDAO.updateAuth", map);
	}

	@Override
	public void deleteMember(String userId) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("memberDAO.deleteMember", userId);
	}

}
