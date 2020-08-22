package com.project.study.file.controller;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.study.file.dao.IFileService;
import com.project.study.file.model.FileVO;

@Controller
@RequestMapping("/file")
public class FileController {

	@Autowired
	IFileService fileService;
	
	@GetMapping("/fileList/{boardNum}")
	public String fileList(Model model, @PathVariable("boardNum")int boardNum) {
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("list", fileService.getFileList(boardNum));
		return "/study/file/fileList";
	}
	
	@GetMapping("/insertFile/{boardNum}")
	public String insertFile(Model model, @PathVariable("boardNum")int boardNum) {
		FileVO file = new FileVO();
		file.setBoardNum(boardNum);
		model.addAttribute("file", file);
		return "/study/file/insertFile";
	}
	
	@PostMapping("/insertFile")
	String insertQnA(@ModelAttribute("file")@Valid FileVO newfile,
			BindingResult result, Principal principal, @RequestParam("boardNum")int boardNum) {
		
		if(result.hasErrors()) {
			return "/study/file/insertFile";
		}
		
		return "redirect:/file/fileList/"+boardNum;
	}
	
	
}
