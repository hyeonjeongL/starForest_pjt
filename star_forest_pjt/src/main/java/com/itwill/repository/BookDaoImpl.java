package com.itwill.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Book;
import com.itwill.mapper.BookMapper;

@Repository
public class BookDaoImpl implements BookDao {

	@Autowired
	private BookMapper bookMapper;

	@Override
	public int insertBook(Book book) throws Exception {
		return bookMapper.insertBook(book);
	}

	@Override
	public Book selectBookDetail(int book_no) throws Exception {
		return bookMapper.selectBookDetail(book_no);
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
	public int updateById(String user_id) throws Exception {
		return bookMapper.updateById(user_id);
	}

	@Override
	public int updateByIdNo(String user_id, int book_no) throws Exception {
		return bookMapper.updateByIdNo(user_id, book_no);
	}

	@Override
	public List<Book> selectAll() throws Exception {
		return bookMapper.selectAll();
	}

}
