package com.itwill.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.domain.Book;
import com.itwill.domain.Rental;
import com.itwill.repository.RentalDao;

@Service
public class RentalServiceImpl implements RentalService{
	
	@Autowired
	private RentalDao rentalDao;

	/** 대여 시 insert*/
	@Override
	public int insertRental(Rental rental) {
		return rentalDao.insertRental(rental);
	}
	
	/** 대여 기간 연장*/
	@Override
	public int updateDate(String user_id, int book_no) {
		return rentalDao.updateDate(user_id, book_no);
	}

	/** user_id로 대출 리스트 뽑기*/
	@Override
	public List<Rental> selectById(String user_id) {
		return rentalDao.selectById(user_id);
	}

	/** book_no로 대출유저 리스트*/
	@Override
	public List<Map<String, Object>> selectByNo(int book_no) {
		return rentalDao.selectByNo(book_no);
	}

	/** 반납했을 때 렌탈테이블 업데이트 (admin)*/
	@Override
	public int updateRentalStatus(String user_id, int book_no) {
		return rentalDao.updateRentalStatus(user_id, book_no);
	}

	@Override
	public int updateRentalStatusOverdue(int rental_no) {
		return rentalDao.updateRentalStatusOverdue(rental_no);
	}


	
}
