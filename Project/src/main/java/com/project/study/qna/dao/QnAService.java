package com.project.study.qna.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.study.qna.model.QnAVO;

@Service
public class QnAService implements IQnAService{
	
	@Autowired
	IQnARepository QnARepository;

	@Override
	public List<QnAVO> getQnAList(int boardNum) {
		// TODO Auto-generated method stub
		return QnARepository.getQnAList(boardNum);
	}

	@Override
	public QnAVO getQnA(int qnaNum) {
		// TODO Auto-generated method stub
		return QnARepository.getQnA(qnaNum);
	}

	@Transactional("txManager")
	@Override
	public void insertQnA(QnAVO qnaVO) {
		// TODO Auto-generated method stub
		QnARepository.insertQnA(qnaVO);
		
	}

	@Transactional("txManager")
	@Override
	public void updateQnA(QnAVO qnaVO) {
		// TODO Auto-generated method stub
		QnARepository.updateQnA(qnaVO);
	}

	@Transactional("txManager")
	@Override
	public void deleteQnA(int qnaNum) {
		// TODO Auto-generated method stub
		QnARepository.deleteQnA(qnaNum);
		
	}

	@Transactional("txManager")
	@Override
	public void increaseViews(int qnaNum) {
		// TODO Auto-generated method stub
		QnARepository.increaseViews(qnaNum);
	}

}
