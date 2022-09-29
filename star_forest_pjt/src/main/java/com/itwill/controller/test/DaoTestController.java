package com.itwill.controller.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.itwill.domain.Favorite;
import com.itwill.repository.FavoriteDao;

@Controller
public class DaoTestController {

	@Autowired
	private FavoriteDao favoriteDao;
	
	//favorite 내서재
	public String favorite_dao_test() throws Exception {
		System.out.println("favorite dao test~~~");
		System.out.println(favoriteDao.insert(new Favorite(0, "yeji", 8)));
		
		
		return "test/test_result";
	}
}
