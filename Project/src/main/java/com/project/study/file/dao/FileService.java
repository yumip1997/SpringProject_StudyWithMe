package com.project.study.file.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.study.file.model.FileVO;

@Service
public class FileService implements IFileService{
	
	@Autowired
	IFileRepository fileRepository;

	@Override
	public List<FileVO> getFileList(int boardNum) {
		// TODO Auto-generated method stub
		return fileRepository.getFileList(boardNum);
	}

	@Override
	public FileVO getFile(int fileNum) {
		// TODO Auto-generated method stub
		return fileRepository.getFile(fileNum);
	}

	@Override
	public void uploadFile(FileVO file) {
		// TODO Auto-generated method stub
		fileRepository.uploadFile(file);
	}

	@Override
	public void updateFile(FileVO file) {
		// TODO Auto-generated method stub
		fileRepository.updateFile(file);
	}

	@Override
	public void deleteFile(int fileNum) {
		// TODO Auto-generated method stub
		fileRepository.deleteFile(fileNum);
	}

}
