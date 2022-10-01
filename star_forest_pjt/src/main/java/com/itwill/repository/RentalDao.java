package com.itwill.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Book;
import com.itwill.domain.Rental;


public interface RentalDao {
	
	int updateDate(String user_id, int book_no);
	
	List<Rental> selectById(String user_id);
	
	List<Map<String, Object>> selectByNo(int book_no);
	
	int updateRentalStatus(String user_id, int book_no);

}
