package com.itwill.controller;

import java.io.FileOutputStream;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itwill.service.UserSha256;
import com.itwill.controller.interceptor.LoginCheck;
import com.itwill.domain.User;
import com.itwill.repository.UserDao;
import com.itwill.service.UserService2;

@Controller
public class UserInfoController2 {
	
	@Autowired
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao= userDao;
	}
	
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
/*
//회원가입FORM
@RequestMapping(value="/insertCustomer", method=RequestMethod.GET)
public void insertCustomer() {
   
}

//회원가입 ok

@RequestMapping(value="/insertCustomer.do", method=RequestMethod.POST)
public ModelAndView insertCustomerOk(User u, HttpServletRequest request, MultipartFile uploadFile, HttpSession session) {
   ModelAndView mav = new ModelAndView("redirect:/insertCustomerSuccess.do");
   
   // 파일 업로드
   
   //비밀번호 암호화:SHA-256
   System.out.println("원래암호: " + u.getUser_password());
   String encPW = UserSha256.encrypt(u.getUser_password());
  u.setUser_password(encPW);
   System.out.println("바뀐암호: " + u.getUser_password());
   
   //주소addr1
  // String addr1 = request.getParameter("addr1_a") + "," + request.getParameter("addr1_b");
  // u.setAddr(addr1);
   
   //주소addr2
  // String addr2 = request.getParameter("addr2_a") + "," + request.getParameter("addr2_b");
  // u.setAddr2(addr2);
   
   
   //생일(있었는데요... 없었습니다)
   u.setUser_birth(String.valueOf("2020-01-01"));
   
   //매니저
 // u.setManager("N");
   
   //장르선택
   String[] values = request.getParameterValues("category_no");
 		String category_no = "";
 	
 		for (int i = 0; i < values.length; i++) {
 			if (i == values.length-1) {
 				category_no += values[i];
 			} else {
 				category_no += (values[i] + ",");
 			}
 		}
 	 
 		//u.setCategory_no(category_no);
   
   //int re = userDao.create(u);
   
  // session.setAttribute("email", c.getEmail());
   
   
   //마이라이브러리 생성 
   My_libraryVO ml = new My_libraryVO();
   ml.setMl_no(c.getCust_no());
   ml.setCust_no(c.getCust_no());
   dao.insertMy_Library(ml);

 		
   if(re<0) {
 	 mav.addObject("msg", "회원가입이 정상적으로 처리되지 않았습니다.");
      mav.setViewName("/error");
   }
   
   return mav;
 		 
}
*/

}
