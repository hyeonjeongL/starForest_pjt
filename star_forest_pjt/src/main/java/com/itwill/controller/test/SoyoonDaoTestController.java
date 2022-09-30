package com.itwill.controller.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.domain.SeatReservation;
import com.itwill.repository.SeatReservationDao;
import com.itwill.service.SeatReservationService;

@Controller
public class SoyoonDaoTestController {
	@Autowired
	private SeatReservationDao seatReservationDao;
	@Autowired
	private SeatReservationService seatReservationService;
	
	@RequestMapping("/seatReservationDao_test")
	public String seatReservationDao_test() throws Exception{

		//System.out.println(seatReservationDao.selectAll());
		//System.out.println(seatReservationDao.reservation(new SeatReservation("A01", null, null, null, 0, "soyoon")));
		SeatReservation usingSeat = seatReservationDao.selectTimeUsingSeat("B01", 1);
		
		//System.out.println(usingSeat);
		//System.out.println(seatReservationDao.returnByAuto(usingSeat));
		//System.out.println(seatReservationDao.continueSeat(usingSeat));
		System.out.println(seatReservationDao.countAvailableSeat(0));
		return "test/test_result";

	}
}
