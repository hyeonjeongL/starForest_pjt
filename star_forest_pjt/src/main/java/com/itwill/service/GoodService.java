package com.itwill.service;

import java.util.List;

import com.itwill.domain.Good;

public interface GoodService {
	//분야 번호 추천
	List<Good> goodCategoryNo(int category_no) throws Exception;

}
