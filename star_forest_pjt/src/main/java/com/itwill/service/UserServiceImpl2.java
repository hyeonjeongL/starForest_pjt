package com.itwill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.domain.User;
import com.itwill.repository.UserDao2;
@Service
public class UserServiceImpl2 implements UserService2{
	@Autowired
	private UserDao2 userDao2;
	
	public UserServiceImpl2() {
		
	}
	public UserServiceImpl2(UserDao2 userDao2) {
		this.userDao2=userDao2;
	}
	public void setUserDao2(UserDao2 userDao2) {
		this.userDao2=userDao2;
	}
	
	
	@Override
	public int insertUser(User user) throws Exception {
		return userDao2.insertUser(user);
	}

	@Override
	public User selectByUserId(String user_id) throws Exception {
		return userDao2.selectByUserId(user_id);
	}

	@Override
	public List<User> selectAll() throws Exception {
		return userDao2.selectAll();
	}

	@Override
	public int updateUser(User user) throws Exception {
		return userDao2.updateUser(user);
	}

	@Override
	public int deleteUser(String user_id) throws Exception {
		return userDao2.deleteUser(user_id);
	}

	
	@Override
	public int create(User user) throws Exception {
		/*
		 * 0: 오류
		 * 1: 생성
		 * 2: 아이디중복
		 */
		if(!(userDao2.existUserId(user.getUser_id())==null)) {
			return 2;
		}
		return userDao2.insertUser(user);
	}
	@Override
	public int login(String user_Id, String user_password) throws Exception {
		/*
		 * 0: 아이디 존재하지않음
		 * 1: 로그인
		 * 2: 패스워드 불일치
		 */
		User user=userDao2.selectByUserId(user_Id);
		if(user==null) {
			return 0;
		}
		if(!user.getUser_password().equals(user_password)) {
			return 2;
			
		}
		return 1;
	}

}
