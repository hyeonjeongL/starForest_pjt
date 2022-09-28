package com.itwill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.service.BookService;

@RestController
public class BookRestController {
	
	@Autowired(required = true)
	private BookService bookService;
	
	@RequestMapping("/main")
	public String test() {
		System.out.println("test");
		return "main";
	}
	
	


}