package com.itwill.repository;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Book;


public interface BookDao {
	
	Book insertNook(Book book) throws Exception;
	
	Book bookDetail(int book_no) throws Exception;
	
	int updateRentalBookQty(int book_no)throws Exception;
	
	int updateReturnBookQty(int book_no)throws Exception;
	
	String updateById(String user_id)throws Exception;
	
	Map<String, Object> updateByIdNo(String user_id, int book_no)throws Exception;
}
