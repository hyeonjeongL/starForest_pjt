package com.itwill.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.domain.SeatReservation;
import com.itwill.service.SeatReservationService;

@RestController
public class SeatReservationRestController {
		@Autowired
		private SeatReservationService seatReservationService;
		
		
		/*
		 * 좌석 예약
		 */
		@PostMapping(value="/seat_reservation_action_json", produces = "application/json;charset=UTF-8")
		public Map seat_reservation_action_json(@ModelAttribute SeatReservation seatReservation,HttpSession session) {
			Map resultMap = new HashMap();
			int code = 1;
			String url = "";
			String msg = "";
			List<SeatReservation> resultList = new ArrayList<SeatReservation>();
			try {
				//String userId = (String)session.getAttribute("userId");
				//userId = "yeji";
				//int rowCount = seatReservationService.reservation(new SeatReservation(null, null, null, null, 0, userId));
				int rowCount = seatReservationService.reservation(seatReservation);
				if(rowCount ==1) {
					code=1;
					url="";
				}
			}catch (Exception e) {
				code = 2;
				msg="예약에러";
				e.printStackTrace();
			}
			resultMap.put("code", code);
			resultMap.put("url", url);
			resultMap.put("msg", msg);
			resultMap.put("data", resultList);
			return resultMap;
		}
		/*
		 * 좌석반납
		 */
		@PostMapping(value="/seat_return_action_json", produces = "application/json;charset=UTF-8")
		public Map seat_return_action_json(@ModelAttribute SeatReservation seatReservation) {
			Map resultMap = new HashMap();
			int code = 1;
			String url = "";
			String msg = "";
			List<SeatReservation> resultList = new ArrayList<SeatReservation>();
			try {
				//String userId = (String)session.getAttribute("userId");
				//userId = "soyoon";
				int rowCount = seatReservationService.returnByUser(seatReservation);
				if(rowCount ==1) {
					code=1;
					url="seatReservation";
				}
			}catch (Exception e) {
				code = 2;
				msg="반납에러";
				e.printStackTrace();
			}
			resultMap.put("code", code);
			resultMap.put("url", url);
			resultMap.put("msg", msg);
			resultMap.put("data", resultList);
			return resultMap;
		}
}
