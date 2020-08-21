package com.project.study.study.dao;

import java.util.List;

import com.project.study.study.model.StudyDetailVO;
import com.project.study.study.model.StudyVO;

public interface IStudyRepository {
	
	//스터디 생성
	public void insertStudy(StudyVO study);
	
	//스터디 회원 중복확인
	public boolean checkDuplication(StudyVO study);
	
	//회원 별 스터디 목록
	public List<StudyDetailVO> getStudyListByMem(String userId);
}
