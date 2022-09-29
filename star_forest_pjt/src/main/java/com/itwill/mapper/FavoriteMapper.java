package com.itwill.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.itwill.domain.Favorite;

@Mapper
public interface FavoriteMapper {

	@Insert("insert into favorite values(SEQ_favorite_favorite_no.nextval,#{book_no},#{user_id})")
	public int insert(Favorite favorite);
	
	@Select("select count(*) from favorite where user_id=#{user_id} and book_no=#{book_no}")
	public int isExisted(String user_id, int book_no);
	
	@Select("select f.favorite_no,b.isbn,b.book_title,b.book_author from favorite f"
			+ "			join book b on f.book_no=b.book_no where user_id=#{user_id}")
	public List<Favorite> selectById(String user_id);
	
	@Select("select * from favorite f join book b on f.book_no=b.book_no where favorite_no=#{favorite_no}")
	public Favorite selectByNo(int favorite_no);
	
	@Delete("delete from favorite where favorite_no=#{favorite_no}")
	public int deleteByNo(int favorite_no);
	
	@Delete("delete from favorite where user_id=#{user_id}")
	public int remove(String user_id);

	
}
