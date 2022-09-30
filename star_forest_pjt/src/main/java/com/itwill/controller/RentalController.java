package com.itwill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.service.BookServiceImpl;

@Controller
public class RentalController {
	@Autowired
	BookServiceImpl service;
	
//	@RequestMapping(value = "detail")
//	public String test() {
//		System.out.println("test");
//		return "detail";
//	}
//	
	
}
