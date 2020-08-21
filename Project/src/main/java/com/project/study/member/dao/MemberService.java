package com.project.study.member.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.study.member.model.MemberVO;

@Service
public class MemberService implements IMemberService{
	
	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public List<MemberVO> getMemberList() {
		// TODO Auto-generated method stub
		return memberRepository.getMemberList();
	}
	
	@Override
	public MemberVO getMember(String userId) {
		// TODO Auto-generated method stub
		return memberRepository.getMember(userId);
	}
	
	@Override
	@Transactional("txManager")
	public void insertMember(MemberVO member) {
		// TODO Auto-generated method stub
		memberRepository.insertMember(member);
	}

	@Override
	public String getPassword(String userId) {
		// TODO Auto-generated method stub
		return memberRepository.getPassword(userId);
	}
	
	@Override
	@Transactional("txManager")
	public void updateMember(MemberVO member) {
		// TODO Auto-generated method stub
		memberRepository.updateMember(member);
	}

	@Override
	@Transactional("txManager")
	public void updateEnabled(char enabled, String userId) {
		// TODO Auto-generated method stub
		memberRepository.updateEnabled(enabled, userId);
	}

	@Override
	@Transactional("txManager")
	public void updateAuth(String authority, String userId) {
		// TODO Auto-generated method stub
		memberRepository.updateAuth(authority, userId);
	}

	@Override
	@Transactional("txManager")
	public void deleteMember(String userId) {
		// TODO Auto-generated method stub
		memberRepository.deleteMember(userId);
	}
}
