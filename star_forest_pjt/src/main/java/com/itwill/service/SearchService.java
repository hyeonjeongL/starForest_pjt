package com.itwill.service;

import java.util.List;

import com.itwill.domain.Search;
import com.itwill.util.PageMakerDto;

//검색기능
public interface SearchService {
	//분야별 리스트
	public List<Search> list(int category_no)throws Exception;
	
	//리스트
	public PageMakerDto<Search> getBookList(int currentPage) throws Exception;
	
	//제목 검색
	public List<Search> selectByTitle(String book_title) throws Exception;
	
	//제목 검색_페이지
	public PageMakerDto<Search> selectByTitle(String keyword, int currentPage) throws Exception;

	//번호검색
	public Search selectByNo(int book_no) throws Exception;
	
	//저자검색
	public List<Search> selectByAuthor(String book_author) throws Exception;
	
	//저자검색_페이지
	public PageMakerDto<Search> selectByAuthor(String keyword, int currentPage) throws Exception;
	
	
	//출판사검색
	public List<Search> selectByPublisher(String book_publisher) throws Exception;
	//출판사검색_페이지
	public PageMakerDto<Search> selectByPublisher(String keyword, int currentPage) throws Exception;
	
	//분야검색_페이지
	public PageMakerDto<Search> selectByCategoryName(String keyword, int currentPage) throws Exception;
	//분야검색
	public List<Search> selectByCategoryName(String category_name) throws Exception;
	
	//통합검색
	public List<Search> selectByAll(String keyword) throws Exception;
	//통합검색_페이지
	public PageMakerDto<Search> selectByAll(String keyword, int currentPage) throws Exception;
	
	//검색
	public List<Search> getSearchList(Search search)throws Exception;
	
	//전체 조회
	public List<Search> getList() throws Exception;
}
