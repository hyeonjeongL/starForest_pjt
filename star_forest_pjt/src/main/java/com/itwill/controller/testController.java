package com.itwill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.service.BookService;


@Controller
public class testController {
	@Autowired
	BookService BookService;
	
	@RequestMapping("/bookCart.do")
	public String test1() {
		System.out.println("test");
		return "bookCart";
	}
	@RequestMapping("/borrowList.do")
	public String test2() {
		System.out.println("test");
		return "borrowList";
	}
	@RequestMapping("/postDetail.do")
	public String test3() {
		System.out.println("test");
		return "postDetail";
	}
	@RequestMapping("/loginPage.do")
	public String test4() {
		System.out.println("test");
		return "loginPage.do";
	}
	@RequestMapping("/detailBook.do")
	public String test5() {
		System.out.println("test");
		return "detailBook";
	}
	@RequestMapping("/faqViewpage.do")
	public String test6() {
		System.out.println("test");
		return "faqViewpage";
	}
	@RequestMapping("/findEmail.do")
	public String test7() {
		System.out.println("test");
		return "findEmail";
	}
	@RequestMapping("/Home.do")
	public String test8() {
		System.out.println("test");
		return "Home";
	}
	@RequestMapping("/MyLibrary.do")
	public String test9() {
		System.out.println("test");
		return "MyLibrary";
	}
	@RequestMapping("/howtoInfo.do")
	public String test10() {
		System.out.println("test");
		return "howtoInfo";
	}
	@RequestMapping("/insertCustomer.do")
	public String test11() {
		System.out.println("test");
		return "insertCustomer";
	}
	@RequestMapping("/insertCustomerSuccess.do")
	public String test12() {
		System.out.println("test");
		return "insertCustomerSuccess";
	}
	@RequestMapping("/login.do")
	public String test13() {
		System.out.println("test");
		return "login";
	}
	@RequestMapping("/ManagePage.do")
	public String test15() {
		System.out.println("test");
		return "ManagePage";
	}
	@RequestMapping("/MyPage_DetailFile.do")
	public String test17() {
		System.out.println("test");
		return "MyPage_DetailFile";
	}
	@RequestMapping("/MyPage_File.do")
	public String test18() {
		System.out.println("test");
		return "MyPage_File";
	}
	@RequestMapping("/MyPage_Folder_search.do")
	public String test19() {
		System.out.println("test");
		return "MyPage_Folder_search";
	}
	@RequestMapping("/MyPage_Folder.do")
	public String test20() {
		System.out.println("test");
		return "MyPage_Folder";
	}
	@RequestMapping("/MyPage_Info.do")
	public String test21() {
		System.out.println("test");
		return "MyPage_Info";
	}
	@RequestMapping("/MyPage_main.do")
	public String test22() {
		System.out.println("test");
		return "MyPage_main";
	}
	@RequestMapping("/Newbooks.do")
	public String test23() {
		System.out.println("test");
		return "Newbooks";
	}
	@RequestMapping("/popularBook.do")
	public String test24() {
		System.out.println("test");
		return "popularBook";
	}
	@RequestMapping("/postInsert.do")
	public String test26() {
		System.out.println("test");
		return "postInsert";
	}
	@RequestMapping("/postList.do")
	public String test27() {
		System.out.println("test");
		return "postList";
	}
	@RequestMapping("/postUpdate.do")
	public String test28() {
		System.out.println("test");
		return "postUpdate";
	}
	@RequestMapping("/QnaDetail.do")
	public String test29() {
		System.out.println("test");
		return "QnaDetail";
	}
	@RequestMapping("/QnaInsert.do")
	public String test30() {
		System.out.println("test");
		return "QnaInsert";
	}
	@RequestMapping("/QnaList.do")
	public String test31() {
		System.out.println("test");
		return "QnaList";
	}
	@RequestMapping("/QnaUpdate.do")
	public String test32() {
		System.out.println("test");
		return "QnaUpdate";
	}
	@RequestMapping("/recommendedBooks.do")
	public String test33() {
		System.out.println("test");
		return "recommendedBooks";
	}
	@RequestMapping("/return_borrowList.do")
	public String test34() {
		System.out.println("test");
		return "return_borrowList";
	}
	@RequestMapping("/SearchResult.do")
	public String test35() {
		System.out.println("test");
		return "SearchResult";
	}
	@RequestMapping("/siteMap.do")
	public String test36() {
		System.out.println("test");
		return "siteMap";
	}
	@RequestMapping("/seatReservation.do")
	public String test37() {
		System.out.println("test");
		return "seatReservation";
	}

}