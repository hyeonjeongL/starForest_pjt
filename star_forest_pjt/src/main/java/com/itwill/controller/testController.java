package com.itwill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.service.BookService;


@Controller
public class testController {
	@Autowired
	BookService BookService;
	
	@RequestMapping("/bookCart.do")
	public String test1() {
		System.out.println("test");
		return "bookCart";
	}
	@RequestMapping("/borrowList.do")
	public String test2() {
		System.out.println("test");
		return "borrowList";
	}
	@RequestMapping("/postDetail.do")
	public String test3() {
		System.out.println("test");
		return "postDetail";
	}
	@RequestMapping("/loginPage.do")
	public String test4() {
		System.out.println("test");
		return "loginPage.do";
	}
	@RequestMapping("/detailBook.do")
	public String test5() {
		System.out.println("test");
		return "detailBook";
	}
	@RequestMapping("/faqViewpage.do")
	public String test6() {
		System.out.println("test");
		return "faqViewpage";
	}
	@RequestMapping("/findEmail.do")
	public String test7() {
		System.out.println("test");
		return "findEmail";
	}
	@RequestMapping("/Home.do")
	public String test8() {
		System.out.println("test");
		return "Home";
	}
	@RequestMapping("/MyLibrary.do")
	public String test9() {
		System.out.println("test");
		return "MyLibrary";
	}


}