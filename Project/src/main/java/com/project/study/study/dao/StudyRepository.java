package com.project.study.study.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.study.study.model.StudyDetailVO;
import com.project.study.study.model.StudyVO;

@Repository
public class StudyRepository implements IStudyRepository{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertStudy(StudyVO study) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("studyDAO.insertStudy", study);
	}

	@Override
	public boolean checkDuplication(StudyVO study) {
		// TODO Auto-generated method stub
		Integer a = sqlSessionTemplate.selectOne("studyDAO.checkDuplication", study);
		return a==0 ? true : false;
	}

	@Override
	public List<StudyDetailVO> getStudyListByMem(String userId) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("studyDAO.getStudyListByMem", userId);
	}


}
