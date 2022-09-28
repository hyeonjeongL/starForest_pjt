package com.itwill.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.itwill.domain.BookClub;


public interface BookClubDao {

	//동아리생성
	int create(BookClub bookClub) throws Exception;	
	 
	//동아리 전체리스트
	List<BookClub> selectAll() throws Exception;
	
	//카테고리별 동아리조회
	List<BookClub> selectByCategory(BookClub bookCategory) throws Exception;
	
	//회원이 가입한 동아리조회
	List<BookClub> selectById(String user_id) throws Exception;
	
	//동아리수정
	int update(int club_no) throws Exception;
	
	//동아리 인원수 카운트
	int clubCount(int club_no) throws Exception;
	
	//동아리삭제
	int remove(int club_no) throws Exception;
}
