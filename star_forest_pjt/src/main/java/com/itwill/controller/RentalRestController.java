package com.itwill.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.domain.Rental;
import com.itwill.service.BookService;
import com.itwill.service.BookServiceImpl;
import com.itwill.service.RentalService;

@RestController
public class RentalRestController {
	
	@Autowired
	private RentalService rentalService;
	
	@Autowired
	private BookService bookService;
	
	
	@GetMapping("/rest_rental")
	public Map rental_tot(HttpServletRequest request, @RequestParam Integer book_no) {
		Map resultMap = new HashMap();
		
		int code = 2;
		String url = "";
		String msg = "";
		
		return resultMap;
	}
	
	/*
	 * @RequestMapping(value = "rest_rental") public String
	 * rental_tot(@RequestParam(value = "book_no") String book_noStr, Model model)
	 * throws Exception{
	 * bookService.updateRentalBookQty(Integer.parseInt(book_noStr));
	 * bookService.updateRentalCnt(Integer.parseInt(book_noStr));
	 * rentalService.insertRental(new Rental(0, null, null, null, 0,
	 * Integer.parseInt(book_noStr), null));
	 * 
	 * return "야호"; }
	 */

}
