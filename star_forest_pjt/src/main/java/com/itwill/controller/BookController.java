package com.itwill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.domain.Book;
import com.itwill.service.BookService;
import com.itwill.service.RentalService;


@Controller
public class BookController {
	@Autowired
	BookService bookService;
	@Autowired
	RentalService rentalService;
	
	
	@RequestMapping("/book_detail")
	public String book_detail(@RequestParam(value = "book_no", required = false) String book_noStr,Model model ) {
		String forwardPath = "";
		try {
			Book book = bookService.selectBookDetail(Integer.parseInt(book_noStr));
			model.addAttribute("book", book);
			String rental_duedate = rentalService.selectMostReturn_duedate(book.getBook_no());
			model.addAttribute("rental_duedate",rental_duedate);
			
			int book_qty = book.getBook_qty();
			int book_res_cnt = book.getBook_res_cnt();
			if(book_qty<=3 && book_qty>=1) {
				model.addAttribute("rental_status", "대출가능");
				model.addAttribute("ren", "대출가능");
			}else if(book_qty==0 && book_res_cnt<=4 ) {
				model.addAttribute("rental_status", "대출중");
				model.addAttribute("res_status", "예약가능 ("+book_res_cnt+"명 예약중)");
			}else if(book_qty==0 && book_res_cnt==5) {
				model.addAttribute("rental_status", "예약불가");
				model.addAttribute("res_status", "예약한도초과");
			}
			
			/**대여시 실행해야 할 쿼리
			 * Book - updateRentalBookQty (재고감소)
			 * Book - updateRentalCnt (대여횟수 증가)
			 * Rental - insertRental(대여)
			*/
			
			
			
			
			forwardPath = "forward:/WEB-INF/views/book_detail.jsp";
			
		} catch (Exception e) {
			e.printStackTrace();
			forwardPath = "forward:/WEB-INF/views/error.jsp";
			
		}
		
		
		return forwardPath ;
	}
	
	@RequestMapping("/selectAll")
	public String recommendedBooks(@RequestParam(value = "book_no", required = false) String book_noSrt,Model model) {
		return "forward:/WEB-INF/views/recommendedBooks";
	}


}