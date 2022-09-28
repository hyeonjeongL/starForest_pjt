package com.itwill.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.domain.SeatReservation;
import com.itwill.repository.SeatReservationDao;

@Service
public class SeatReservationServiceImpl implements SeatReservationService{
	@Autowired
	private SeatReservationDao seatReservationDao;
	
	
	@Override
	public int reservation(SeatReservation seatReservation) throws Exception {
		return seatReservationDao.reservation(seatReservation);
	}

	@Override
	public int returnByUser(SeatReservation seatReservation) throws Exception {
		return seatReservationDao.returnByUser(seatReservation);
	}

	@Override
	public int returnByAuto(SeatReservation seatReservation) throws Exception {
		return seatReservationDao.returnByAuto(seatReservation);
	}

	@Override
	public int continueSeat(SeatReservation seatReservation) throws Exception {
		return seatReservationDao.continueSeat(seatReservation);
	}

	@Override
	public List<SeatReservation> selectAll() throws Exception {
		return seatReservationDao.selectAll();
	}

	@Override
	public List<SeatReservation> selectAvailableSeat(int seat_status) throws Exception {
		return seatReservationDao.selectAvailableSeat(seat_status);
	}

	@Override
	public int countAvailableSeat(int seat_status) throws Exception {
		return seatReservationDao.countAvailableSeat(seat_status);
	}

	@Override
	public SeatReservation selectTimeUsingSeat(String seat_no, int seat_status) throws Exception {
		return seatReservationDao.selectTimeUsingSeat(seat_no, seat_status);
	}

	
	
	
}
