package com.itwill.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.User;


@Repository
public class SignUpDAOImpl implements SignUpDAO{
	

	@Autowired
	SqlSession sqlSession;
	
	//아이디 체크
	public int idCheck(String userId) {
		//System.out.println("===> Mybatis로 idCheck");
		int result = sqlSession.selectOne("UserMapper2.idCheck",userId);
		return result;
	}
	
	//회원가입
	public void signUp(User user) {
		//System.out.println("===> Mybatis로 회원가입(signUp)");
		sqlSession.insert("UserMapper2.signUp",user);
	}
	

}
