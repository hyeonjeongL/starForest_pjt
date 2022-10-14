package com.itwill.repository;

import java.util.List;

import com.itwill.domain.Search;



//검색기능
public interface SearchDao {
	
	
	//전체 리스트 뽑기
			public List<Search> selectNoTot(int book_no); 
	
	/** 번호 리스트 뽑기 */
	List<Search> selectNo(int book_no) throws Exception;
	
	//검색기능 
		List<Search> searchList(Search search) throws Exception;
	
	//분야별 리스트:2차분류
	List<Search> list(int category_no) throws Exception;
	
	
	 //1차분류
	List<Search> list(int category_no,int cateno) throws Exception;
	
	
	//카테고리
	List<Search> cate() throws Exception;
	
	
	//도서 리스트
	List<Search> allList()throws Exception;
	
	
	// 게시물 총 갯수 + 검색 적용
	public int searchCount(String searchType, String keyword) throws Exception;
	
/*
	// 제목 검색
	List<Search> titleList(String keyword) throws Exception;
	
	//제목 검색 페이지
	//List<Search> selectByTitle(String keyword, int start, int last) throws Exception;
	
	//번호 검색
	Search selectByNo(int book_no) throws Exception;
	
	//저자 검색
	List<Search> authorList(String keyword) throws Exception;
	
	//저자 검색 페이지
	//List<Search> selectByAuthor(String keyword, int start, int last) throws Exception;
	
	//분야명 검색
	List<Search> cateNameList(String keyword) throws Exception;
	
	//분야 번호 검색
	List<Search> cateNoList(int category_no) throws Exception;
	
	//분야 검색 페이지
	//List<Search> selectByCategoryName(String keyword, int start, int last) throws Exception;
	
	
	//출판사 검색
	List<Search> publisherList(String keyword) throws Exception;
	
	//출판사 검색 페이지
	//List<Search> selectByPublisher(String keyword, int start, int last) throws Exception;
	*
	
	
	//도서 전체 조회 
	List<Search> allList()throws Exception;
	
	//도서 전체 조회_페이지
	//List<Search> getList(int start, int last)throws Exception;
	
	
	//통합 검색(제목, 저자, 분야, 출판사)
	List<Search> searchList(String keyword) throws Exception;
	
	//통합 검색(제목, 저자, 분야, 출판사) 페이지
	//List<Search> selectByAll(String keyword, int start, int last) throws Exception;
	
	
	*
	// 도서 수량 조회
	int getTotBookCount() throws Exception;

	// 도서 수량 조회_페이지?
	int getTotBookCount(String keyword) throws Exception;
	
	//검색?
	List<Search> selectSearchList(Search search)throws Exception;
	*/
}
