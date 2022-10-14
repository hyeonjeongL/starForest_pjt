package com.itwill.repository;

import java.util.HashMap;
import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Search;
import com.itwill.mapper.SearchMapper;


@Repository
public class SearchDaoImpl implements SearchDao {
	

	
	@Autowired
	private SearchMapper searchMapper;
	

	//매퍼
	

	//분야별 리스트:2차 분류
	@Override
	public List<Search> list(int category_no) throws Exception {
		
		return searchMapper.searchList(new Search());
	}

	//분야별 리스트:1차 분류
	@Override
	public List<Search> list(int category_no, int cateno) throws Exception {
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		map.put("category_no",category_no);
		map.put("cateno",cateno);
		
		return searchMapper.searchList(new Search());
	}

	@Override
	public List<Search> cate() throws Exception {
		return null;
	}


	
	// 게시물 총 갯수 + 검색 적용
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
	 
		HashMap data = new HashMap();
	 
	 data.put("searchType", searchType);
	 data.put("keyword", keyword);
	 
	 return 0;
	}

	@Override
	public List<Search> allList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Search> selectNo(int book_no) throws Exception {
		return searchMapper.selectNo(book_no);
	}

	@Override
	public List<Search> searchList(Search search) throws Exception {
		return searchMapper.searchList(search);
	}

	@Override
	public List<Search> selectNoTot(int book_no) {
		return searchMapper.selectNoTot(book_no);
	}

	
	

/*
	public List<Search> getSearchList() {
		// TODO Auto-generated method stub
		return null;
	}

	public int getTotal(PageUtil page) {
		// TODO Auto-generated method stub
		return 0;
	}*/
/*
	@Autowired
	private SearchMapper searchMapper;

	//제목 검색
	@Override
	public List<Search> titleList(String keyword) throws Exception {
		return searchMapper.titleList(keyword);
	}

	//번호 검색
	@Override
	public Search selectByNo(int book_no) throws Exception {
		return searchMapper.selectByNo(book_no);
	}

	//저자 검색
	@Override
	public List<Search> authorList(String keyword) throws Exception {
		return searchMapper.authorList(keyword);
	}

	//분야명 검색
	@Override
	public List<Search> cateNameList(String keyword) throws Exception {
		return searchMapper.cateNameList(keyword);
	}

	//분야 번호 검색
	@Override
	public List<Search> cateNoList(int category_no) throws Exception {
		return searchMapper.cateNoList(category_no);
	}

	//출판사 검색
	@Override
	public List<Search> publisherList(String keyword) throws Exception {
		return searchMapper.publisherList(keyword);
	}

	//도서 전체 조회 
	@Override
	public List<Search> allList() throws Exception {
		return searchMapper.allList();
	}

	//통합 검색(제목, 저자, 분야, 출판사)
	@Override
	public List<Search> searchList(String keyword) throws Exception {
		return searchMapper.searchList(keyword);
	}
	
	*/
		
}
