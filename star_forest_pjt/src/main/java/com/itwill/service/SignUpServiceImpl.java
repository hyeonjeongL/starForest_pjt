package com.itwill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.domain.User;
import com.itwill.repository.SignUpDAO;

@Service
public class SignUpServiceImpl implements SignUpService{

	@Autowired
	SignUpDAO dao;
	
	@Override
	public int idCheck(String userId) {
		
		int result = dao.idCheck(userId);
		return result;
	}

	@Override
	public void signUp(User user) {
		dao.signUp(user);
	}

}