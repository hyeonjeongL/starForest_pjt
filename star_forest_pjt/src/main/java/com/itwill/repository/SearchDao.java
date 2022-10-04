package com.itwill.repository;

import java.util.List;

import com.itwill.domain.Search;


//검색기능
public interface SearchDao {

	// 제목 검색
	List<Search> selectByTitle(String keyword) throws Exception;
	
	//제목 검색 페이지
	List<Search> selectByTitle(String keyword, int start, int last) throws Exception;
	
	//번호 검색
	Search selectByNo(int book_no) throws Exception;
	
	//저자 검색
	List<Search> selectByAuthor(String keyword) throws Exception;
	
	//저자 검색 페이지
	List<Search> selectByAuthor(String keyword, int start, int last) throws Exception;
	
	//분야 검색
	List<Search> selectByCategoryName(String keyword) throws Exception;
	
	//분야 검색 페이지
	List<Search> selectByCategoryName(String keyword, int start, int last) throws Exception;
	
	
	//출판사 검색
	List<Search> selectByPublisher(String keyword) throws Exception;
	
	//출판사 검색 페이지
	List<Search> selectByPublisher(String keyword, int start, int last) throws Exception;
	
	
	
	//도서 전체 조회 
	List<Search> getList()throws Exception;
	
	//도서 전체 조회_페이지
	List<Search> getList(int start, int last)throws Exception;
	
	
	//통합 검색(제목, 저자, 분야, 출판사)
	List<Search> selectByAll(String keyword) throws Exception;
	
	//통합 검색(제목, 저자, 분야, 출판사) 페이지
	List<Search> selectByAll(String keyword, int start, int last) throws Exception;
	
	
	// 도서 수량 조회
	//int getTotBookCount() throws Exception;

	// 도서 수량 조회_페이지?
	//int getTotBookCount(String keyword) throws Exception;
}
