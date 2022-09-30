package com.itwill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.domain.Good;
import com.itwill.repository.GoodDao;

@Service
public class GoodServiceImpl implements GoodService{
	@Autowired
	private GoodDao goodDao;
	
	public GoodServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	
	public GoodServiceImpl(GoodDao goodDao) {
		this.goodDao=goodDao;
		}
	public void setGoodDao(GoodDao goodDao) {
		this.goodDao=goodDao;
	}

	@Override
	public List<Good> goodCategoryNo(int category_no) throws Exception {
		return goodDao.goodCategoryNo(category_no);
	}
	

}
