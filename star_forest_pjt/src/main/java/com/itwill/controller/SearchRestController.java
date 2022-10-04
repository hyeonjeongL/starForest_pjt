package com.itwill.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.domain.Search;
import com.itwill.service.SearchService;
//검색기능
@Controller
public class SearchRestController {
	@Autowired
	private SearchService searchService;
	
	public SearchRestController(){
		
	}
	
	
	
}
