package com.itwill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.service.RequestBoardService;

@Controller
public class RequestBoardController {
	@Autowired
	private RequestBoardService requestBoardService;
	@RequestMapping("/requestBoard")
	public String requestBoard_main() {
		return "forward:/WEB-INF/views/requestBoard.jsp";
	}
}
