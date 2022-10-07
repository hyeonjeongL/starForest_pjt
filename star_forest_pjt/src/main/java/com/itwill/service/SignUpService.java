package com.itwill.service;

import java.util.List;

import com.itwill.domain.User;

public interface SignUpService {

	//아이디 중복 체크
		public int idCheck(String userId);
		
		//회원 가입
		public void signUp(User user);
		

}