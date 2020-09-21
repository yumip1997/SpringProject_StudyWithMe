package com.project.study.exception.controller;

import java.io.IOException;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import org.springframework.web.multipart.MaxUploadSizeExceededException;

@ControllerAdvice
public class GlobalExceptionHandler {

   //CommonsMultipartResolver
    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public String handleFileSize(MaxUploadSizeExceededException e) throws IOException {
    	return "redirect:/study/file/insertFile";
    }
   
}
