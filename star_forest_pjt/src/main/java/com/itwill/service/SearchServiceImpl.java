package com.itwill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.itwill.domain.Search;
import com.itwill.repository.SearchDao;

//검색기능
public class SearchServiceImpl implements SearchService{
	@Autowired
	private SearchDao searchDao;
	
	public SearchServiceImpl() {
	}
	public SearchServiceImpl(SearchDao searchDao) {
		this.searchDao=searchDao;
	}
	public void setSearchDao(SearchDao searchDao) {
		this.searchDao=searchDao;
	}

	//제목 검색
	@Override
	public List<Search> selectByTitle(String keyword) throws Exception {
		return searchDao.selectByTitle(keyword);
	}
	//제목 검색_페이지
	@Override
	public List<Search> selectByTitle(String keyword, int start, int last) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
