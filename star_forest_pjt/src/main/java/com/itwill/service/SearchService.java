package com.itwill.service;

import java.util.List;

import com.itwill.domain.Search;

//검색기능
public interface SearchService {
	
	//제목 검색
	public List<Search> selectByTitle(String keyword) throws Exception;
	
	//제목 검색_페이지
	public List<Search> selectByTitle(String keyword, int start, int last) throws Exception;

}
