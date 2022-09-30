package com.itwill.controller.test;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.domain.BookCategory;
import com.itwill.domain.BookClub;
import com.itwill.domain.Favorite;
import com.itwill.domain.User;
import com.itwill.repository.BookClubDao;
import com.itwill.repository.FavoriteDao;
import com.itwill.repository.UserDao;


@Controller
public class DaoTestController {

	@Autowired
	private UserDao userDao;
	@Autowired
	private FavoriteDao favoriteDao;
	@Autowired
	private BookClubDao bookClubDao;

	// !!!!!!!!!!!!!!!예지지금 하고있는중~!~!~!!!!!!!!

	// 회원
	@RequestMapping("/user_dao_test")
	public String user_dao_test() throws Exception {
		System.out.println("user dao test~~");
		SimpleDateFormat birthFormat = new SimpleDateFormat("yyyy-MM-dd");
//		User user = new User("yeji2", "예지한", "1234", "han@gmail.com", "1995-01-30", "F", 
//							 "0102349808", "서울시 강남구", null, "대출가능",
//				4, 80, new BookCategory(100, null));
//		System.out.println(userDao.create(user));
		System.out.println(userDao.updatePassword(new User("yeji", null, "3445", null, 
															null, null, null, null, null,
															null, 0, 0, null)));
		;
		System.out.println(userDao.update(new User("soyoon", "소윤", "3333", "so@naver.com", 
													null, "F", "01023456789", "분당", null, 
													"대출가능", 3, 34, new BookCategory(300, null))));
		System.out.println(userDao.remove("hyeonjeong"));
		System.out.println(userDao.userList());
		System.out.println(userDao.findUser("yeji"));
		System.out.println(userDao.existedUser("yeji"));
		System.out.println(userDao.userRentalCount("yeji"));

		return "test/test_result";

	}

	// favorite 내서재
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

	// 도서동아리
	@RequestMapping("/bookClub_dao_test")
	public String bookClub_dao_test() throws Exception {
		System.out.println("bookClub dao test~~");
		// 동아리생성
		BookClub bookClub = new BookClub(0, "동아리제목", 8, "동아리대상", "매주 화요일", "강남역 2번출구앞", "동아리내용", 2, 100, "yeji");
		System.out.println(bookClubDao.create(bookClub));
		System.out.println(bookClubDao.selectAll());
		System.out.println(bookClubDao.selectByCategory(200));
		System.out.println(bookClubDao.selectById("yeji"));
		System.out.println(bookClubDao.selectByNo(3));

		// 동아리수정
		BookClub update = new BookClub(1, "제목수정", 9, "누구든환영", "시간수정", "장소수정", "내용수정", 2, 100, "yeji");
		System.out.println(bookClubDao.update(update));
		System.out.println(bookClubDao.clubCount(6));
		System.out.println(bookClubDao.remove(20));

		return "test/test_result";
	}

}
