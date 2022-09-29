package com.itwill.service;

import java.util.List;

import com.itwill.domain.User;

public interface UserService2 {


	//회원가입
	int insertUser(User user) throws Exception;
	
	//회원 아이디 검색
	User selectByUserId(String user_id) throws Exception;
	
	//회원검색
	List<User> selectAll() throws Exception;
	
	//정보수정
	int updateUser(User user) throws Exception;
	
	//회원탈퇴
	int deleteUser(String user_id) throws Exception;
	
	
	
	//아이디중복?
	int create(User user)throws Exception;
	
	//로그인체크
	int login(String user_Id, String user_password)throws Exception;
}
