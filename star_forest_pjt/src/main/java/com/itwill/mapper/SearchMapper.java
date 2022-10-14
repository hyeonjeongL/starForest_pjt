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
	
	//검색 기능 리스트 뽑기
		public List<Search> searchList(Search search);
		
		// 번호 리스트 뽑기
		public List<Search> selectNo(int book_no);  

		//전체 리스트 뽑기
		public List<Search> selectNoTot(int book_no);  
	/*
//제목 검색
	@Select("select "
			+ "book_no,book_title,book_author,book_image,book_image_src"
			+ "from book"
			+ "where book_title =#{book_title}")
	public List<Search> titleList();

	//번호검색
	@Select("select"
			+ "book_no,book_title,book_author,book_image,book_image_src"
			+ "from book"
			+ " from book where book_no=#{book_no}")
	//public Search selectByNo(int book_no);
	
	//저자검색
	@Select("select"
			+"book_no,book_title,book_author,book_image,book_image_src"
			+ "from book where book_author =#{book_author}")
	public List<Search> authorList();
	
	//출판사검색
	@Select("select"
			+ "book_no,book_title,book_author,book_image,book_image_src"
			+ "from book "
			+ "where book_publisher =#{book_publisher}")
	public List<Search> publisherList();
	
	
	//통합검색
	@Select("select"
			+ "book_no,book_title,book_author,book_image,book_image_src"
			+ "from book "
			+ "where book_title =#{book_title} or book_author =#{book_author} or book_publisher =#{book_publisher}")
	//public List<Search> searchList();
	
	//도서 리스트
	@Select("select "
			+ "book_no,book_title,book_author,book_image,book_image_src"
			+ "from book")
	public List<Search> allList();
	
	
	//분야명 검색
	@Select("select b.book_no,b.book_title,b.book_author,b.book_image,b.book_image_src,bc.category_name "
			+ "from book b "
			+ "inner join  book_category bc "
			+ "on b.category_no=bc.category_no  "
			+ "where bc.category_name =#{category_name}")
	public List<Search> cateNameList();
	
	//분야 번호 검색
	@Select("select book_no,book_title,book_author,book_image,book_image_src,category_no"
			+ "from book where category_no =#{category_no}")
	public List<Search> cateNoList(int category_no);
	 */
	 
}
