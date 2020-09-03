package com.project.study.file.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.study.board.dao.IBoardService;
import com.project.study.file.dao.IFileService;
import com.project.study.file.model.FileVO;

@Controller
@RequestMapping("/file")
public class FileController {

	@Autowired
	IFileService fileService;
	
	@Autowired
	IBoardService boardService;
	
	@GetMapping("/fileList/{boardNum}")
	public String fileList(Model model, @PathVariable("boardNum")int boardNum) {
		String studyTitle = boardService.getBoard(boardNum).getStudyTitle();
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("studyTitle", studyTitle);
		model.addAttribute("filelist", fileService.getFileList(boardNum));
		return "/study/file/fileList";
	}
	
	@GetMapping("/{fileNum}")
	public String viewFile(Model model, @PathVariable("fileNum")int fileNum) {
		model.addAttribute("file", fileService.getFile(fileNum));
		return "/study/file/fileView";
	}
	
	@GetMapping("/download/{fileNum}")
	public ResponseEntity<byte[]> downloadFile(@PathVariable("fileNum")int fileNum){
		FileVO file = fileService.getFile(fileNum);
		final HttpHeaders headers = new HttpHeaders();
		if(file !=null) {
			String[] mtypes = file.getFileContentType().split("/");
			headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
			headers.setContentDispositionFormData("attachment", file.getFileName());
			headers.setContentLength(file.getFileSize());
			return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
		}else {
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}
	}
	
	@GetMapping("/insertFile/{boardNum}")
	public String insertFile(Model model, @PathVariable("boardNum")int boardNum) {
		FileVO file = new FileVO();
		file.setBoardNum(boardNum);
		model.addAttribute("file", file);
		return "/study/file/insertFile";
	}
	
	@PostMapping("/insertFile")
	String insertFile(@ModelAttribute("file")@Valid FileVO file,
			BindingResult result,
			@RequestParam("uploadfile")MultipartFile uploadfile,
			RedirectAttributes redirectAttrs) throws UnsupportedEncodingException{
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		String fileTitle = new String(file.getFileTitle().getBytes("8859_1"),"utf-8");
		String fileContent = new String(file.getFileContent().getBytes("8859_1"), "utf-8");
		
		if(result.hasErrors()) {
			return "/study/file/insertFile";
		}
		
		if(uploadfile.getSize() > 15728640) {
			throw new MaxUploadSizeExceededException(15728640);
		}
		
		try {
			if(uploadfile !=null && !uploadfile.isEmpty()) {
				
				file.setFileTitle(fileTitle);
				file.setFileContent(fileContent);
				file.setFileSize(uploadfile.getSize());
				file.setFileName(uploadfile.getOriginalFilename());
				file.setFileContentType(uploadfile.getContentType());
				file.setFileData(uploadfile.getBytes());
				file.setUserId(auth.getName());
				fileService.uploadFile(file);
			}
		}catch(IOException e) {
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/file/fileList/"+file.getBoardNum();
	}
	
}
