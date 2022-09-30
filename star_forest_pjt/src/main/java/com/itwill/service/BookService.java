package com.itwill.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwill.domain.Book;
import com.itwill.repository.BookDao;


public interface BookService {
	
	/**admin 새책 추가하기*/
	int insertBook(Book book) throws Exception;
	

	/**북 상세 페이지*/
	Book selectBookDetail(int bookd_no) throws Exception;
	
	/**대여시 책재고 감소*/
	int updateRentalBookQty(int book_no) throws Exception;
	
	/**반납시 책재고 증가*/
	int updateReturnBookQty(int book_no) throws Exception;
	
	/**회원이 대여한 도서 전체 반납시 수량변경 (admin)*/
	int updateById(String user_id) throws Exception;
	
	/**각각 반납시 수량변경 (admin)*/
	Map<String, Object> updateByIdNo(String user_id, int book_no);
	
	/**도서 전체 출력*/
	List<Book> selectAll() throws Exception;

}