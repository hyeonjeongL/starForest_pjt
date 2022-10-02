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
	@Select("select * from book where book_title like ?")
	public List<Search> TitleList();

	//번호검색
	@Select("select * from book where book_no=?")
	public Search selectByNo(int book_no);
	
	//저자검색
	@Select("select * from book where book_author like ?")
	public List<Search> AuthorList();
	
	//출판사검색
	@Select("select * from book where book_publisher like ?")
	List<Search> PublisherList(String keyword);
	
	//분야검색
	@Select("select b.*,bc.category_name from book b left join  book_category bc on b.category_no=bc.category_no  where bc.category_name like ?")
	public List<Search> CategoryList();
	
	//통합검색
	@Select("select b.*,bc.category_name from book b left join  book_category bc on b.category_no=bc.category_no where book_title like ? or book_author like ? or bc.category_name like ? or book_publisher like ?")
	List<Search> SearchList(String keyword);
	
}
