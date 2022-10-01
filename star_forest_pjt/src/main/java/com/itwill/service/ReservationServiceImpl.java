package com.itwill.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.domain.Reservation;
import com.itwill.repository.ReservationDao;
@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;

	@Override
	public int insertReservation(Reservation reservation) {
		return reservationDao.insertReservation(reservation);
	}

	@Override
	public int deleteReservation(String user_id, int book_no) {
		return reservationDao.deleteReservation(user_id, book_no);
	}
	
	
}
