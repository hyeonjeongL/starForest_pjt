package com.itwill.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.domain.Reservation;
import com.itwill.repository.ReservationDao;
@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;

	//책 수량이 0일 때 예약 리스트 추가하기
	@Override
	public int insertReservation(Reservation reservation) {
		return reservationDao.insertReservation(reservation);
	}

	//예약이 대출로 변경되면 예약리스트 삭제
	@Override
	public int deleteReservation(String user_id, int book_no) {
		return reservationDao.deleteReservation(user_id, book_no);
	}
	
	
}
