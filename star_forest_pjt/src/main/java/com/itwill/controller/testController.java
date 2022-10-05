package com.itwill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.service.BookService;


@Controller
public class testController {
	@Autowired
	BookService BookService;
	
	@RequestMapping("/bookCart")
	public String test1() {
		System.out.println("test");
		return "bookCart";
	}
	@RequestMapping("/borrowList")
	public String test2() {
		System.out.println("test");
		return "borrowList";
	}
	@RequestMapping("/postDetail")
	public String test3() {
		System.out.println("test");
		return "postDetail";
	}
	@RequestMapping("/LoginPage")
	public String test4() {
		System.out.println("test");
		return "LoginPage";
	}
	@RequestMapping("/detailBook")
	public String test5() {
		System.out.println("test");
		return "detailBook";
	}
	@RequestMapping("/faqViewpage")
	public String test6() {
		System.out.println("test");
		return "faqViewpage";
	}
	@RequestMapping("/findEmail")
	public String test7() {
		System.out.println("test");
		return "findEmail";
	}
	@RequestMapping("/Home")
	public String test8() {
		System.out.println("test");
		return "Home";
	}
	@RequestMapping("/MyLibrary")
	public String test9() {
		System.out.println("test");
		return "MyLibrary";
	}
	@RequestMapping("/howtoInfo")
	public String test10() {
		System.out.println("test");
		return "howtoInfo";
	}
	@RequestMapping("/insertCustomer")
	public String test11() {
		System.out.println("test");
		return "insertCustomer";
	}
	@RequestMapping("/insertCustomerSuccess")
	public String test12() {
		System.out.println("test");
		return "insertCustomerSuccess";
	}
	@RequestMapping("/login.do")
	public String test13() {
		System.out.println("test");
		return "login";
	}
	@RequestMapping("/ManagePage")
	public String test15() {
		System.out.println("test");
		return "ManagePage";
	}
	@RequestMapping("/MyPage_DetailFile")
	public String test17() {
		System.out.println("test");
		return "MyPage_DetailFile";
	}
	@RequestMapping("/MyPage_File")
	public String test18() {
		System.out.println("test");
		return "MyPage_File";
	}
	@RequestMapping("/MyPage_Folder_search")
	public String test19() {
		System.out.println("test");
		return "MyPage_Folder_search";
	}
	@RequestMapping("/MyPage_Folder")
	public String test20() {
		System.out.println("test");
		return "MyPage_Folder";
	}
	@RequestMapping("/MyPage_Info")
	public String test21() {
		System.out.println("test");
		return "MyPage_Info";
	}
	@RequestMapping("/MyPage_main")
	public String test22() {
		System.out.println("test");
		return "mypage_main";
	}
	@RequestMapping("/Newbooks")
	public String test23() {
		System.out.println("test");
		return "Newbooks";
	}
	@RequestMapping("/popularBook")
	public String test24() {
		System.out.println("test");
		return "popularBook";
	}
	@RequestMapping("/postInsert")
	public String test26() {
		System.out.println("test");
		return "postInsert";
	}
	@RequestMapping("/postList")
	public String test27() {
		System.out.println("test");
		return "postList";
	}
	@RequestMapping("/postUpdate")
	public String test28() {
		System.out.println("test");
		return "postUpdate";
	}
	@RequestMapping("/QnaDetail")
	public String test29() {
		System.out.println("test");
		return "QnaDetail";
	}
	@RequestMapping("/QnaInsert")
	public String test30() {
		System.out.println("test");
		return "QnaInsert";
	}
	@RequestMapping("/QnaList")
	public String test31() {
		System.out.println("test");
		return "QnaList";
	}
	@RequestMapping("/QnaUpdate")
	public String test32() {
		System.out.println("test");
		return "QnaUpdate";
	}
	@RequestMapping("/recommendedBooks")
	public String test33() {
		System.out.println("test");
		return "recommendedBooks";
	}
	@RequestMapping("/return_borrowList")
	public String test34() {
		System.out.println("test");
		return "return_borrowList";
	}
	@RequestMapping("/SearchResult")
	public String test35() {
		System.out.println("test");
		return "SearchResult";
	}
	@RequestMapping("/siteMap.do")
	public String test36() {
		System.out.println("test");
		return "siteMap";
	}
	@RequestMapping("/bookclub")
	public String test37() {
		System.out.println("test");
		return "bookclub";
	}
	@RequestMapping("/book_search_form")
	public String test38() {
		System.out.println("test");
		return "book_search_form";
	}
	@RequestMapping("/SearchList")
	public String test39() {
		System.out.println("test");
		return "SearchList";
	}

}