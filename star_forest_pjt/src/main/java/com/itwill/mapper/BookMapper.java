package com.itwill.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Book;

@Mapper
public interface BookMapper {
	
	@Insert("insert into book (book_no,isbn,book_title,book_author,book_publisher,book_summary,"
							+ "book_publish_date,book_input_date,book_image,book_image_src,book_page,"
							+ "book_qty,book_res_cnt,book_rental_cnt,category_no) "
							+ "values (seq_book_book_no.nextval,#{isbn},#{book_title},#{book_author},"
							+ "#{book_publisher},#{book_summary},#{book_publish_date},#{book_input_date},"
							+ "#{book_image},#{book_image_src},#{book_page},#{book_qty},"
							+ "#{book_res_cnt},#{book_rental_cnt},#{category_no})")
	public Book insertBook(Book book);
	
	public Book selectBookDetail(int book_no);
	
	public int updateRentalBookQty(int book_no);
	
	public int updateReturnBookQty(int book_no);
	
	public String updateById(String user_id);
	
	public Map<String, Object> updateByIdNo(String user_id, int book_no);
	
	public List<Book> selectAll();

}
