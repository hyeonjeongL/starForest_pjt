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

	@Override
	public int updateDate(String user_id, int book_no) {
		return rentalDao.updateDate(user_id, book_no);
	}

	@Override
	public List<Rental> selectById(String user_id) {
		return rentalDao.selectById(user_id);
	}

	@Override
	public List<Map<String, Object>> selectByNo(int book_no) {
		return rentalDao.selectByNo(book_no);
	}

	@Override
	public int updateRentalStatus(String user_id, int book_no) {
		return rentalDao.updateRentalStatus(user_id, book_no);
	}

	
}
