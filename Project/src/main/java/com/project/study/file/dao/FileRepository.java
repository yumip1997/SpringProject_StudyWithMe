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
	public int getFileCount(int boardNum) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("fileDAO.getFileCount", boardNum);
	}

	@Override
	public List<FileVO> getFileList(int boardNum, int page) {
		// TODO Auto-generated method stub
		int start = (page-1)*10;
		int end = start+10;
		HashMap<String, Integer>map = new HashMap<String, Integer>();
		map.put("boardNum", boardNum);
		map.put("start",start);
		map.put("end", end);
		return sqlSessionTemplate.selectList("fileDAO.getFileList", map);
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

	@Override
	public void deleteFileList(int boardNum) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("fileDAO.deleteFileList", boardNum);
	}
}
