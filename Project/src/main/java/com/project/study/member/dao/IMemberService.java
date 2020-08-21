package com.project.study.member.dao;

import java.util.List;

import com.project.study.member.model.MemberVO;

public interface IMemberService {
	// 회원 목록
	List<MemberVO> getMemberList();

	// 회원 상세조회
	MemberVO getMember(String userId);

	// 회원가입
	void insertMember(MemberVO member);

	// 회원 비밀번호
	String getPassword(String userId);

	// 회원정보 수정
	void updateMember(MemberVO member);

	// 회원 활성화 상태 변경
	void updateEnabled(char enabled, String userId);

	// 권한 변경
	void updateAuth(String authority, String userId);

	// 회원탈퇴
	void deleteMember(String userId);
}
