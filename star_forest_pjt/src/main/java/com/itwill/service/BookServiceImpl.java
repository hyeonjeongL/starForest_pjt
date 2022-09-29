package com.itwill.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwill.domain.Book;
import com.itwill.mapper.BookMapper;
import com.itwill.repository.BookDao;


@Service
@Transactional
public class BookServiceImpl implements BookService {
	@Autowired(required=true) //해당 타입의 빈 객체가 존재하지 않는 경우 예외 처리
	private BookMapper bookMapper;
	
	public BookServiceImpl() {
		
	}

	public BookMapper getBookMapper() {
		return bookMapper;
	}

	public void setBookMapper(BookMapper bookMapper) {
		this.bookMapper = bookMapper;
	}
	

	@Override
	public Book insertBook(Book book) throws Exception {
		return bookMapper.insertBook(book);
	}

	@Override
	public Book selectBookDetail(int bookd_no) throws Exception {
		return bookMapper.selectBookDetail(bookd_no);
	}

	@Override
	public int updateRentalBookQty(int book_no) throws Exception {
		return bookMapper.updateRentalBookQty(book_no);
	}

	@Override
	public int updateReturnBookQty(int book_no) throws Exception {
		return bookMapper.updateReturnBookQty(book_no);
	}

	@Override
	public String updateById(String user_id) throws Exception {
		return bookMapper.updateById(user_id);
	}

	@Override
	public Map<String, Object> updateByIdNo(String user_id, int book_no) {
		return bookMapper.updateByIdNo(user_id, book_no);
	}
	
	@Override
	public List<Book> selectAll(){
		return bookMapper.selectAll();
	}

}