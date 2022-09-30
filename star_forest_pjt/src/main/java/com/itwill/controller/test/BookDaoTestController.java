package com.itwill.controller.test;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.domain.Book;
import com.itwill.domain.Rental;
import com.itwill.repository.BookDao;
import com.itwill.repository.RentalDao;

@Controller
public class BookDaoTestController {

	@Autowired
	private BookDao bookDao;
	
	private RentalDao rentalDao;
	
	
	//book 
	@RequestMapping("/book_test")
	public String book_dao_test() throws Exception {
		
		Book testBook = new Book(0, 502173640,"임현정","스프링부트를찾아서", "아이티윌","한달의 프로젝트기간 ....", "2022년 9월", null, null, null, 200, 3, 0, 0, 100);
		System.out.println("book dao test");
		System.out.println(bookDao.selectBookDetail(12));
		System.out.println(bookDao.updateRentalBookQty(1));
		System.out.println(bookDao.updateReturnBookQty(2));
		System.out.println(bookDao.updateById("hyeonjeong"));
		System.out.println(bookDao.updateByIdNo("yeji",3));
		System.out.println(bookDao.selectAll());
		
		return "test/test_result";
	}
	
	public String rental_dao_test() {
		
		System.out.println(rentalDao.updateDate("hyeonjeong", 4));
		System.out.println(rentalDao.selectById("hyeonjeong"));
		System.out.println(rentalDao.selectByNo(2));
		System.out.println(rentalDao.updateRentalStatus("hyeonjeong", 2));
		
		return  "test/test_result";
		
	}
	
	
}
