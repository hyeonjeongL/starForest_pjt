package com.itwill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
	
	//회원가입
	@Override
	public int insertUser(User user) throws Exception {
		return userDao2.insertUser(user);
	}

	//회원 아이디 검색_내정보
	@Override
	public User selectByUserId(String user_id) throws Exception {
		return userDao2.selectByUserId(user_id);
	}

	//회원리스트
	@Override
	public List<User> selectAll() throws Exception {
		return userDao2.selectAll();
	}

	//정보수정
	@Override
	public int updateUser(User user) throws Exception {
		return userDao2.updateUser(user);
	}

	//회원탈퇴
	@Override
	public int deleteUser(String user_id) throws Exception {
		return userDao2.deleteUser(user_id);
	}

	
	//로그인체크
	@Override
	public int login(String user_id, String user_password) throws Exception {
		/*
		 * 0: 아이디 존재하지않음
		 * 1: 로그인
		 * 2: 패스워드 불일치
		 */
		User user=userDao2.selectByUserId(user_id);
		if(user==null) {
			return 0;
		}
		if(!user.getUser_password().equals(user_password)) {
			return 2;
			
		}
		return 1;
	}
	
	//아이디중복
	@Override
	public boolean existUserId(String user_id) throws Exception {
		boolean isExist = userDao2.existUserId(user_id);
		if (isExist) {
			return true;
		} else {
			return false;
		}
	}
	
	//전화번호 중복
	@Override
	public boolean existUserPhone(String user_phone) throws Exception {
		boolean isExist = userDao2.existUserPhone(user_phone);
		if (isExist) {
			return true;
		} else {
			return false;
		}
	}
	
	//이메일중복
	@Override
	public boolean existUserEmail(String user_email) throws Exception {
		boolean isExist = userDao2.existUserEmail(user_email);
		if (isExist) {
			return true;
		} else {
			return false;
		}
	}
	
	//아이디찾기
	@Override
	public String findId(String user_name, String user_phone) throws Exception {
		return userDao2.findId(user_name, user_phone);
	}
	
	//비밀번호찾기
	@Override
	public String findPassword(String user_id, String user_email) throws Exception {
		return userDao2.findPassword(user_id, user_email);
	}
	
	/*
	 * 회원가입
	 */
	/**************1.반환값사용***********************/
	@Override
	public int create(User user)throws Exception{
		/*
		 * -1:아이디중복
		 *  1:회원가입성공
		 */
		
		
		//1.아이디중복체크
		if(userDao2.existUserId(user.getUser_id())) {
			//아이디중복
			return -1;
		}else {
			//아이디안중복
			//2.회원가입
			//BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
			//String securePassword = encoder.encode(user.getUser_password());
			//user.setUser_password(securePassword); //암호화
			int insertRowCount=userDao2.create(user);
			return insertRowCount;
		}
	}
	/*********************************************/
	
	
	/*
	 * 아이디중복체크
	 */
	@Override
	public boolean isDuplicateId(String user_id) throws Exception{
		boolean isExist = userDao2.existUserId(user_id);
		if(isExist) {
			return true;
		}else {
			return false;
		}
	}
	

}