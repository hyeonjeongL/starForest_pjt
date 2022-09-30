package com.itwill.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Book;

@Mapper
public interface BookMapper {
	
	//admin 새책 추가하기
	@Insert("insert into book (book_no,isbn,book_title,book_author,book_publisher,book_summary,"
							+ "book_publish_date,book_input_date,book_image,book_image_src,book_page,"
							+ "book_qty,book_res_cnt,book_rental_cnt,category_no) "
							+ "values (seq_book_book_no.nextval,#{isbn},#{book_title},#{book_author},"
							+ "#{book_publisher},#{book_summary},#{book_publish_date},#{book_input_date},"
							+ "#{book_image},#{book_image_src},#{book_page},#{book_qty},"
							+ "#{book_res_cnt},#{book_rental_cnt},#{category_no})")
	public int insertBook(Book book);
	
	// 북 상세 페이지 
	@Select("select * from book "
				 + "where book_no=#{book_no}")
	public Book selectBookDetail(int book_no);
	
	//대여시 책재고 감소 
	@Update("update book set book_qty = book_qty-1 where book_no=#{book_bo}")
	public int updateRentalBookQty(int book_no);
	
	//반납시 책재고 증가 
	@Update("update book set book_qty = book_qty+1 where book_no=#{book_bo}")
	public int updateReturnBookQty(int book_no);
	
	//회원이 대여한 도서 전체 반납시 수량변경 (admin)
	@Update("update book set book_qty = book_qty +1 "
			+ "where booK_no in"
		 + "(select r.book_no from rental r inner join user_info u "
		 + "on r.user_id = u.user_id where u.user_id = #{user_id})")
	public int updateById(String user_id);
	
	//각각 반납시 수량변경 (admin)
	@Update("update book set book_qty = book_qty +1 "
			+ "where booK_no in "
			+ "(select r.book_no from rental r inner join user_info u "
			+ "on r.user_id = u.user_id "
			+ "where u.user_id = #{user_id} and r.book_no=#{book_no})")
	public Map<String, Object> updateByIdNo(String user_id, int book_no);
	
	//도서 전체 출력 
	@Select("select book_no,isbn,book_title,book_author,book_publisher,book_summary, "
			+ "book_publish_date,book_input_date,book_image,book_image_src,book_page, "
			+ "book_qty,book_res_cnt,book_rental_cnt,category_no "
			+ "from book order by book_no asc")
	public List<Book> selectAll();

}
