package com.itwill.repository;

import java.util.List;


import com.itwill.domain.User;



public interface SignUpDAO {
	

	
	
	//아이디 체크
	public int idCheck(String userId);
	
	
	//회원가입
	public void signUp(User user);
	

}
