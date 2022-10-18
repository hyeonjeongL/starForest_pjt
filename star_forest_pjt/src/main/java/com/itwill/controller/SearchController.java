package com.itwill.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itwill.domain.Search;
import com.itwill.service.SearchService;


@Controller
public class SearchController {
	
	@Autowired
	private SearchService searchService;
	
	@GetMapping("/getSearchList")
	@ResponseBody
	public List<Search> getSearchList (@RequestParam("type") String type,
			@RequestParam("keyword") String keyword, Model model) throws Exception{
		Search search= new Search();
		search.setType(type);
		search.setKeyword(keyword);
		return searchService.searchList(search);
	}
	
	
	@GetMapping("/getCateList")
	@ResponseBody
	public List<Search> getCateList (@RequestParam("category_no") int category_no, Model model) throws Exception{
		Search search= new Search();
		search.setCategory_no(category_no);
		return searchService.cateList(category_no);
	}

	@GetMapping("/getAllList")
	@ResponseBody
	public List<Search> getAllList (Model model) throws Exception{
		Search search= new Search();
		return searchService.allList();
	}
	
	
	@RequestMapping("/Allbooks")
	public String Allbooks(Model model) {
		try {
			List<Search> allBook = searchService.allList();
			model.addAttribute("allBook",allBook);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "SearchList";
	}
	
	
	
			


}
