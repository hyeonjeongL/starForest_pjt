package com.itwill.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.domain.RequestBoard;
import com.itwill.service.RequestBoardService;

@RestController
public class RequestBoardRestController {
	@Autowired
	private RequestBoardService requestBoardService;
	@RequestMapping(value="/request_list_json", produces = "application/json;charset=UTF-8")
	public Map request_list_json() {
		Map resultMap = new HashMap();
		int code=1;
		String url="";
		String msg="";
		List<RequestBoard> resultList = new ArrayList<RequestBoard>();
		try {
			List<RequestBoard> requestList = requestBoardService.selectAll();
			code=1;
			url="";
			msg="성공";
			resultList = requestList;
		}catch (Exception e) {
			code=2;
			msg="에러";
			e.printStackTrace();
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}
	
	
	@RequestMapping(value = "/request_view_json", produces = "application/json;charset=UTF-8")
	public Map request_view_json(@RequestParam int board_no) {
		Map resultMap = new HashMap();
		int code=1;
		String msg="";
		List<RequestBoard> resultList = new ArrayList<RequestBoard>();
		
		try {
			requestBoardService.addReadCount(board_no);
			RequestBoard requestBoard = requestBoardService.selectOne(board_no);
			code=1;
			resultList.add(requestBoard);
			
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
