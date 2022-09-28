package com.itwill.repository;

import com.itwill.domain.BookCategory;
import com.itwill.domain.BookClub;

public class BookClubDaoTest {

	public static void main(String[] args) throws Exception {
		
		BookClubDaoImpl bookClubDao=new BookClubDaoImpl();
		System.out.println("------create-----");		
		System.out.println("insertCount:"+bookClubDao.create(new BookClub(0, "환영합니다", 3, "누구든환영", "매주 화요일 3시", 
																			"강남역 2번출구", "같이 모임해요", 4, new BookCategory(100, null), "yeji")));
		
		System.out.println("----update----");
		BookClub bookClub=bookClubDao.selectByNo(3);
		bookClub.setClub_name("취미부자인생");
		System.out.println("updateCount:"+bookClubDao.update(bookClub));
		
	}
	
}
