package com.itwill.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.domain.SeatReservation;
import com.itwill.service.SeatReservationService;


@Controller
public class SeatReservationController {
	@Autowired
	private SeatReservationService seatReservationService;
	@RequestMapping("/seatReservation")
	public String seat_list(HttpServletRequest request) {
		String forwardPath="";
		try {
			List<SeatReservation> seatList = seatReservationService.selectAll();
			request.setAttribute("seatList", seatList);
			forwardPath="forward:/WEB-INF/views/seatReservation.jsp";
		}catch (Exception e) {
			e.printStackTrace();
		}
		return forwardPath;
	}
}
