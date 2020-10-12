package com.project.study.file.controller;

import java.io.IOException;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.study.board.dao.IBoardService;
import com.project.study.comment.dao.ICommentService;
import com.project.study.file.dao.IFileService;
import com.project.study.file.model.FileVO;
import com.project.study.util.PageMaker;

@Controller
@PreAuthorize("isAuthenticated() and hasAnyRole('ROLE_USER','ROLE_ADMIN')")
@RequestMapping("/file")
public class FileController {

	@Autowired
	IFileService fileService;
	
	@Autowired
	IBoardService boardService;
	
	@Autowired
	ICommentService commentService;
	
	@GetMapping("/fileList/{boardNum}")
	public String fileList(Model model, @PathVariable("boardNum")int boardNum,
			@RequestParam(required=false, defaultValue="1")int page) {
		
		String studyTitle = boardService.getBoard(boardNum).getStudyTitle();
		model.addAttribute("fileList", fileService.getFileList(boardNum, page));
		model.addAttribute("pageMaker", new PageMaker(fileService.getFileCount(boardNum), page));
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("studyTitle", studyTitle);
		
		return "/study/file/fileList";
	}
	
	@GetMapping("/{fileNum}")
	public String viewFile(Model model, @PathVariable("fileNum")int fileNum) {
		model.addAttribute("file", fileService.getFile(fileNum));
		return "/study/file/fileView";
	}
	
	@PostMapping("/search")
	public String searchFile(Model model, @RequestParam("searchOption") String searchOption,
			@RequestParam("keyword") String keyword, @RequestParam("boardNum") int boardNum) {
		String studyTitle = boardService.getBoard(boardNum).getStudyTitle();
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("studyTitle", studyTitle);
		model.addAttribute("fileList", fileService.searchFile(searchOption, keyword, boardNum));
		model.addAttribute("count", fileService.countFile(searchOption, keyword, boardNum));
		return "/study/file/fileList";
	}
	
	
	@GetMapping("/download/{fileNum}")
	public ResponseEntity<byte[]> downloadFile(@PathVariable("fileNum")int fileNum) {
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
			@RequestParam("uploadedFile")MultipartFile uploadedFile,
			BindingResult result,
			RedirectAttributes redirectAttrs){

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if(result.hasErrors()) {
			return "/study/file/insertFile";
		}
		
		try {
			if(uploadedFile != null && !(uploadedFile.isEmpty())) {
				file.setFileTitle(file.getFileTitle());
				file.setFileContent(file.getFileContent());
				file.setFileSize(uploadedFile.getSize());
				file.setFileName(uploadedFile.getOriginalFilename());
				file.setFileContentType(uploadedFile.getContentType());
				file.setFileData(uploadedFile.getBytes());
				file.setUserId(auth.getName());
				fileService.uploadFile(file);
			}
		}catch(IOException e) {
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/file/fileList/"+file.getBoardNum();
	}
	
	@PostMapping("/updateFile")
	String updateFilePage(Model model, @RequestParam("fileNum")int fileNum) {
		model.addAttribute("file", fileService.getFile(fileNum));
		return "/study/file/updateFile";
	}
	
	@PostMapping("/deleteFile")
	String deleteFile(@RequestParam("fileNum")int fileNum, @RequestParam("boardNum")int boardNum) {
		commentService.deleteComListByType(fileNum, "file");
		fileService.deleteFile(fileNum);
		return "redirect:/file/fileList/" + boardNum;
	}
	
	
	
}
