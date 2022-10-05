package com.itwill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.service.RentalService;

@RestController
public class RentalRestController {
	
	@Autowired
	private RentalService rentalService;
	
	@RequestMapping(value = "return_duedate_rest" )
	public String return_duedate(@RequestParam int book_no ) throws Exception{
		String return_duedate = rentalService.selectMostReturn_duedate(book_no);
		
		
		return "return_duedate";
	}

}
