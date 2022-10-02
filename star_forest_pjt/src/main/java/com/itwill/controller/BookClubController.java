package com.itwill.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.domain.BookClub;
import com.itwill.service.BookClubService;

@Controller
public class BookClubController {
	@Autowired
	private BookClubService bookClubService;
	
	//동아리 리스트(메인화면)
	@RequestMapping("/club_list")
	public String club_list(Model model) throws Exception {
		List<BookClub> clubList=bookClubService.selectAll();
		model.addAttribute("clubList",clubList);
		
		return "clubList";
	}
	
	
}
