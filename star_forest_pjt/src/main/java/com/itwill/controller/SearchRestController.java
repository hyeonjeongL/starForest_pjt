package com.itwill.controller;


import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwill.domain.Search;
import com.itwill.service.SearchService;
import com.itwill.util.PageMakeDTO;
import com.itwill.util.PageUtil;
//검색기능
@Controller
@RequestMapping("/star_forest_pjt/*")
public class SearchRestController {
	@Autowired
	private SearchService searchService;
	
	private static final org.slf4j.Logger logger =LoggerFactory.getLogger(SearchRestController.class);
	
	//분야별 리스트
	@RequestMapping(value = "/SearchList", method = RequestMethod.GET)
	public void getList(@RequestParam ("c") int category_no,@RequestParam ("l") int level, Model model )throws Exception{
		logger.info("get SearchList");
		
		List<Search> list=null;
		list = searchService.list(category_no,level);
		
		model.addAttribute("SearchList",list);
		
	}
	

	
	
	
}
