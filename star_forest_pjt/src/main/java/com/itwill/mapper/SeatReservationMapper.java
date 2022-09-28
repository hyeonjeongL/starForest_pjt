package com.itwill.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.domain.SeatReservation;

public interface SeatReservationMapper {
	@Update("update seat_reservation set seat_date=sysdate, seat_start_time=to_char(sysdate,'HH24:MI:SS'),\r\n"
			+ "								seat_end_time=to_char(sysdate+5/24,'HH24:MI:SS'),\r\n"
			+ "								user_id=#{user_id}, seat_status=1 where seat_no=#{seat_no}")
	public int reservation();
	
	@Update("update seat_reservation set seat_date=null, seat_start_time=null,\r\n"
			+ "								seat_end_time=null,user_id=null,\r\n"
			+ "								seat_status=0\r\n"
			+ "								where seat_no=#{seat_no}")
	public int returnByUser();
	
	@Update("update seat_reservation set seat_date=null,seat_start_time=null,\r\n"
			+ "								seat_end_time=null,user_id=null,\r\n"
			+ "								seat_status=0\r\n"
			+ "								where seat_no=#{seat_no} and\r\n"
			+ "								seat_end_time&lt;(to_char(sysdate,'HH24:MI:SS'))")
	public int returnByAuto();
	
	@Update("update seat_reservation set \r\n"
			+ "	seat_end_time= <![CDATA[(case when to_char(sysdate,'HH24:MI:SS')<=to_char(to_date(#{seat_end_time},'HH24:MI:SS')-30/(24*60),'HH24:MI:SS')\r\n"
			+ "	then to_char(to_date(#{seat_end_time},'HH24:MI:SS')+2/24,'HH24:MI:SS') else #{seat_end_time} end where user_id=#{user_id}]]>")
	public int continueSeat();
	
	@Select("select * from seat_reservation")
	public List<SeatReservation> selectAll();
	
	@Select("select seat_no from seat_reservation where seat_status=0")
	public List<SeatReservation> selectAvailableSeat(int seat_status);
	
	@Select("select count(*) from seat_reservation where seat_status=0")
	public int countAvailableSeat(int seat_status);
	
	@Select("select seat_start_time, seat_end_time\r\n"
			+ "	from seat_reservation\r\n"
			+ "	where seat_no=#{seat_no} and seat_status=1")
	public SeatReservation selectTimeUsingSeat(String seat_no, int seat_status);
}
