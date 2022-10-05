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
	
//	@RequestMapping(value = {"/book_search_form"})
//	public String main() {
//		return "forward:/WEB-INF/views/book_search_form.jsp";
//	}
	
	//제목
	@RequestMapping(value = {"/search_title"})
	public String search_title(@RequestParam String book_title,Model model)throws Exception{
		String forwardPath = "";
		List<Search> searchtitle=searchService.selectByTitle(book_title);
		model.addAttribute("searchtitle",searchtitle);
		forwardPath = "forward:/WEB-INF/views/book_search_form.jsp";
		return forwardPath;
	}
	//제목
	@RequestMapping(value = {"/search_title_list"})
	public String search_title_list(@RequestParam String book_title,Model model)throws Exception{
		String forwardPath = "";
		List<Search> searchtitle=searchService.selectByTitle(book_title);
		model.addAttribute("searchtitle",searchtitle);
		forwardPath = "forward:/WEB-INF/views/book_search_result.jsp";
		return forwardPath;
	}
	
	//저자
	@RequestMapping(value = {"/search_author"})
	public String search_author(@RequestParam String book_author,Model model)throws Exception{
		String forwardPath = "";
		List<Search> searchauthor=searchService.selectByAuthor(book_author);
		model.addAttribute("searchauthor",searchauthor);
		forwardPath = "forward:/WEB-INF/views/book_search_form.jsp";
		return forwardPath;
	}
	@RequestMapping(value = {"/search_author_list"})
	public String search_author_list(@RequestParam String book_author,Model model)throws Exception{
		String forwardPath = "";
		List<Search> searchtitle=searchService.selectByTitle(book_author);
		model.addAttribute("searchtitle",searchtitle);
		forwardPath = "forward:/WEB-INF/views/book_search_result.jsp";
		return forwardPath;
	}
	
	//출판사
	@RequestMapping(value = {"/search_publisher"})
	public String search_publisher(@RequestParam String book_publisher,Model model)throws Exception{
		String forwardPath = "";
		List<Search> searchpublisher=searchService.selectByPublisher(book_publisher);
		model.addAttribute("searchpublisher",searchpublisher);
		forwardPath = "forward:/WEB-INF/views/book_search_form.jsp";
		return forwardPath;
	}
	
	@RequestMapping(value = {"/search_publisher_list"})
	public String search_publisher_list(@RequestParam String book_publisher,Model model)throws Exception{
		String forwardPath = "";
		List<Search> searchtitle=searchService.selectByTitle(book_publisher);
		model.addAttribute("searchtitle",searchtitle);
		forwardPath = "forward:/WEB-INF/views/book_search_result.jsp";
		return forwardPath;
	}
	
	//분야
	@RequestMapping(value = {"/search_category_name"})
	public String search_category_name(@RequestParam String category_name,Model model)throws Exception{
		String forwardPath = "";
		List<Search> searchcategoryname=searchService.selectByCategoryName(category_name);
		model.addAttribute("searchcategoryname",searchcategoryname);
		forwardPath = "forward:/WEB-INF/views/book_search_form.jsp";
		return forwardPath;
	}
	
	@RequestMapping(value = {"/search_category_name_list"})
	public String search_category_name_list(@RequestParam String category_name,Model model)throws Exception{
		String forwardPath = "";
		List<Search> searchtitle=searchService.selectByTitle(category_name);
		model.addAttribute("searchtitle",searchtitle);
		forwardPath = "forward:/WEB-INF/views/book_search_result.jsp";
		return forwardPath;
	}
	
	//통합
	@RequestMapping(value = {"/search_all"})
	public String search_all(@RequestParam String keyword,Model model)throws Exception{
		String forwardPath = "";
		List<Search> searchall=searchService.selectByAll(keyword);
		model.addAttribute("searchall",searchall);
		forwardPath = "forward:/WEB-INF/views/book_search_form.jsp";
		return forwardPath;
	}
	
	@RequestMapping(value = {"/search_all_list"})
	public String search_all_list(@RequestParam String keyword,Model model)throws Exception{
		String forwardPath = "";
		List<Search> searchtitle=searchService.selectByTitle(keyword);
		model.addAttribute("searchtitle",searchtitle);
		forwardPath = "forward:/WEB-INF/views/book_search_result.jsp";
		return forwardPath;
	}
	
}
