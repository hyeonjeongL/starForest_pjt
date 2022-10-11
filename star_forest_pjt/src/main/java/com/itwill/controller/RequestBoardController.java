package com.itwill.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.domain.BookCategory;
import com.itwill.domain.RequestBoard;
import com.itwill.domain.SeatReservation;
import com.itwill.service.RequestBoardService;

@Controller
public class RequestBoardController {
	@Autowired
	private RequestBoardService requestBoardService;
	@RequestMapping("/requestBoard")
	public String requestBoard_main(HttpSession session) {
			String sUserId =(String)session.getAttribute("sUserId");
			String admin="admin";
		if(sUserId.equals(admin)) {
			return "forward:/WEB-INF/views/requestBoard_admin.jsp";
		}else {
			return "forward:/WEB-INF/views/requestBoard.jsp";
		}
		
	}

	@RequestMapping("/requestBoard_write_form")
	public String requestCategory_list(HttpServletRequest request,HttpSession session) {
		String forwardPath="";
		try {
			String sUserId = (String)session.getAttribute("sUserId");
			request.setAttribute("sUserId", sUserId);
			
			List<BookCategory> categoryList = requestBoardService.selectCategoryAll();
			request.setAttribute("categoryList", categoryList);
			forwardPath="forward:/WEB-INF/views/requestBoard_write_form.jsp";
		}catch (Exception e) {
			e.printStackTrace();
		}
		return forwardPath;
	}

}
