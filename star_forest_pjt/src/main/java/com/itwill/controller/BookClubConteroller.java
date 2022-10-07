package com.itwill.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.domain.BookClub;
import com.itwill.service.BookClubService;

@Controller
public class BookClubConteroller {
	@Autowired
	private BookClubService bookClubService;
	
	@RequestMapping("/club_category_list")
	public String category_list(int category_no,HttpServletRequest request) throws Exception {
		String forwardPath="";
		
		List<BookClub> categoryList = bookClubService.selectByCategory(category_no);
		request.setAttribute("categoryList", categoryList);
		
		
		return "bookclub";
	}
}
