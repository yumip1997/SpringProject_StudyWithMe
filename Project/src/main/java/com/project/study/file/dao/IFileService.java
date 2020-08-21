package com.project.study.file.dao;

import java.util.List;

import com.project.study.file.model.FileVO;

public interface IFileService {

	// 스터디 별 파일 리스트
	List<FileVO> getFileList(int boardNum);

	// 파일 상세조회
	FileVO getFile(int fileNum);

	// 파일 업로드
	void uploadFile(FileVO file);

	// 파일 수정
	void updateFile(FileVO file);

	// 파일 삭제
	void deleteFile(int fileNum);

}
