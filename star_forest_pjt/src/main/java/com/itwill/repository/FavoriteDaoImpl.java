package com.itwill.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Favorite;
import com.itwill.mapper.FavoriteMapper;

@Repository
public class FavoriteDaoImpl implements FavoriteDao {
	@Autowired
	private FavoriteMapper favoriteMapper;
	
	@Override
	public int create(Favorite favorite) throws Exception {
		return favoriteMapper.create(favorite);
	}

	@Override
	public HashMap<String, Integer> isExisted(String user_id,int favorite_no) throws Exception {
		return favoriteMapper.isExisted(user_id,favorite_no);
	}

	@Override
	public List<Favorite> selectById(String user_id) throws Exception {
		return favoriteMapper.selectById(user_id);
	}

	@Override
	public Favorite selectByNo(int favorite_no) throws Exception {
		return favoriteMapper.selectByNo(favorite_no);
	}

	@Override
	public int deleteByNo(int favorite_no) throws Exception {
		return favoriteMapper.deleteByNo(favorite_no);
	}

	@Override
	public int remove(String user_id) throws Exception {
		return favoriteMapper.remove(user_id);
	}

	

}
