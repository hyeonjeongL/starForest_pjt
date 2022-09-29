package com.itwill.controller.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.domain.BookCategory;
import com.itwill.domain.BookClub;
import com.itwill.domain.Favorite;
import com.itwill.repository.BookClubDao;
import com.itwill.repository.FavoriteDao;

@Controller
public class DaoTestController {

	@Autowired
	private FavoriteDao favoriteDao;
	@Autowired
	private BookClubDao bookClubDao;
	
	
	//favorite 내서재
	@RequestMapping("/favorite_dao_test")
	public String favorite_dao_test() throws Exception {
		System.out.println("favorite dao test~~~");
		System.out.println(favoriteDao.insert(new Favorite(0, "yeji", 8)));
		System.out.println(favoriteDao.isExisted("yeji", 1));
		System.out.println(favoriteDao.selectById("yeji"));
		System.out.println(favoriteDao.selectByNo(3));
		System.out.println(favoriteDao.deleteByNo(5));
		System.out.println(favoriteDao.remove("yeji"));
		
		return "test/dao_test";
	}
	
	//도서동아리
	@RequestMapping("/bookClub_dao_test")
	public String bookClub_dao_test() throws Exception {
		System.out.println("bookClub dao test~~");
		//동아리생성
		BookClub bookClub=new BookClub(0, "동아리제목", 8, "동아리대상", "매주 화요일", 
										"강남역 2번출구앞", "동아리내용", 2, 
										100, "yeji");
		System.out.println(bookClubDao.create(bookClub));
		
		
		
		
		
		return "test/dao_test";
	}
}
