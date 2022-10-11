package com.itwill.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwill.domain.Search;
import com.itwill.service.SearchService;
import com.itwill.util.PageMakeDTO;
import com.itwill.util.PageUtil;
//검색기능
@Controller
public class SearchRestController {
	@Autowired
	private SearchService searchService;
	
	public SearchRestController(){
		
	}
	
	// 1. 상품 전체 목록
    @RequestMapping("/list.do")
    public ModelAndView list(ModelAndView mav) {
        mav.setViewName("/SearchList");
        mav.addObject("list", searchService.listBook());
        return mav;
    }
	
	
	
}
