package com.itwill.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Book;
import com.itwill.domain.Rental;
import com.itwill.mapper.RentalMapper;

@Repository
public class RentalDaoImpl implements RentalDao{
	
	@Autowired
	private RentalMapper rentalMapper;

	@Override
	public int insertRental(Rental rental) {
		return rentalMapper.insertRental(rental);
	}
	
	@Override
	public int updateDate(String user_in, int book_no) {
		return rentalMapper.updateDate(user_in, book_no);
	}

	@Override
	public List<Rental> selectById(String user_id) {
		return rentalMapper.selectById(user_id);
	}

	
	@Override
	public List<Map<String, Object>> selectByNo(int book_no) {
		return rentalMapper.selectByNo(book_no);
	}

	@Override
	public int updateRentalStatus(String user_id, int book_no) {
		return rentalMapper.updateRentalStatus(user_id, book_no);
	}



	
	

}
