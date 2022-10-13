package com.itwill.controller;

import java.util.HashMap;
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
	
	@RequestMapping("/notice_list_rest")
	public Map<String, Object> notice_list_rest(@RequestParam(required = false, defaultValue ="1") Integer pageno){
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
		return resultMap;
	}
	
	@RequestMapping("/notice_delete_rest")
	public Map<String, Object> notice_delete_rest(Integer pageno,Integer notice_no,HttpSession session){
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
}
