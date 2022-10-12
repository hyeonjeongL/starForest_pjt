package com.itwill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.domain.Search;
import com.itwill.repository.SearchDao;

//검색기능
@Service
public class SearchServiceImpl  implements SearchService{
	@Autowired
	private SearchDao searchDao;
	
	public SearchServiceImpl() {
	}
	
	public List<Search> list (int category_no,int level) throws Exception{
		
		int cateno=0;
		
		if(level == 1) {  // lavel 1 = 1차 분류.
			  
			cateno = category_no;
			  return searchDao.list(category_no, cateno);
			  // 두가지 모두 cateCode로 해도 무관
			  
			 } else {  // lavel 2 = 2차 분류
			  
			  return searchDao.list(category_no);
			  
			 }
		
	}
	
/*
	//제목 검색
	@Override
	public List<Search> titleList(String keyword) throws Exception {
		return searchDao.titleList(keyword);
	}

	//번호검색
	@Override
	public Search selectByNo(int book_no) throws Exception {
		return searchDao.selectByNo(book_no);
	}

	//저자검색
	@Override
	public List<Search> authorList(String keyword) throws Exception {
		return searchDao.authorList(keyword);
	}

	//분야명 검색
	@Override
	public List<Search> cateNameList(String keyword) throws Exception {
		return searchDao.cateNameList(keyword);
	}

	//분야 번호 검색
	@Override
	public List<Search> cateNoList(int category_no) throws Exception {
		return searchDao.cateNoList(category_no);
	}

	//출판사검색
	@Override
	public List<Search> publisherList(String keyword) throws Exception {
		return searchDao.publisherList(keyword);
	}

	//도서 리스트
	@Override
	public List<Search> allList() throws Exception {
		return searchDao.allList();
	}

	//통합검색
	@Override
	public List<Search> searchList(String keyword) throws Exception {
		return searchDao.searchList(keyword);
	}
	
	*/
	
	
}
