package com.itwill.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.controller.interceptor.LoginCheck;
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
			Notice notice = noticeService.selectByNo(notice_no);
			noticeService.updateCount(notice_no);
			model.addAttribute("notice",notice);
			model.addAttribute("pageno",pageno);
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "notice_view";
	}
	
	@RequestMapping("/notice_write_form")
	public String notice_write_form(Notice notice,HttpSession session,Integer pageno,Model model) {
		try {
			String sUserId=(String)session.getAttribute("sUserId");
			if(pageno == null || sUserId != "admin") {
				return "notice_list";
			}
			noticeService.create(notice);
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "notice_write_form";
	}
	
	@LoginCheck
	@RequestMapping("/notice_modify_action")
	public String notice_modify_action(@RequestParam Map<String, String> params,HttpSession session) throws Exception{

			String pageno = params.get("pageno");
			String notice_no = params.get("notice_no");
			String sUserId=(String)session.getAttribute("sUserId");
			if(pageno == null || notice_no == null || sUserId != "admin") {
				return "notice_list";
			}
			Notice notice = new Notice();
			notice.setNotice_no(Integer.parseInt(notice_no));
			notice.setNotice_title(params.get("notice_title"));
			notice.setNotice_content(params.get("notice_content"));
			
			return "notice_modify_action";
	}
	
}
