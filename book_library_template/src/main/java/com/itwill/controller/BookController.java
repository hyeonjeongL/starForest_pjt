package com.itwill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.service.BookService;
import com.itwill.service.BookServiceImpl;


@Controller
public class BookController {
	@Autowired
	BookServiceImpl service;
	
	@RequestMapping("\test")
	public String test() {
		System.out.println("test");
		return "index";
	}

}