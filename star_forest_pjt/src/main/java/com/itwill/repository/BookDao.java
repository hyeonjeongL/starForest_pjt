package com.itwill.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Book;


public interface BookDao {
	
	// admin 새책 추가하기
	int insertBook(Book book) throws Exception;
	
	// 북 상세 페이지
	Book selectBookDetail(int book_no) throws Exception;
	
	// 대여시 책재고 감소
	int updateRentalBookQty(int book_no)throws Exception;
	
	// 반납시 책재고 증가
	int updateReturnBookQty(int book_no)throws Exception;
	
	// 회원이 대여한 도서 전체 반납시 수량변경 (admin)
	int updateById(String user_id)throws Exception;
	
	// 각각 반납시 수량변경 (admin)
	int updateByIdNo(String user_id, int book_no)throws Exception;
	
	// 도서 전체 출력
	List<Book> selectAll() throws Exception;
}
