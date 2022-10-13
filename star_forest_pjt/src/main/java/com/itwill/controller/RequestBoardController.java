package com.itwill.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.domain.BookCategory;
import com.itwill.domain.RequestBoard;
import com.itwill.domain.SeatReservation;
import com.itwill.service.RequestBoardService;

@Controller
public class RequestBoardController {
	@Autowired
	private RequestBoardService requestBoardService;
	@GetMapping(value = {
			"/requestBoard"},
		produces = "application/json;charset=UTF-8")
	public Map guest_json_get() {
	Map resultMap=new HashMap();
	int code=2;
	String url="requestBoard";
	String msg="잘못된 요청방식입니다.";
	List<RequestBoard> resultList=new ArrayList<RequestBoard>();
	resultMap.put("code", code);
	resultMap.put("url", url);
	resultMap.put("msg", msg);
	resultMap.put("data",resultList);
	return resultMap;
	}
	@RequestMapping("/requestBoard")
	public String requestBoard_main(HttpSession session) {
			String sUserId =(String)session.getAttribute("sUserId");
			String admin="admin";
		if(sUserId==null) {
			return "forward:/WEB-INF/views/requestBoard.jsp";
		}else if(sUserId.equals(admin)){
			return "forward:/WEB-INF/views/requestBoard_admin.jsp";
		}else {
			return "forward:/WEB-INF/views/requestBoard.jsp";
		}
		
	}
	@RequestMapping("/requestBoard_write_form")
	public String request_write_form(HttpServletRequest request,HttpSession session) {
		String forwardPath="";
		try {
			String sUserId = (String)session.getAttribute("sUserId");
			request.setAttribute("sUserId", sUserId);
			
			forwardPath="forward:/WEB-INF/views/requestBoard_write_form.jsp";
		}catch (Exception e) {
			e.printStackTrace();
		}
		return forwardPath;
	}
	
	@RequestMapping("/requestBoard_write_form_admin")
	public String request_write_form_admin(HttpServletRequest request,HttpSession session) {
		String forwardPath="";
		try {
			String sUserId = (String)session.getAttribute("sUserId");
			request.setAttribute("sUserId", sUserId);
			
			forwardPath="forward:/WEB-INF/views/requestBoard_write_form_admin.jsp";
		}catch (Exception e) {
			e.printStackTrace();
		}
		return forwardPath;
	}

}
