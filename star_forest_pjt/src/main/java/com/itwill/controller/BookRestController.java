package com.itwill.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.domain.Book;
import com.itwill.mapper.BookMapper;
import com.itwill.service.BookService;

@RestController
public class BookRestController {
	
	@Autowired(required = true)
	private BookService bookService;
	
//	@RequestMapping("/main")
//	public Map test() {
//		Map mm = new HashMap();
//		mm.put("book_no", 1000);
//		System.out.println("test");
//		return mm;
//	}
//	
//	@RequestMapping("test")
//	public List<Book> selectAll() throws Exception{
//		List<Book> bookList = bookService.selectAll();
//		return bookList;
//	}

	
	


}