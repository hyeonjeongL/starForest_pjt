package com.itwill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.service.BookService;


@Controller
public class testController {
	@Autowired
	BookService BookService;
	
	@RequestMapping("\bookCart")
	public String test1() {
		System.out.println("test");
		return "bookCart";
	}
	@RequestMapping("\borrowList")
	public String test2() {
		System.out.println("test");
		return "borrowList";
	}
	@RequestMapping("\\postDetail")
	public String test3() {
		System.out.println("test");
		return "postDetail";
	}
	@RequestMapping("\\detailBook")
	public String test4() {
		System.out.println("test");
		return "detailBook";
	}


}