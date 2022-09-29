package com.itwill.controller.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.domain.SeatReservation;
import com.itwill.repository.SeatReservationDao;

@Controller
public class SoyoonDaoTestController {
	@Autowired
	private SeatReservationDao seatReservationDao;
	
	@RequestMapping("/seatReservationDao_test")
	public String seatReservationDao_test() throws Exception{
		System.out.println(seatReservationDao.selectAll());
		System.out.println(seatReservationDao.reservation(new SeatReservation("A01", null, null, null, 0, "soyoon")));
		return "test/test_result";
	}
}
