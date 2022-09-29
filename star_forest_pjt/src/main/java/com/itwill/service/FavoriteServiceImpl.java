package com.itwill.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.domain.Favorite;
import com.itwill.repository.FavoriteDao;

@Service
public class FavoriteServiceImpl implements FavoriteService {
	@Autowired
	private FavoriteDao favoriteDao;
	
	//즐겨찾기추가
	@Override
	public int insert(Favorite favorite) throws Exception {
		
		if(favoriteDao.isExisted(favorite.getUser_id(), favorite.getBook_no())) {
			System.out.println("이미 내 서재에 존재합니다.");
			return 0;
		}else {
			return favoriteDao.insert(favorite);
		}
		
	}

	//회원의 즐겨찾기 목록보기
	@Override
	public List<Favorite> selectById(String user_id) throws Exception {
		return favoriteDao.selectById(user_id);
	}

	//즐겨찾기 상세보기
	@Override
	public Favorite selectByNo(int favorite_no) throws Exception {
		return favoriteDao.selectByNo(favorite_no);
	}

	//즐겨찾기 일부삭제
	@Override
	public int deleteByNo(int favorite_no) throws Exception {
		return favoriteDao.deleteByNo(favorite_no);
	}

	//즐겨찾기 전체삭제
	@Override
	public int remove(String user_id) throws Exception {
		return favoriteDao.remove(user_id);
	}

	
}
