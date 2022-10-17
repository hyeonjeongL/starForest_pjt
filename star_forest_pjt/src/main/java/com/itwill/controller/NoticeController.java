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
		System.out.println(pageno);
		try {
			PageMakerDto<Notice> noticeList = noticeService.selectAll(pageno);
			System.out.println("selectAll(pageno)");
			model.addAttribute("noticeList",noticeList);
			System.out.println("noticeList111");
			model.addAttribute("pageno",pageno);
			System.out.println("pageno");
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "notice_list";
	}
	
	@RequestMapping("/notice_detail")
	public String notice_detail(@RequestParam Integer pageno, Integer notice_no, Model model) throws Exception{
		if(pageno==null || notice_no==null) {
			return "notice_list";
		}
		try {
			Notice notice = noticeService.selectByNo(notice_no);
			System.out.println("view111");
			noticeService.updateCount(notice_no);
			System.out.println("view222");
			model.addAttribute("notice",notice);
			System.out.println("view333");
			model.addAttribute("pageno",pageno);
			System.out.println("view444");
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "notice_detail";
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
			System.out.println("modify_action111");
			notice.setNotice_no(Integer.parseInt(notice_no));
			System.out.println("modify_action222");
			notice.setNotice_title(params.get("notice_title"));
			System.out.println("modify_action333");
			notice.setNotice_content(params.get("notice_content"));
			System.out.println("modify_action444");
			noticeService.update(notice);
			System.out.println("modify_action555");
			
			return "notice_detail?pageno="+pageno+"&notice_no="+notice_no;
	}
	
	@LoginCheck
	@RequestMapping("/notice_modify_form")
	public String notice_modify_form(@RequestParam Integer pageno, Integer notice_no, Model model) throws Exception{
		if(pageno == null || notice_no == null) {
			return "notice_list";
		}
		try {
			Notice notice = noticeService.selectByNo(notice_no);
			System.out.println("modify_form111");
			model.addAttribute("notice",notice);
			System.out.println("modify_form222");
			model.addAttribute("pageno",pageno);
			System.out.println("modify_form333");
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "notice_modify_form";
	}
}
