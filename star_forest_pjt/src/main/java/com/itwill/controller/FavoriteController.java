package com.itwill.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.controller.interceptor.LoginCheck;
import com.itwill.domain.Favorite;
import com.itwill.service.FavoriteService;

@Controller
public class FavoriteController {
	@Autowired
	private FavoriteService favoriteService;
	
	//즐겨찾기목록
//	@LoginCheck
//	@PostMapping("/favorite_list")
//	public String favorite_list(HttpServletRequest request,Model model) throws Exception {
//		String sUserId=(String)request.getSession().getAttribute("sUserId");
//		List<Favorite> favoriteList=favoriteService.selectById(sUserId);
//		model.addAttribute("favoriteList", favoriteList);
//		return "favoriteList";
//	}
	
	
}
