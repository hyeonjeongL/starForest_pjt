package com.itwill.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.domain.Notice;
import com.itwill.domain.PageMakerDto;
import com.itwill.service.NoticeService;

@RestController
public class NoticeRestController {
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/notice_list_json")
	public Map<String, Object> notice_list_json(@RequestParam(required = false, defaultValue ="1") Integer pageno){
		System.out.println(pageno);
		Map<String, Object> resultMap = new HashMap<>();
		PageMakerDto<Notice> notice = null;
		try {
			notice = noticeService.selectAll(pageno);
			resultMap.put("errorCode", 1);
			resultMap.put("errorMsg", "성공");
			resultMap.put("data", notice);
		}catch (Exception e) {
			e.printStackTrace();
			resultMap.put("errorCode", -1);
			resultMap.put("errorMsg", "error");
		}
		System.out.println(notice);
		return resultMap;
	}
	
	@RequestMapping("/notice_delete_json")
	public Map<String, Object> notice_delete_json(Integer pageno,Integer notice_no,HttpSession session){
		Map<String, Object> resultMap = new HashMap<>();
		String sUserId=(String)session.getAttribute("sUserId");
		if(pageno == null || notice_no == null || sUserId == "admin") {
			resultMap.put("errorCode", -1);
			resultMap.put("errorMsg", "error");
		}
		try {
			int result = noticeService.delete(notice_no);
			if(result ==1) {
				resultMap.put("errorCode", 1);
				resultMap.put("errorMsg", "게시글이 삭제되었습니다");
			}else {
				resultMap.put("errorCode", -2);
				resultMap.put("errorMsg", "게시글이 삭제되지 않았습니다");
			}
		}catch (Exception e) {
			e.printStackTrace();
			resultMap.put("errorCode", -3);
			resultMap.put("errorMsg", "error");
		}
		
		return resultMap;
	}
	
	@RequestMapping(value = "/notice_detail_json", produces = "application/json;charset=UTF-8")
	public Map request_view_json(@RequestParam int notice_no) {
		Map resultMap = new HashMap();
		int code=1;
		String msg="";
		List<Notice> resultList = new ArrayList<Notice>();
		
		try {
			noticeService.updateCount(notice_no);
			Notice notice= noticeService.selectByNo(notice_no);
			code=1;
			resultList.add(notice);
			
		}catch (Exception e) {
			e.printStackTrace();
			code=2;
			msg="상세보기가 잘못된듯";
		}
		resultMap.put("msg",msg);
		resultMap.put("code",code);
		resultMap.put("data",resultList);
		return resultMap;
	}
}
