package com.itwill.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.domain.Book;
import com.itwill.domain.Rental;

@Mapper
public interface RentalMapper {
	
	/** 대여 시 insert*/
	@Insert("insert into rental (rental_no,rental_date,return_duedate,"
			+ "					 return_date,rental_status,book_no,user_id) "
			+ "values(#{rental_no},#{rental_date},#{return_duedate},#{return_date},"
			+ "		  #{rental_status},#{book_no},#{user_id})")
	public int insertRental(Rental rental);
	
	/** 대여 기간 연장*/
	@Update("update rental set return_duedate = return_duedate+7"
				+ "where user_id=#{user_id} and book_no=#{book_no}")
	public int updateDate(String user_id, int book_no );
	
	
	
	/** user_id로 대출 리스트 뽑기*/
//	@Select("select b.book_no, b.book_title, b.book_author, "
//				 + "b.book_publisher, b.book_input_date, b.category_no, r.rental_date "
//		  + "from rental r inner join book b on r.book_no = b.book_no "
//		  + "where r.user_id = #{user_id}"
//		  + "order by r.rental_date asc")
	public List<Rental> selectById(String user_id); //이게 맞나? 
	
	/** book_no로 대출유저 리스트*/
	
	@Select("select u.user_id, u.user_name, u.user_rental_status, "
				 + "u.user_book_cnt_limit, r.rental_date "
			+ "from rental r left join user_info u on r.user_id = u.user_id "
			+ "inner join book b on r.book_no = b.book_no "
			+ "where b.book_no = #{book_no} and u.user_id is not null")
	public List<Map<String, Object>> selectByNo(int book_no);
	
	
	/** 반납했을 때 렌탈테이블 업데이트 (admin)*/
	@Update("update rental set rental_status = 0, return_date=sysdate "
			+ "where user_id = #{user_id} and book_no = #{book_no}")
	public int updateRentalStatus(String user_id, int book_no);
	
	
	//Dao, service 추가해야함
	
	
	/** 연체중일 때 status 2(연체)로 변경*/
	@Update("update rental set rental_status=2"
			+ "where rental_no=#{rental_no}")
	public int updateRentalStatusOverdue(int rental_no);
	
	

}
