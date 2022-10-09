package com.itwill.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.domain.Search;
//검색 기능
@Mapper
public interface SearchMapper {
	
//제목 검색
	@Select("select * from book where book_title =#{book_title}")
	public List<Search> titleList(String keyword);

	//번호검색
	@Select("select * from book where book_no=#{book_no}")
	public Search selectByNo(int book_no);
	
	//저자검색
	@Select("select * from book where book_author =#{book_author}")
	public List<Search> authorList(String keyword);
	
	//출판사검색
	@Select("select * from book where book_publisher =#{book_publisher}")
	public List<Search> publisherList(String keyword);
	
	//분야명 검색
	@Select("select b.*,bc.category_name from book b left join  book_category bc on b.category_no=bc.category_no  where bc.category_name =#{category_name}")
	public List<Search> cateNameList(String keyword);

	//분야 번호 검색
	@Select("select * from book where category_no =#{category_no}")
	public List<Search> cateNoList(int category_no);
	
	//통합검색
	@Select("select b.*,bc.category_name from book b left join  book_category bc on b.category_no=bc.category_no where book_title =#{book_title} or book_author =#{book_author} or bc.category_name =#{category_name} or book_publisher =#{book_publisher}")
	public List<Search> searchList(String keyword);
	
	//도서 리스트
	@Select("select * from book")
	public List<Search> allList();
}
