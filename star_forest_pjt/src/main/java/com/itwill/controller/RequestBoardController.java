package com.itwill.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public String requestBoard_main() {
		return "forward:/WEB-INF/views/requestBoard.jsp";
	}

	@RequestMapping("/requestBoard_write_form")
	public String requestCategory_list(HttpServletRequest request) {
		String forwardPath="";
		try {
			List<BookCategory> categoryList = requestBoardService.selectCategoryAll();
			request.setAttribute("categoryList", categoryList);
			forwardPath="forward:/WEB-INF/views/requestBoard_write_form.jsp";
		}catch (Exception e) {
			e.printStackTrace();
		}
		return forwardPath;
	}
}
