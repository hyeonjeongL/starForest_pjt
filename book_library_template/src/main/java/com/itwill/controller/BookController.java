package com.itwill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.service.BookService;


@Controller
public class BookController {
	@Autowired
	BookService service;
	
	@RequestMapping("\test")
	public String test() {
		System.out.println("test");
		return "index";
	}

}
