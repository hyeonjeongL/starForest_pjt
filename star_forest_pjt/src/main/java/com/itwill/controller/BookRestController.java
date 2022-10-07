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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.domain.Book;
import com.itwill.mapper.BookMapper;
import com.itwill.service.BookService;

@RestController
public class BookRestController {

	@Autowired(required = true)
	private BookService bookService;

	@RequestMapping("/rest_book_detail")
	public Book book_detail(@RequestParam(value = "book_no", required = false) String book_noStr, Model model) throws Exception {

		Book book = bookService.selectBookDetail(Integer.parseInt(book_noStr));

		return book;
	}

}