package com.project.study.file.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.study.file.model.FileVO;

@Repository
public class FileRepository implements IFileRepository{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<FileVO> getFileList(int boardNum) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("fileDAO.getFileList", boardNum);
	}
	
	@Override
	public FileVO getFile(int fileNum) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("fileDAO.getFile", fileNum);
	}
	

	@Override
	public List<FileVO> searchFile(String searchOption, String keyword, int boardNum) {
		// TODO Auto-generated method stub
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("boardNum", boardNum);
		return sqlSessionTemplate.selectList("fileDAO.searchFile", map);
	}

	@Override
	public int countFile(String searchOption, String keyword, int boardNum) {
		// TODO Auto-generated method stub
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("boardNum", boardNum);
		return sqlSessionTemplate.selectOne("fileDAO.countFile", map);
	}
	
	@Override
	public void uploadFile(FileVO file) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("fileDAO.uploadFile", file);
	}

	@Override
	public void updateFile(FileVO file) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("fileDAO.updateFile", file);
	}

	@Override
	public void deleteFile(int fileNum) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("fileDAO.deleteFile", fileNum);
	}


}
