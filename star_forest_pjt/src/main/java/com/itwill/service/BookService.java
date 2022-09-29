package com.itwill.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwill.domain.Book;
import com.itwill.repository.BookDao;


public interface BookService {
	
	Book insertBook(Book book) throws Exception;
	
	Book selectBookDetail(int bookd_no) throws Exception;
	
	int updateRentalBookQty(int book_no) throws Exception;
	
	int updateReturnBookQty(int book_no) throws Exception;
	
	String updateById(String user_id) throws Exception;
	
	Map<String, Object> updateByIdNo(String user_id, int book_no);
	
	List<Book> selectAll() throws Exception;

}