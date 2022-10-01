package com.itwill.repository;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Reservation;


public interface ReservationDao {
	
	int insertReservation(Reservation reservation);
	
	int deleteReservation(String user_id, int book_no);

}
