package com.itwill.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Book;

@Mapper
@Repository
public interface BookMapper {
	
	public Book insertBook(Book book);
	
	public Book bookDetail(int book_no);
	
	public int updateRentalBookQty(int book_no);
	
	public int updateReturnBookQty(int book_no);
	
	public String updateById(String user_id);
	
	public Map<String, Object> updateByIdNo(String user_id, int book_no);

}
