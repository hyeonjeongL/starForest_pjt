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
public class SearchController {
	@Autowired
	private SearchService searchService;
	
	public SearchController(){
		
	}
	
	@RequestMapping(value = {"/main","*.do"})
	public String main() {
		return "forward:/WEB-INF/views/main.jsp";
	}
	
	//제목
	@RequestMapping(value = {"/main"})
	public String search_title(@RequestParam String book_title,Model model)throws Exception{
		String forwardPath = "";
		List<Search> searchtitle=searchService.selectByTitle(book_title);
		model.addAttribute("searchtitle",searchtitle);
		forwardPath = "forward:/WEB-INF/views/main.jsp";
		return forwardPath;
	}
	
	//저자
	@RequestMapping(value = {"/main"})
	public String search_author(@RequestParam String book_author,Model model)throws Exception{
		String forwardPath = "";
		List<Search> searchauthor=searchService.selectByAuthor(book_author);
		model.addAttribute("searchauthor",searchauthor);
		forwardPath = "forward:/WEB-INF/views/main.jsp";
		return forwardPath;
	}
	
	//출판사
	@RequestMapping(value = {"/main"})
	public String search_publisher(@RequestParam String book_publisher,Model model)throws Exception{
		String forwardPath = "";
		List<Search> searchpublisher=searchService.selectByPublisher(book_publisher);
		model.addAttribute("searchauthor",searchpublisher);
		forwardPath = "forward:/WEB-INF/views/main.jsp";
		return forwardPath;
	}
	
	//분야
	@RequestMapping(value = {"/main"})
	public String search_category_name(@RequestParam String category_name,Model model)throws Exception{
		String forwardPath = "";
		List<Search> searchcategoryname=searchService.selectByCategoryName(category_name);
		model.addAttribute("searchauthor",searchcategoryname);
		forwardPath = "forward:/WEB-INF/views/main.jsp";
		return forwardPath;
	}
	
	//통합
	@RequestMapping(value = {"/main"})
	public String search_all(@RequestParam String keyword,Model model)throws Exception{
		String forwardPath = "";
		List<Search> searchall=searchService.selectByAll(keyword);
		model.addAttribute("searchauthor",searchall);
		forwardPath = "forward:/WEB-INF/views/main.jsp";
		return forwardPath;
	}
	
}
