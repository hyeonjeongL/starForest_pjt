package com.itwill.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.domain.User;
import com.itwill.service.UserService2;

@RestController
public class UserInfoRestController2 {
	@Autowired
	private UserService2 userService2;

	//아이디 중복체크
	@PostMapping(value = "/user_id_check_rest",produces = "text/plain;charset=UTF-8")
	public boolean user_id_check(@RequestParam String user_id) throws Exception{
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		boolean isDuplicate = userService2.existUserId(user_id);
		return !isDuplicate; // 중복되지않으면 아이디사용가능
	}
	//이메일 중복체크
	@PostMapping(value = "/user_email_check",produces = "text/plain;charset=UTF-8")
	public boolean user_email_check(@RequestParam String user_email) throws Exception{
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		boolean isDuplicate = userService2.existUserEmail(user_email);
		return !isDuplicate; // 중복되지않으면 이메일 사용가능
	}
	//전화번호 중복체크
	@PostMapping(value = "/user_phone_check",produces = "text/plain;charset=UTF-8")
	public boolean user_phone_check(@RequestParam String user_phone) throws Exception{
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		boolean isDuplicate = userService2.existUserPhone(user_phone);
		return !isDuplicate; // 중복되지않으면 이메일 사용가능
	}
	
	//회원가입
	@PostMapping(value ="/user_write_action_post" ,produces = "application/json;charset=UTF-8")
	public Map user_write_action_post(@ModelAttribute User user,Model model,HttpServletRequest request) throws Exception{
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		/*
		 * 회원가입
		 * 
		 * -1:아이디중복 1:회원가입성공
		 */
		try {
			int result = userService2.insertUser(user);
			if (result == -1) {
				code = -1;
				url = "user_write_form";
				msg = user.getUser_id() + " 는 이미 존재하는 아이디입니다.";
			} else if (result == 1) {
				code = 1;
				url = "user_login_form";
				msg = "회원가입 성공";
			}

		} catch (Exception e) {
			e.printStackTrace();
			code = 2;
			url = "main";
			msg = "잘못된 접근입니다.";
		}

		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}
	

}
