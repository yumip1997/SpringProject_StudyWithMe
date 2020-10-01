package com.project.study.study.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.study.study.model.StudyDetailVO;
import com.project.study.study.model.StudyVO;

@Service
public class StudyService implements IStudyService{
	
	@Autowired
	private IStudyRepository studyRepository;

	@Override
	public void insertStudy(StudyVO study) {
		// TODO Auto-generated method stub
		studyRepository.insertStudy(study);
	}

	@Override
	public boolean checkDuplication(StudyVO study) {
		// TODO Auto-generated method stub
		return studyRepository.checkDuplication(study);
	}

	@Override
	public List<StudyDetailVO> getStudyListByMem(String userId, int page) {
		// TODO Auto-generated method stub
		return studyRepository.getStudyListByMem(userId, page);
	}

	@Override
	public int getCountStudyByMem(String userId) {
		// TODO Auto-generated method stub
		return studyRepository.getCountStudyByMem(userId);
	}

	@Override
	public void deleteStudyMem(int boardNum) {
		// TODO Auto-generated method stub
		studyRepository.deleteStudyMem(boardNum);
	}
}
