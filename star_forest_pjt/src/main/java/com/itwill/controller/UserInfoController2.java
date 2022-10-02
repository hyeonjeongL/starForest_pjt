package com.itwill.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.controller.interceptor.LoginCheck;
import com.itwill.domain.User;
import com.itwill.service.UserService2;

@Controller
public class UserInfoController2 {
@Autowired
private UserService2 userService2;

@GetMapping(value ="/account-login")
public String user_login_form() {
	return "account-login";
}
//로그인
@PostMapping(value = "/account-login")
public String user_login_action_post(@ModelAttribute User user,HttpSession session,Model model) throws Exception{
	String forwardPath="";
	int result = userService2.login(user.getUser_id(), user.getUser_password());
	if(result==0) {
		//아이디존재안함
		model.addAttribute("msg1", user.getUser_id()+" 는 존재하지않는 아이디입니다.");
		model.addAttribute("fuser", user);
		forwardPath="account-login";
	}else if(result==1) {
		//패쓰워드 불일치
		model.addAttribute("msg2", "패쓰워드가 일치하지 않습니다");
		model.addAttribute("fuser", user);
		forwardPath="account-login";
	}else if(result==2) {
		//로그인성공
		session.setAttribute("sUserId", user.getUser_id());
		forwardPath="redirect:index";
	}
	return forwardPath;
}
//로그아웃
@LoginCheck
@RequestMapping(value = "/account-logout")
public String user_logout_action(HttpSession session) {
	session.invalidate();
	return "redirect:index";
}

//회원정보
@RequestMapping(value = "/account-profile")
public String user_view_myinfo(HttpSession session,Model model) throws Exception {
	String sUserId=(String)session.getAttribute("sUserId");
	User loginUser=userService2.selectByUserId(sUserId);
	/*
	List<User> productList=productService.getProductList();
	List<CartItem> cartItemList = cartService.getCartList(sUserId);
	int cartTotPrice=0;
	for (CartItem cartItem : cartItemList) {
		cartTotPrice+=cartItem.getProduct().getP_price()*cartItem.getCart_qty();
	}
	List<Order> orderList=orderService.list(sUserId);
	model.addAttribute("loginUser", loginUser);
	model.addAttribute("cartItemList", cartItemList);
	model.addAttribute("cartTotPrice", cartTotPrice);
	model.addAttribute("productList", productList);
	model.addAttribute("orderList", orderList);
	*/
	return "account-profile";
}


}
