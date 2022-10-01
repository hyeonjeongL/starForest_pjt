package com.itwill.service;

import com.itwill.domain.Reservation;

public interface ReservationService {
	
	int insertReservation(Reservation reservation);
	
	int deleteReservation(String user_id, int book_no);

}
