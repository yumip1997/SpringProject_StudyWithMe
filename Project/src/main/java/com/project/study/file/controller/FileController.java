package com.project.study.file.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.study.file.dao.IFileService;

@Controller
@RequestMapping("/file")
public class FileController {

	@Autowired
	IFileService fileService;
	
	@GetMapping("/fileList")
	public String fileList(Model model, @RequestParam("boardNum")int boardNum) {
		model.addAttribute("list", fileService.getFileList(boardNum));
		return "/study/file/fileList";
	}
	
	@GetMapping("/insertFile")
	public String insertFile() {
		return "/study/file/insertFile";
	}
	
}
