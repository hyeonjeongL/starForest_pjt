package com.itwill.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.domain.SeatReservation;
import com.itwill.service.SeatReservationService;

@RestController
public class SeatReservationRestController {
		@Autowired
		private SeatReservationService seatReservationService;
		
		
		/*
		 * 좌석 전체리스트
		 */
		@RequestMapping(value="/seatReservation_list_json", produces = "application/json;charset=UTF-8")
		public Map seatReservation_list_json() {
			Map resultMap = new HashMap();
			int code = 1;
			String url="";
			String msg="";
			List<SeatReservation> resultList = new ArrayList<SeatReservation>();
			try {
				List<SeatReservation> seatReservationList = seatReservationService.selectAll();
				code=1;
				url="seatReservation_list";
				msg="성공";
				resultList = seatReservationList;
			}catch (Exception e) {
				code=2;
				//url="main";
				msg="실패";
				e.printStackTrace();
			}
			
			resultMap.put("code", code);
			resultMap.put("url", url);
			resultMap.put("msg", msg);
			resultMap.put("data", resultList);
			return resultMap;
		}
}
