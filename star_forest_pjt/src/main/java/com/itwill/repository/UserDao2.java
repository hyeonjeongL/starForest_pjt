package com.itwill.repository;

import java.util.List;

import com.itwill.domain.User;



public interface UserDao2 {
	
	//회원가입
	int insertUser(User user) throws Exception;
	
	//회원 아이디 검색
	User selectByUserId(String user_id) throws Exception;
	
	//회원검색
	List<User> selectAll() throws Exception;
	
	//정보수정
	int updateUser(User user) throws Exception;
	
	//회원탈퇴
	int deleteUser(User user) throws Exception;
	
	
	//로그인?
	
	
	
	
	

}
