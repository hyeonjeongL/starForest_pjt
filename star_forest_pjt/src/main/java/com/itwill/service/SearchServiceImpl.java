package com.itwill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.itwill.domain.Search;
import com.itwill.repository.SearchDao;
import com.itwill.util.PageMaker2;
import com.itwill.util.PageMakerDto;

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
	public List<Search> selectByTitle(String book_title) throws Exception {
		return searchDao.selectByTitle(book_title);
	}
		
	//번호 검색
	@Override
	public Search selectByNo(int book_no) throws Exception {
		return searchDao.selectByNo(book_no);
	}
	
	//저자 검색
	@Override
	public List<Search> selectByAuthor(String book_author) throws Exception {
		return searchDao.selectByAuthor(book_author);
	}
	
	//출판사검색
	@Override
	public List<Search> selectByPublisher(String book_publisher) throws Exception {
		return searchDao.selectByPublisher(book_publisher);
	}
	
	//분야검색
	@Override
	public List<Search> selectByCategoryName(String category_name) throws Exception {
		return searchDao.selectByCategoryName(category_name);
	}

	//통합검색
	@Override
	public List<Search> selectByAll(String keyword) throws Exception {
		return searchDao.selectByAll(keyword);
	}

	@Override
	public PageMakerDto<Search> selectByAuthor(String keyword, int currentPage) throws Exception {
		int totRecordCount = searchDao.selectByAuthor(keyword).size();
		PageMaker2 pageMaker2 = new PageMaker2(totRecordCount, currentPage, 3, 5);
		List<Search> searchList = searchDao.selectByAuthor(keyword, pageMaker2.getPageBegin(), pageMaker2.getPageEnd());		
		PageMakerDto<Search> pageMakerSearchList = new PageMakerDto<Search>(searchList, pageMaker2, totRecordCount);
		
		return pageMakerSearchList;
	}
	@Override
	public PageMakerDto<Search> selectByPublisher(String keyword, int currentPage) throws Exception {
		int totRecordCount = searchDao.selectByPublisher(keyword).size();
		PageMaker2 pageMaker2 = new PageMaker2(totRecordCount, currentPage, 3, 5);
		List<Search> searchList = searchDao.selectByPublisher(keyword, pageMaker2.getPageBegin(), pageMaker2.getPageEnd());		
		PageMakerDto<Search> pageMakerSearchList = new PageMakerDto<Search>(searchList, pageMaker2, totRecordCount);
		
		return pageMakerSearchList;
	}
	@Override
	public PageMakerDto<Search> selectByCategoryName(String keyword, int currentPage) throws Exception {
		int totRecordCount = searchDao.selectByCategoryName(keyword).size();
		PageMaker2 pageMaker2 = new PageMaker2(totRecordCount, currentPage, 3, 5);
		List<Search> searchList = searchDao.selectByCategoryName(keyword, pageMaker2.getPageBegin(), pageMaker2.getPageEnd());		
		PageMakerDto<Search> pageMakerSearchList = new PageMakerDto<Search>(searchList, pageMaker2, totRecordCount);
		
		return pageMakerSearchList;
	}
	@Override
	public PageMakerDto<Search> selectByAll(String keyword, int currentPage) throws Exception {
		int totRecordCount = searchDao.selectByAll(keyword).size();
		PageMaker2 pageMaker2 = new PageMaker2(totRecordCount, currentPage, 3, 5);
		List<Search> searchList = searchDao.selectByAll(keyword, pageMaker2.getPageBegin(), pageMaker2.getPageEnd());		
		PageMakerDto<Search> pageMakerSearchList = new PageMakerDto<Search>(searchList, pageMaker2, totRecordCount);
		
		return pageMakerSearchList;
	}

	@Override
	public PageMakerDto<Search> selectByTitle(String keyword, int currentPage) throws Exception {
		int totRecordCount = searchDao.selectByTitle(keyword).size();
		PageMaker2 pageMaker2 = new PageMaker2(totRecordCount, currentPage, 3, 5);
		List<Search> bookList = searchDao.selectByTitle(keyword, pageMaker2.getPageBegin(), pageMaker2.getPageEnd());
		System.out.println(bookList);
		PageMakerDto<Search> pageMakerBookList = new PageMakerDto<Search>(bookList, pageMaker2, totRecordCount);
		System.out.println(pageMakerBookList.itemList);
		return pageMakerBookList;
	}

	
}
