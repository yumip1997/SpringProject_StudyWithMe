package com.project.study.exception.controller;

import java.io.IOException;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@ControllerAdvice
public class GlobalExceptionHandler {

   //CommonsMultipartResolver
    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public String handleFileSize(MaxUploadSizeExceededException e) throws IOException {
    	return "forward:/error/fileSizeError";
    }
    
    @PostMapping("/error/fieSizeError")
    public String handle2(){
    	return "/error/fileSizeError";
    }
}
