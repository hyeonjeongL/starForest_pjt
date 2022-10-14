package com.itwill.controller;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.domain.Search;
import com.itwill.repository.SearchDao;
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
	/*
	 * private static final Logger logger =LoggerFactory.getLogger(SearchController.class);
	
	//분야별 리스트
	@RequestMapping(value = "/SearchList", method = RequestMethod.GET)
	public void getList(@RequestParam ("c") int category_no,@RequestParam ("l") int level, Model model)throws Exception{
		logger.info("get lSearchList");
		
		List<Search> list=null;
		list = searchService.list(category_no,level);
		
		model.addAttribute("SearchList",list);
	}
	
	
	@RequestMapping("/SearchResult")
	public String Allbooks(Model model) {
		try {
			List<Search> allBook = searchService.allList();
			model.addAttribute("allBook",allBook);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "SearchResult";
	}
	@RequestMapping(value="/SearchList",method=RequestMethod.GET)
	public String SearchList() {
		return "SearchList";
	}*/
	

	/*
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
		forwardPath = "forward:/WEB-INF/views/book_search_result.jsp";
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
		forwardPath = "forward:/WEB-INF/views/book_search_result.jsp";
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
		forwardPath = "forward:/WEB-INF/views/book_search_result.jsp";
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
		forwardPath = "forward:/WEB-INF/views/book_search_result.jsp";
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
		forwardPath = "forward:/WEB-INF/views/book_search_result.jsp";
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
	
	//검색
	@GetMapping("/getSearchList")
	@ResponseBody
	private List<Search> getSearchList(@RequestParam("type") String type,
			@RequestParam("keyword") String keyword,Model model)throws Exception{
		Search search=new Search();
		search.setType(type);
		search.setKeyword(keyword);
		return searchService.getSearchList(search);
	}
	
	//분야별 리스트
	private static final org.slf4j.Logger logger= LoggerFactory.getLogger(SearchController.class);

	@RequestMapping(value="/list",method = RequestMethod.GET)
	public void getList(@RequestParam("c") int category_no,
			@RequestParam("l")int level, Model model)throws Exception{
		logger.info("get llist");
		
		List<Search> list= null;
		list= searchService.list(category_no);
		
		model.addAttribute("list", list);
		
	}

*/


}
