package com.itwill.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.SeatReservation;
import com.itwill.mapper.SeatReservationMapper;

@Repository
public class SeatReservationDaoImpl implements SeatReservationDao{
	@Autowired
	private SeatReservationMapper seatReservationMapper;

	public SeatReservationDaoImpl() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public int reservation(SeatReservation seatReservation) throws Exception {
		return seatReservationMapper.reservation(seatReservation);
	}

	@Override
	public int returnByUser(SeatReservation seatReservation) throws Exception {
		return seatReservationMapper.returnByUser(seatReservation);
	}

	@Override
	public int returnByAuto(SeatReservation seatReservation) throws Exception {
		return seatReservationMapper.returnByAuto(seatReservation);
	}

	@Override
	public List<SeatReservation> resetAll() throws Exception {
		return seatReservationMapper.resetAll();
	}
	
	@Override
	public int continueSeat(SeatReservation seatReservation) throws Exception {
		return seatReservationMapper.continueSeat(seatReservation);
	}

	@Override
	public List<SeatReservation> selectAll() throws Exception {
		return seatReservationMapper.selectAll();
	}

	@Override
	public List<SeatReservation> selectAvailableSeat(int seat_status) throws Exception {
		return seatReservationMapper.selectAvailableSeat(seat_status);
	}

	@Override
	public int countAvailableSeat(int seat_status) throws Exception {
		return seatReservationMapper.countAvailableSeat(seat_status);
	}

	@Override
	public SeatReservation selectTimeUsingSeat(String seat_no) throws Exception {
		return seatReservationMapper.selectTimeUsingSeat(seat_no);
	}

	

}
