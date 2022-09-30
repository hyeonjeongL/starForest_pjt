package com.itwill.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.itwill.domain.Reservation;

@Mapper
public interface ReservationMapper {
	
	//책 수량이 0일 때 예약 리스트 추가하기
	@Insert("insert into reservation "
		  + "values (seq_reservation_res_no.nextval,sysdate, 1, 9, 'yeji')")
	public int insertReservation(Reservation reservation);
	
	
	//예약이 대출로 변경되면 예약리스트 삭제
	@Delete("delete from reservation where user_id=#{user_id} and book_no=#{book_no}")
	public int deleteReservation(String user_id, int book_no);
	
	

}
