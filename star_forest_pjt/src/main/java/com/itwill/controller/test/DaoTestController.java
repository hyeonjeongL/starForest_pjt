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
	
	//!!!!!!!!!!!!!!!예지지금 하고있는중~!~!~!!!!!!!!
	
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
		
		return "test/test_result";
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
		System.out.println(bookClubDao.selectAll());
		System.out.println(bookClubDao.selectByCategory(200));
		System.out.println(bookClubDao.selectById("yeji"));
		System.out.println(bookClubDao.selectByNo(3));
		
		//동아리수정
		BookClub update=new BookClub(1, "제목수정", 9, "누구든환영", 
									"시간수정","장소수정", "내용수정", 2, 
									100, "yeji");
		System.out.println(bookClubDao.update(update));
		System.out.println(bookClubDao.clubCount(6));
		System.out.println(bookClubDao.remove(20));
		
		return "test/test_result";
	}
}
