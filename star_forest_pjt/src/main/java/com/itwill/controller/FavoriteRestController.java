package com.itwill.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.controller.interceptor.LoginCheck;
import com.itwill.domain.Favorite;
import com.itwill.service.FavoriteService;

@RestController
public class FavoriteRestController {
	@Autowired
	private FavoriteService favoriteService;
	
	//즐겨찾기 추가
	@LoginCheck
	@PostMapping("/favorite_insert")
	public Map favorite_insert(HttpServletRequest request,@RequestParam Integer book_no) {
		Map resultMap=new HashMap();
		int code=2;
		String url="";
		String msg="";
		List<Favorite> resultList=new ArrayList<Favorite>();
		if(book_no==null) {
			code=2;
			url="";
			msg="잘못된 접근입니다.";
		}
		try {
			String sUserId=(String)request.getSession().getAttribute("sUserId");
			int result=favoriteService.insert(new Favorite(0, sUserId, book_no));
			code=1;
			url="favorite_list";
			msg="내 서재에 보관하였습니다.";
			
		}catch (Exception e) {
			code=-1;
			url="";
			msg="내 서재에 이미 존재합니다.";
		}
		
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		
		
		return resultMap;
	}
	//상세보기
	public Map favorite_view(HttpServletRequest request) {
		Map resultMap=new HashMap();
		int code=2;
		String url="";
		String msg="";
		
		return resultMap;
	}
	
	
	//즐겨찾기삭제
	@LoginCheck
	@PostMapping("/favorite_remove")
	public Map favorite_remove(HttpServletRequest request) {
		Map resultMap=new HashMap();
		int code=2;
		String url="";
		String msg="";
		List<Favorite> resultList=new ArrayList<Favorite>();
		
		try {
			String sUserId=(String)request.getSession().getAttribute("sUserId");
			int result=favoriteService.remove(sUserId);
			code=1;
			url="";
			msg="내 서재 목록에서 삭제되었습니다.";
			
		}catch (Exception e) {
			code=2;
			url="";
			msg="관리자에게 문의하세요.";
		}
		
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		
		return resultMap;
	}
	
	//즐겨찾기 일부삭제
	
	
}
