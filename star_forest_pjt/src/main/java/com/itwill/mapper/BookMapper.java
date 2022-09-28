package com.itwill.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.domain.Book;

@Mapper
public interface BookMapper {
	
	public Book insertNewBook(Book book);
	
	public int bookDetail(int book_no);
	
	public int updateRentalBookQty(int book_no);
	
	public int updateReturnBookQty(int book_no);

}
