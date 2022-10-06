package com.itwill.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itwill.domain.User;
import com.itwill.service.UserService;

@Controller
public class UserInfoController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/user")
	public String user() {
		return "user";
	}
	

	
}
