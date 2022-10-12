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
import com.itwill.service.UserService;

@RestController
public class RentalRestController {

	@Autowired
	private RentalService rentalService;

	@Autowired
	private BookService bookService;
	
	@Autowired
	private UserService userService;

	// 모달안에 대여 신청 (버튼)
	@RequestMapping("/rest_rental")
	@ResponseBody
	public Map rental_tot(@RequestParam int book_no, HttpSession session) throws Exception {
		Map resultMap = new HashMap();

		int code = 2;
		String url = "";
		String msg = "";
		List<Rental> resultList = new ArrayList<Rental>();
		try {
			String sUserId = (String) session.getAttribute("sUserId");
			int fiveLimit = rentalService.rentalFiveLimit(sUserId);
			if (fiveLimit <= 3) {

				int duplication = rentalService.bookCheckDupli(sUserId, book_no);
				if (duplication == 0) {
					Date date = new Date();
					int rental = rentalService.insertRental(new Rental(0, null, null, date, 1, book_no, sUserId));
					bookService.updateRentalBookQty(book_no);
					bookService.updateRentalCnt(book_no);
					if (rental == 1) {
						code = 1;
						url = "";
						msg = "신청완료";
					}
				} else {
					code = 0;
					url = "";
					msg = "이미 대여한 도서입니다.";
				}
			} else if (fiveLimit >= 4) {
					code = -1;
					url = "";
					msg = "최대 대여 가능 권수 4권을 대여하였습니다.";
			}
		} catch (Exception e) {
			code = 2;
			url = "";
			msg = "오류제기럴";
			e.printStackTrace();
		}

		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);

		return resultMap;
	}

	// admin 반납 버튼
	@PostMapping("/rest_return")
	public Map one_return(int book_no, HttpSession session) throws Exception {
		Map resultMap = new HashMap();

		int code = 2;
		String url = "";
		String msg = "";
		List<Rental> resultList = new ArrayList<Rental>();
		try {
			String sUserId = (String) session.getAttribute("sUserId");
			bookService.updateReturnBookQty(book_no);
			bookService.updateByIdNo(sUserId, book_no);
			int rental = rentalService.updateRentalStatus(sUserId, book_no);
			userService.userReturnCount(sUserId);
			if (rental == 1) {
				code = 1;
				url = "";
				msg = "반납완료";
			}
		} catch (Exception e) {
			code = 2;
			url = "";
			msg = "오류";
			e.printStackTrace();
		}

		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);

		return resultMap;
	}

	// user 총 대출목록
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
			resultList = rentalService.selectByIdTotalList(sUserId);
			code = 1;
			url = "";
			msg = "성공";
		} catch (Exception e) {
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

	// user 현재 대출중인 도서 리스트
	@LoginCheck
	@PostMapping("/user_now_rental_list")
	public Map user_now_rental_list(HttpServletRequest request) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<Rental> resultList = new ArrayList<Rental>();

		try {
			String sUserId = (String) request.getSession().getAttribute("sUserId");
			resultList = rentalService.selectById(sUserId);
			code = 1;
			url = "";
			msg = "성공";
		} catch (Exception e) {
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
	
	//도서관 전체 대출 리스트
	@LoginCheck
	@PostMapping("/total_rental_list")
	public Map total_rental_list(HttpServletRequest request) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<Rental> resultList = new ArrayList<Rental>();

		try {
			String sUserId = (String) request.getSession().getAttribute("sUserId");
			resultList = rentalService.selectNowLental(sUserId);
			code = 1;
			url = "";
			msg = "성공";
		} catch (Exception e) {
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