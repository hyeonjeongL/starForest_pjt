package com.itwill.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.domain.BookClub;

public interface BookClubMapper {
  
	@Insert("insert into book_club values(SEQ_book_club_club_no.nextval,#{club_name},#{club_count},"
			+ "							 #{club_person},#{club_time},#{club_place},#{club_content},"
			+ "							 #{club_readcount},#{category_no},#{user_id})")
	public int create(BookClub bookClub);
	
	@Select("select * from book_club")
	public List<BookClub> selectAll();
	
	@Select("select club_name,club_count,club_person,club_time,club_place,club_content from book_club"
			+ "			where category_no=#{category_no}")
	public List<BookClub> selectBycategory(BookClub bookClub);
	
	@Select("select club_name,club_person,club_time,club_place,club_content from book_club c"
			+ "			inner join user_info u on c.club_no=u.club_no where user_id=#{user_id}")
	public List<BookClub> selectById(String user_id);
	
	@Select("select club_name,club_count,club_person,club_time,club_place,club_content from book_club"
			+ "			where club_no=#{club_no}")
	public BookClub selectByNo(int club_no);
	
	@Update("update book_club set club_name=#{club_name},club_count=#{club_count},club_person=#{club_person},"
			+ "							 club_time=#{club_time},club_place=#{club_place},club_content=#{club_content}"
			+ "							 where club_no=#{club_no}")
	public int update(BookClub bookClub);
	
	@Update("update book_club set club_count=club_count-1 where club_count>0 and club_no=#{club_no}")
	public int clubCount(int club_no);
	
	@Delete("delete from book_club where club_no=#{club_no}")
	public int remove(int club_no);
	
}
