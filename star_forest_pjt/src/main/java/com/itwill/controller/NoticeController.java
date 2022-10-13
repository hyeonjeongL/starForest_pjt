package com.itwill.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.controller.interceptor.LoginCheck;
import com.itwill.domain.BookCategory;
import com.itwill.domain.Notice;
import com.itwill.domain.PageMakerDto;
import com.itwill.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/notice_list")
	public String notice_list(@RequestParam(required = false, defaultValue = "1") Integer pageno,Model model) throws Exception{
		try {
			PageMakerDto<Notice> noticeList = noticeService.selectAll(pageno);
			model.addAttribute("noticeList",noticeList);
			model.addAttribute("pageno",pageno);
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "notice_list";
	}
	
	@RequestMapping("/notice_view")
	public String notice_view(@RequestParam Integer pageno, Integer notice_no, Model model) throws Exception{
		if(pageno==null || notice_no==null) {
			return "notice_list";
		}
		try {
			
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "notice_view";
	}
	
	@RequestMapping("/notice_write_form")
	public String notice_write_form(@ModelAttribute Notice notice, @RequestParam Integer pageno) {
		try {
			
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
