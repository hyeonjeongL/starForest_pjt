package com.itwill.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.ibatis.javassist.bytecode.ByteArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.itwill.controller.interceptor.LoginCheck;
import com.itwill.domain.User;
import com.itwill.service.UserService;

@RestController
public class UserInfoRestController {
	@Autowired
	private UserService userService;

	@PostMapping("/user_login_action")
	public Map user_login_action(@ModelAttribute User user, HttpServletRequest request) throws Exception {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		int result = userService.login(user.getUser_id(), user.getUser_password());
		/*
		 * 회원로그인
		 * 
		 * 0:아이디존재안함 -1:패쓰워드 불일치 1:로그인성공
		 */
		switch (result) {
		case 0:
			code = 0;
			url = "user_login_form";
			msg = "아이디 존재안함";
		case -1:
			code = -1;
			url = "user_login_form";
			msg = "패스워드 불일치";
		case 1:
			code = 1;
			url = "main";
			msg = "로그인 성공";

		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}

	@LoginCheck
	@PostMapping("/user_logout_action")
	public Map user_logout_action(HttpServletRequest request) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "user_main";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		request.getSession().invalidate();

		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}

	@LoginCheck
	@PostMapping("/user_session_check")
	public Map user_session_check(HttpSession session) throws Exception {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		String sUserId = (String) session.getAttribute("sUserId");
		User sUser = userService.findUser(sUserId);
		resultList.add(sUser);

		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}
	
	@PostMapping("/user_id_check")
	public boolean user_id_check(@RequestParam String user_id) throws Exception {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();
		
		boolean isDuplicate=userService.existedUser(user_id);
		return !isDuplicate;
		
	}
	
	@PostMapping("/user_write_action")
	public Map user_write_action(@ModelAttribute User user){
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();
		
		/*
		 * 회원가입
		 * 
		 * -1:아이디중복 
		 * 1:회원가입성공
		 */
		try {
			int result = userService.create(user);
			if(result==-1) {
				code=-1;
				url="user_write_form";
				msg=user.getUser_id()+" 는 이미 존재하는 아이디입니다.";
			}else if(result==1) {
				code=1;
				url="user_login_form";
				msg="회원가입 성공";
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
		resultMap.put("data",resultList);
		return resultMap;
	}
	
	@LoginCheck
	@PostMapping("/modify_form")
	public Map modify_form(HttpServletRequest request) throws Exception {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();
		
		String sUserId=(String)request.getSession().getAttribute("sUserId");
		User user=userService.findUser(sUserId);
		resultList.add(user);
			
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data",resultList);
		return resultMap;	
	}
	
	@LoginCheck
	@PostMapping("/pw_modify_action")
	public Map pw_modify_action(@ModelAttribute User user,HttpServletRequest request) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();
		
		try {
			int result=userService.updatePassword(user);
			if(result==1) {
				String sUserId=(String)request.getSession().getAttribute("sUserId");
				User loginUser=userService.findUser(sUserId);
				resultList.add(loginUser);
				code=1;
				url="";
				msg="비밀번호가 수정되었습니다.";
			}else {
				code=-1;
				url="modify_form";
				msg="수정실패";
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
		resultMap.put("data",resultList);
		return resultMap;	
	}
	
	@LoginCheck
	@PostMapping("/user_modify_action")
	public Map user_modify_action(@ModelAttribute User user,HttpServletRequest request) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();
		
		try {
			int result=userService.update(user);
			if(result==1) {
				String sUserId=(String)request.getSession().getAttribute("sUserId");
				User loginUser=userService.findUser(sUserId);
				resultList.add(loginUser);
				code=1;
				url="main";
				msg="수정성공";
			}else {
				code=-1;
				url="modify_form";
				msg="수정실패";
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
		resultMap.put("data",resultList);
		return resultMap;	
	}

	/*
	@LoginCheck
	@PostMapping("/user_remove_action")
	public Map user_remove_action(@ModelAttribute User user,HttpServletRequest request) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();
		
		try {
			String sUserId=(String)request.getSession().getAttribute("sUserId");			int result
			 	=userService.remove(); //이게 맞나확인하기.......
			 	패스워드체크를 ajax실행 때 해줘도 됨
			 	여기서는 이전과 같이 진행함
			 	
			if(result==1) {
				request.getSession().invalidate();
				code=1;
				url="main";
				msg="삭제성공";
			}else {
				code=-1;
				url="modify_form";
				msg="수정실패";
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
		resultMap.put("data",resultList);
		return resultMap;	
		
		
	}*/

}
