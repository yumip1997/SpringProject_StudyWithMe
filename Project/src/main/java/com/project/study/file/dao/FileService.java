package com.project.study.file.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.study.file.model.FileVO;

@Service
public class FileService implements IFileService{
	
	@Autowired
	IFileRepository fileRepository;
	
	@Override
	public int getFileCount(int boardNum) {
		// TODO Auto-generated method stub
		return fileRepository.getFileCount(boardNum);
	}


	@Override
	public List<FileVO> getFileList(int boardNum, int page) {
		// TODO Auto-generated method stub
		return fileRepository.getFileList(boardNum, page);
	}

	@Override
	public FileVO getFile(int fileNum) {
		// TODO Auto-generated method stub
		return fileRepository.getFile(fileNum);
	}
	
	@Override
	public List<FileVO> searchFile(String searchOption, String keyword, int boardNum) {
		// TODO Auto-generated method stub
		return fileRepository.searchFile(searchOption, keyword, boardNum);
	}

	@Override
	public int countFile(String searchOption, String keyword, int boardNum) {
		// TODO Auto-generated method stub
		return fileRepository.countFile(searchOption, keyword, boardNum);
	}
	
	@Transactional("txManager")
	@Override
	public void uploadFile(FileVO file) {
		// TODO Auto-generated method stub
		fileRepository.uploadFile(file);
	}
	@Transactional("txManager")
	@Override
	public void updateFile(FileVO file) {
		// TODO Auto-generated method stub
		fileRepository.updateFile(file);
	}
	
	@Transactional("txManager")
	@Override
	public void deleteFile(int fileNum) {
		// TODO Auto-generated method stub
		fileRepository.deleteFile(fileNum);
	}
}
