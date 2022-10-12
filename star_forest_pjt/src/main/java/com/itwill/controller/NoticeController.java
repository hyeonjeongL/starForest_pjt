package com.itwill.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.controller.interceptor.LoginCheck;
import com.itwill.domain.BookCategory;
import com.itwill.domain.Notice;
import com.itwill.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/notice_list")
	public String notice_list(HttpSession httpSession) throws Exception{
		try {
			List<Notice> noticeList = noticeService.selectAll();
			httpSession.setAttribute("noticeList", noticeList);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "notice_list";
	}
	
	@RequestMapping("/notice_write_form")
	public String notice_write_form(HttpServletRequest request,HttpSession session) {
		try {
			String admin = (String)session.getAttribute("admin");
			request.setAttribute("admin", admin);
			List<Notice> noticeList = noticeService.selectAll();
			request.setAttribute("noticeList",noticeList);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "notice_write_form";
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
