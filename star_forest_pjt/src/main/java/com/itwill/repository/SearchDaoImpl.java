package com.itwill.repository;

import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Search;
import com.itwill.domain.SearchSQL;
import com.itwill.mapper.SearchMapper;
import com.itwill.util.PageUtil;

@Repository
public class SearchDaoImpl implements SearchDao {
	
	@Autowired
    private SqlSession sqlSession;

	//매퍼
	private static String namespace="com.itwill.mapper.SearchMapper";

	//분야별 리스트:2차 분류
	@Override
	public List<Search> list(int category_no) throws Exception {
		return sqlSession.selectList(namespace+".list_2",category_no);
	}

	//분야별 리스트:1차 분류
	@Override
	public List<Search> list(int category_no, int cateno) throws Exception {
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		map.put("category_no",category_no);
		map.put("cateno",cateno);
		
		return sqlSession.selectList(namespace+".list_1",map);
	}

	@Override
	public List<Search> cate() throws Exception {
		return sqlSession.selectList(namespace+".category");
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
