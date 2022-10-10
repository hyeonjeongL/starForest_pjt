package com.itwill.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.controller.interceptor.LoginCheck;
import com.itwill.domain.Book;
import com.itwill.service.BookService;
import com.itwill.service.RentalService;


@Controller
public class BookController {
	@Autowired
	BookService bookService;
	@Autowired
	RentalService rentalService;
	
	//소장정보구현
	@LoginCheck
	@RequestMapping("/book_detail")
	public String book_detail(int book_no, HttpSession session,Model model ) {
		String forwardPath = "";
		try {
			Book book = bookService.selectBookDetail(book_no);
			model.addAttribute("book", book);
			String rental_duedate = rentalService.selectMostReturn_duedate(book.getBook_no());
			model.addAttribute("rental_duedate",rental_duedate);
			
			int book_qty = book.getBook_qty();
//			book_qty  = book_qty < 0 ?  book_qty = 0 : book_qty;
			if(book_qty<0) {
				book.setBook_qty(0);
			}
			int book_res_cnt = book.getBook_res_cnt();
			if(book_qty<=3 && book_qty>=1) {
				model.addAttribute("rental_status", "대출가능");
				model.addAttribute("res_status", "");
				model.addAttribute("rentalPos", "<span\n"
						+ "	class=\"item-modal\"> <a data-toggle=\"modal\"\n"
						+ "	data-target=\"#item-user-request\" class=\"item-loc-service\"\n"
						+ "	title=\"간편대출신청\" href=\"\"><span\n"
						+ "	class=\"char-icon char-icon-magenta\">B</span></a>");
				
			}else if(book_qty==0 && book_res_cnt<=4 ) {
				model.addAttribute("rental_status", "대출중");
				model.addAttribute("res_status", "예약가능 ("+book_res_cnt+"명 예약중)");
				model.addAttribute("reservation1", "<span\n"
						+ "	class=\"item-modal\"> <a data-toggle=\"modal\"\n"
						+ "	data-target=\"#item-user-request\" class=\"item-loc-service\"\n"
						+ "	title=\"도서예약신청\" href=\"\"> <span class=\"char-icon\">R</span>\n"
						+ "	</a>");
			}else if(book_qty==0 && book_res_cnt==5) {
				model.addAttribute("rental_status", "예약불가");
				model.addAttribute("res_status", "예약한도초과");
			}
			
			/**대여시 실행해야 할 쿼리
			 * Book - updateRentalBookQty (재고감소)
			 * Book - updateRentalCnt (대여횟수 증가)
			 * Rental - insertRental(대여)
			*/
			List<Book> newBook = bookService.selectNew();
			model.addAttribute("newBook",newBook);
			
			forwardPath = "forward:/WEB-INF/views/book_detail.jsp";
			
		} catch (Exception e) {
			e.printStackTrace();
			forwardPath = "forward:/WEB-INF/views/error.jsp";
			
		}
		
		return forwardPath ;
	}
	
	@RequestMapping("/Home")
	public String Home(Model model) {
		try {
			List<Book> favorite = bookService.selectFavorite();
			List<Book> newBook = bookService.selectNew();
			model.addAttribute("favorite",favorite);
			model.addAttribute("newBook",newBook);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "Home";
	}
	
	@RequestMapping("/recommendedBooks")
	public String recommendedBooks(Model model) {
		try {
			List<Book> favorite = bookService.selectFavorite();
			model.addAttribute("favorite",favorite);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "recommendedBooks";
	}
	
	@RequestMapping("/book_categoryList")
	public String BookCategoryList(@RequestParam(value = "category_no", required = false) Model model,String category_no) {
		try {
			int bookCategoryCount = bookService.bookCategoryCount();
			List<Book> bookCategory = bookService.selectCategory(Integer.parseInt(category_no));
			model.addAttribute("bookCategoryCount",bookCategoryCount);
			model.addAttribute("bookCategory",bookCategory);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "book_categoryList";
	}
	
	@RequestMapping("/book_newList")
	public String book_newList(Model model) {
		try {
			List<Book> newBook = bookService.selectNew();
			model.addAttribute(newBook);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "book_newList";
	}
	

}