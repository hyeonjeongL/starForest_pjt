package com.itwill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.service.UserService;

@Controller
public class UserInfoController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login_form")
	public String login_form() {
		return "forward:/WEB-INF/views/login.jsp";
	}
}
