package com.itwill.controller;

import org.springframework.web.bind.annotation.RestController;

//검색기능
@RestController
public class SearchRestController {
	/*
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
	
	
	
	@Autowired(required = true)
	private BookService bookService;

	@RequestMapping("/rest_book_detail")
	public Book book_detail(@RequestParam(value = "book_no", required = false) String book_noStr, Model model) throws Exception {

		Book book = bookService.selectBookDetail(Integer.parseInt(book_noStr));
		
		return book;
	}
	*/
	
	
	
}
