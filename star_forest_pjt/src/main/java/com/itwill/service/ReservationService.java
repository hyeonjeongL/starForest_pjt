package com.itwill.service;

import com.itwill.domain.Reservation;

public interface ReservationService {
	
	//책 수량이 0일 때 예약 리스트 추가하기
	int insertReservation(Reservation reservation);
	
	//예약이 대출로 변경되면 예약리스트 삭제
	int deleteReservation(String user_id, int book_no);

}
