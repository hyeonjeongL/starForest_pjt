package com.itwill.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.BookClub;
import com.itwill.mapper.BookClubMapper;
import com.itwill.mapper.UserMapper;

@Repository
public class BookClubDaoImpl implements BookClubDao {
	@Autowired
	private BookClubMapper bookClubMapper;
	//private static final String NAMESPACE="com.itwill.mapper.BookClubMapper.";
	
//	@Override
//	public int create(BookClub bookClub) throws Exception {
//		return sqlSession.insert(NAMESPACE+"create",bookClub);
//	}
//
//	@Override
//	public List<BookClub> selectAll() throws Exception {
//		return sqlSession.selectList(NAMESPACE+"selectAll");
//	}
//
//	@Override
//	public List<BookClub> selectByCategory(BookClub bookCategory) throws Exception {
//		return sqlSession.selectList(NAMESPACE+"selectByCategory",bookCategory);
//	}
//
//	@Override
//	public List<BookClub> selectById(String user_id) throws Exception {
//		return sqlSession.selectList(NAMESPACE+"selectById",user_id);
//	}
//	
//	@Override
//	public BookClub selectByNo(int club_no) throws Exception {
//		return sqlSession.selectOne(NAMESPACE+"selectByNo",club_no);
//	}

	@Override
	public int update(BookClub bookClub) throws Exception {
		return bookClubMapper.update(bookClub);
		//return sqlSession.update(NAMESPACE+"update",bookClub);
	}

	@Override
	public int create(BookClub bookClub) throws Exception {
		return bookClubMapper.create(bookClub);
	}

	@Override
	public List<BookClub> selectAll() throws Exception {
		return bookClubMapper.selectAll();
	}

	@Override
	public List<BookClub> selectByCategory(BookClub bookCategory) throws Exception {
		return bookClubMapper.selectBycategory(bookCategory);
	}

	@Override
	public List<BookClub> selectById(String user_id) throws Exception {
		return bookClubMapper.selectById(user_id);
	}

	@Override
	public BookClub selectByNo(int club_no) throws Exception {
		return bookClubMapper.selectByNo(club_no);
	}

	@Override
	public int clubCount(int club_no) throws Exception {
		return bookClubMapper.clubCount(club_no);
	}

	@Override
	public int remove(int club_no) throws Exception {
		return bookClubMapper.remove(club_no);
	}

//	@Override
//	public int clubCount(int club_no) throws Exception {
//		return sqlSession.update(NAMESPACE+"clubCount",club_no);
//	}
//
//	@Override
//	public int remove(int club_no) throws Exception {
//		return sqlSession.delete(NAMESPACE+"remove",club_no);
//	}
//
//	

	
	
}
