package com.itwill.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.controller.interceptor.LoginCheck;
import com.itwill.domain.BookClub;
import com.itwill.service.BookClubService;

@RestController
public class BookClubRestController {
	@Autowired
	private BookClubService bookClubService;

	// 동아리 생성
	@LoginCheck
	@PostMapping("/club_create")
	public Map club_create(@ModelAttribute BookClub bookClub, HttpServletRequest request) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<BookClub> resultList = new ArrayList<BookClub>();

		try {
			String sUserId = (String) request.getSession().getAttribute("sUserId");
			int result = bookClubService.create(bookClub);
			code = 1;
			url = "club_list";
			msg = "동아리가 개설되었습니다.";

		} catch (Exception e) {
			code = 2;
			url = "main";
			msg = "잘못된 접근입니다.";
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data",resultList);
		return resultMap;
	}

	// 카테고리별 동아리 조회
	@RequestMapping("/club_select_by_category")
	public Map club_select_by_category(@RequestParam int category_no) throws Exception {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<BookClub> resultList = new ArrayList<BookClub>();
		
		resultList = bookClubService.selectByCategory(category_no);
		code = 1;
		url = "club_list";
		msg = "조회성공";
		
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data",resultList);
		return resultMap;

	}
	
	//동아리 상세보기
	
	public Map club_detail(@RequestParam int club_no) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<BookClub> resultList = new ArrayList<BookClub>();
		
		try {
			BookClub bookClub=bookClubService.selectByNo(club_no);
			code=1;
			url="club_detail";
			msg="성공";
			resultList.add(bookClub);
			
		}catch (Exception e) {
			code=3;
			url="club_list";
			msg="관리자에게 문의하세요.";
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data",resultList);
		
		return resultMap;
	}
	
	
	

}
