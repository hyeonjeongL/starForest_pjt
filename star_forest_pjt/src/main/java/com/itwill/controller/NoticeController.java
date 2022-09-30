package com.itwill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.controller.interceptor.LoginCheck;
import com.itwill.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/notice_list")
	public String notice_list() {
		return "notice_list";
	}
	
	@LoginCheck
	@RequestMapping("/notice_write_form")
	public String notice_write_form() {
		return "forward:/WEB-INF/views/notice_write_form";
	}
	
	@LoginCheck
	@RequestMapping("/notice_modify_action")
	public String notice_modify_action() {
		return "forward:/WEB-INF/views/notice_modify_action";
	}
	
	@LoginCheck
	@RequestMapping("/notice_remove_action")
	public String notice_remove_action() {
		return "forward:/WEB-INF/views/notice_remove_action";
	}
}
