package com.itwill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwill.service.UserService3;

@Controller
public class UserInfoController2 {
	
	
	@Autowired
	private UserService3 userService3;

/*
@Autowired
private PasswordEncoder passwdEncoder;
 */

@RequestMapping(value="/insertCustomer2",method=RequestMethod.GET)
public String user_insertCustomer() {
	return "insertCustomer2";
}





/*
//회원가입
	@PostMapping(value ="/user_write_action_post" ,produces = "application/json;charset=UTF-8")
	public Map user_write_action_post(@ModelAttribute User user,Model model,HttpServletRequest request) throws Exception{
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		*
		 * 회원가입
		 * 
		 * -1:아이디중복 1:회원가입성공
		 *
		try {
			int result = userService2.insertUser(user);
			if (result == -1) {
				code = -1;
				url = "insertCustomer2";
				msg = user.getUser_id() + " 는 이미 존재하는 아이디입니다.";
			} else if (result == 1) {
				code = 1;
				url = "user";
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
*/
}
