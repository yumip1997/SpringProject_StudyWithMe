package com.project.study.study.dao;

import java.util.HashMap;
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
		return sqlSessionTemplate.selectOne("studyDAO.checkDuplication", study);
	}

	@Override
	public List<StudyDetailVO> getStudyListByMem(String userId, int page) {
		// TODO Auto-generated method stub
		int start = (page-1)*10;
		int end = start+10;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("start", start);
		map.put("end", end);
		
		return sqlSessionTemplate.selectList("studyDAO.getStudyListByMem", map);
	}

	@Override
	public int getCountStudyByMem(String userId) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("studyDAO.getCountStudyByMem", userId);
	}
}
