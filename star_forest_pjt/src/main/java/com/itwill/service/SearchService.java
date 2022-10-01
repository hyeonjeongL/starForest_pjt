package com.itwill.service;

import java.util.List;

import com.itwill.domain.Search;

//검색기능
public interface SearchService {
	
	//제목 검색
	public List<Search> selectByTitle(String keyword) throws Exception;
	
	//제목 검색_페이지
	//public List<Search> selectByTitle(String keyword, int start, int last) throws Exception;

	//번호검색
	public Search selectByNo(int book_no) throws Exception;
	
	//저자검색
	public List<Search> selectByAuthor(String keyword) throws Exception;
	
	//출판사검색
	public List<Search> selectByPublisher(String keyword) throws Exception;
	
	//분야검색
	public List<Search> selectByCategoryName(String keyword) throws Exception;
}
