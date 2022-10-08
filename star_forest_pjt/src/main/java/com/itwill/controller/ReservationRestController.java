package com.itwill.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.domain.Reservation;
import com.itwill.service.ReservationService;

@RestController
public class ReservationRestController {

	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping("/reservation")
	public Map reservation(int book_no, HttpSession session) throws Exception{
		Map resultMap = new HashMap();
		
		int code=2;
		String url="";
		String msg="";
		List<Reservation> resultList = new ArrayList<Reservation>();
		try {
			String sUserId= (String)session.getAttribute("sUserId");
			sUserId = "hyeonjeong";
			int res = reservationService.insertReservation(new Reservation(0, null, 1, book_no, sUserId));
			if(res==1) {
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
}
