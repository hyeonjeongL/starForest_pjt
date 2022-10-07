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
	//로그인
	@PostMapping(value = "/account-login-rest",produces = "application/json;charset=UTF-8")
	public Map user_login_action_post(@RequestParam String user_id,@RequestParam String user_password,Model model,HttpSession session) throws Exception{
		User user=new User(user_id, user_password);
		int result = userService2.login(user.getUser_id(), user.getUser_password());
		/*
		 * 0: 아이디 존재하지않음
		 * 1: 로그인
		 * 2: 패스워드 불일치
		 */
		if(result==1) {
			//로그인성공
			session.setAttribute("sUserId", user.getUser_id());
		}
		
		HashMap map=new HashMap();
		map.put("result", result);
		map.put("user", user);
		return map;
	}
	//아이디 중복체크
	@RequestMapping(value = "/user_id_duplicate_check_rest",produces = "text/plain;charset=UTF-8")
	public String user_id_check(@RequestParam String user_id) throws Exception{
		boolean isDuplicate= userService2.existUserId(user_id);
		System.out.println(!isDuplicate+"-->"+user_id);
		return !isDuplicate+"";
	}
	//이메일 중복체크
	@RequestMapping(value = "/user_email_check",produces = "text/plain;charset=UTF-8")
	public String user_email_check(@RequestParam String user_email) throws Exception{
		boolean isDuplicate= userService2.existUserEmail(user_email);
		System.out.println(!isDuplicate+"-->"+user_email);
		return !isDuplicate+"";
	}
	//전화번호 중복체크
	@RequestMapping(value = "/user_phone_check",produces = "text/plain;charset=UTF-8")
	public String user_phone_check(@RequestParam String user_phone) throws Exception{
		boolean isDuplicate= userService2.existUserPhone(user_phone);
		System.out.println(!isDuplicate+"-->"+user_phone);
		return !isDuplicate+"";
	}
	
	//회원가입
	@PostMapping(value ="/user_write_action_post" ,produces = "application/json;charset=UTF-8")
	public Map user_write_action_post(@ModelAttribute User user,Model model,HttpServletRequest request) throws Exception{
		
		int result = userService2.insertUser(user);
		System.out.println("Controller-->"+result);
		
		String userImagePath=request.getServletContext().getRealPath("img/account/");
		File userImageFileDir = new File(userImagePath);
		String[] userImageFileNameList = userImageFileDir.list();
		boolean isExist=false;
		for (String userImageFileName : userImageFileNameList) {
			if(userImageFileName.equals(user.getUser_id()+".png")) {
				isExist=true;
				break;
			}
		}
		if(!isExist) {
			File noNameImageFile=new File(userImagePath+"/noimage.png");
			File userAvaImageFile=new File(userImagePath+"/"+user.getUser_id()+".png");
			// 파일복사
			Files.copy(noNameImageFile.toPath(), userAvaImageFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
		}
		
		HashMap map=new HashMap();
		map.put("result", result);
		map.put("user", user);
		if(result>0) {
			map.put("msg", user.getUser_id()+ "님 가입이 완료되었습니다.");
		}else {
			map.put("msg", user.getUser_id()+ "는 이미 존재하는 아이디입니다.");
		}
		return map;
	}
	
	@GetMapping(value="/user_write_action_json")
	public Map user_write_action_json(@ModelAttribute User user,Model model) 
			throws Exception{
		Map resultMap=new HashMap();
		int code=1;
		String url="user_main";
		String msg="세션존재함";
		List<User> resultList=new ArrayList<User>();
		/*
		 *  0:아이디중복
		 *  1:회원가입성공
		 */
		int result=userService2.create(user);
		if(result==-1) {
			code=2;
			url="user_write_form";
			msg= user.getUser_id()+" 는 이미 존재하는 아이디 입니다.";
			
		}else if(result==1) {
			code=1;
			url="user_login_form";
			msg= "회원가입성공";
		}
		
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data",resultList);
		return resultMap;
	}
}
