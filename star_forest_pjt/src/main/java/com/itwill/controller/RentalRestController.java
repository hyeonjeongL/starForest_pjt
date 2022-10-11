package com.itwill.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.controller.interceptor.LoginCheck;
import com.itwill.domain.Book;
import com.itwill.domain.Rental;
import com.itwill.service.BookService;
import com.itwill.service.BookServiceImpl;
import com.itwill.service.RentalService;

@RestController
public class RentalRestController {
	
	@Autowired
	private RentalService rentalService;
	
	@Autowired
	private BookService bookService;
	
	// 모달안에 대여 신청 (버튼)
	@RequestMapping("/rest_rental")
	@ResponseBody
	public Map rental_tot(int book_no, HttpSession session) throws Exception{
		Map resultMap = new HashMap();
		
		int code = 2;
		String url = "";
		String msg = "";
		List<Rental> resultList = new ArrayList<Rental>();
		try {
			String sUserId= (String)session.getAttribute("sUserId");
			bookService.updateRentalBookQty(book_no);
			bookService.updateRentalCnt(book_no);
			int rental = rentalService.insertRental(new Rental(0, null, null, null, 1, book_no, sUserId));
			if(rental==1) {
				code=1;
				url="";
				msg="신청완료";
			}
		} catch (Exception e) {
			code=2;
			url="";
			msg="오류";
			e.printStackTrace();
		}
		
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		
		return resultMap;
	}
	
	//admin 반납 버튼
	@RequestMapping("/rest_return")
	public Map one_return(int book_no, HttpSession session) throws Exception{
		Map resultMap = new HashMap();
		
		int code = 2;
		String url = "";
		String msg = "";
		List<Rental> resultList = new ArrayList<Rental>();
		try {
			String sUserId= (String)session.getAttribute("sUserId");
			bookService.updateReturnBookQty(book_no);
			bookService.updateByIdNo(sUserId,book_no);
			int rental = rentalService.updateRentalStatus(sUserId, book_no);
			if(rental==1) {
				code=1;
				url="";
				msg="반납완료";
			}
		} catch (Exception e) {
			code=2;
			url="";
			msg="오류";
			e.printStackTrace();
		}
		
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		
		return resultMap;
	}
	
	//user 총 대출목록
	@LoginCheck
	@PostMapping("/user_rental_list")
	public Map user_rental_list(HttpServletRequest request) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<Rental> resultList = new ArrayList<Rental>();
		
		try {
			String sUserId = (String) request.getSession().getAttribute("sUserId");
			resultList=rentalService.selectByIdTotalList(sUserId);
			code = 1;
			url = "";
			msg = "성공";
		}catch (Exception e) {
			e.printStackTrace();
			code = 2;
			url = "main";
			msg = "로그인 후 이용해주세요.";
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}

}