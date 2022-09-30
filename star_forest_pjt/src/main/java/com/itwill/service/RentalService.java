package com.itwill.service;

import java.util.List;
import java.util.Map;

import com.itwill.domain.Book;
import com.itwill.domain.Rental;

public interface RentalService {

	int updateDate(String user_id, int book_no);

	List<Rental> selectById(String user_id);

	Map<String, Object> selectByNo(int book_no);

	int updateRentalStatus(String user_id, int book_no);

}
