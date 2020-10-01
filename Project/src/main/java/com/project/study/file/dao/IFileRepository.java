package com.project.study.file.dao;

import java.util.List;

import com.project.study.file.model.FileVO;

public interface IFileRepository {

	//스터디 별 파일 전체 개수
	public int getFileCount(int boardNum);
	
	// 스터디 별 파일 목록
	public List<FileVO> getFileList(int boardNum, int page);
	
	//파일 상세조회
	public FileVO getFile(int fileNum);
	
	//파일 검색
	public List<FileVO> searchFile(String searchOption, String keyword, int boardNum);
	
	//검색 된 파일 개수
	public int countFile(String searchOption, String keyword, int boardNum);

	// 파일 업로드
	public void uploadFile(FileVO file);

	// 파일 수정
	public void updateFile(FileVO file);

	// 파일 삭제
	public void deleteFile(int fileNum);
	
	//특정 스터디의 전체 파일 목록 삭제 
	public void deleteFileList(int boardNum);
}
