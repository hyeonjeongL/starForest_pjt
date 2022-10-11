package com.itwill.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		
		
		return "categoryList";
	}
	
//	@RequestMapping("/club_user_list")
//	public String club_user_list(HttpServletRequest request) {
//		String forwardPath="";
//		try {
//			String sUserId=(String)request.getSession().getAttribute("sUserId");
//			request.setAttribute("sUserId", sUserId);
//			List<BookClub> clubUserList=bookClubService.selectById(sUserId);
//			request.setAttribute("clubUserList", clubUserList);
//			forwardPath="forward:/WEB-INF/views/MyPage_Folder.jsp";
//			
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		
//		return forwardPath;
//	}
	@RequestMapping("/club_write_form")
	public String club_write_form(@ModelAttribute BookClub bookClub,HttpServletRequest request) {
		String forwardPath="";
		try {
			String sUserId=(String)request.getSession().getAttribute("sUserId");
			request.setAttribute("sUserId", sUserId);
			forwardPath="bookclub_write_form";
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return forwardPath;
	}
	
	
	
	
	
	
}
