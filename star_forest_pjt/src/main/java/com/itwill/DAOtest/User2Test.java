package com.itwill.DAOtest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;

import com.itwill.mapper.UserMapper2;
import com.itwill.repository.UserDao2;
import com.itwill.service.UserService2;

import org.springframework.context.annotation.FilterType;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"},
includeFilters= {@Filter(type= FilterType.ASSIGNABLE_TYPE,
				classes= {UserDao2.class,UserService2.class,UserMapper2.class}
		)
})

public class User2Test {
	public static void main(String[] args) throws Exception {
		SpringApplication application = 
				new SpringApplication(User2Test.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		UserDao2 userDao2=(UserDao2)context.getBean(UserDao2.class);
		UserService2 userService2=(UserService2)context.getBean(UserService2.class);
		
		//회원가입
		
		//회원 아이디 검색_내정보
		System.out.println(userService2.selectByUserId("junghyun"));
		
		//정보수정
		
		//회원탈퇴
		
		//회원리스트_성공
		System.out.println(userService2.selectAll());
		
		//아이디중복
		System.out.println(userService2.existUserId("jjjj"));//false
		System.out.println(userService2.existUserId("admin"));//true
		
		//전화번호 중복
		System.out.println(userService2.existUserPhone("01011112222"));//false
		System.out.println(userService2.existUserPhone("01025894567"));//true
		System.out.println(userService2.existUserPhone("01012345678"));//false????? 같은값 여러개
		
		//이메일 중복
		System.out.println(userService2.existUserEmail("jjjj@naver.com"));//false
		System.out.println(userService2.existUserEmail("so@naver.com"));//true
		
		//아이디 찾기_성공 
		System.out.println(userService2.findId("이우혁", "01012345678"));

		//비밀번호 찾기_성공
		System.out.println(userService2.findPassword("soyoon", "so@naver.com"));
		
		
		//로그인 체크_성공
		/*
		 * 0: 아이디 존재하지않음
		 * 1: 로그인
		 * 2: 패스워드 불일치
		 */
		System.out.println(userService2.login("junghyun", "4444")); //1
		System.out.println(userService2.login("jung", "9999")); //0
		System.out.println(userService2.login("junghyun", "1111")); //2
}
}