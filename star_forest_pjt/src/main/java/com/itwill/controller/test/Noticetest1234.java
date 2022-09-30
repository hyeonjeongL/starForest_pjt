package com.itwill.controller.test;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.repository.NoticeDao;


@Controller
public class Noticetest1234 {

	@Autowired
	private NoticeDao noticeDao;
	
	@RequestMapping("/notice_test")
	public String notice_dao_test() throws Exception {
		
		System.out.println(noticeDao.delete(2));
		
		return "test/test_result";
	}
	
	
}
