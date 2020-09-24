package com.project.study.exception.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;

@ControllerAdvice
public class GlobalExceptionController {
	@ExceptionHandler(MaxUploadSizeExceededException.class)
	public String handleException(MaxUploadSizeExceededException e) {
		return "redirect:/error/fileSizeError";
	}
}
