package com.itwill.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.controller.interceptor.LoginCheck;
import com.itwill.domain.BookClub;
import com.itwill.service.BookClubService;

@RestController
public class BookClubRestController {
	@Autowired
	private BookClubService bookClubService;

	// 동아리 생성
	@LoginCheck
	@PostMapping("/club_create")
	public Map club_create(@ModelAttribute BookClub bookClub, HttpServletRequest request) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<BookClub> resultList = new ArrayList<BookClub>();

		try {
			String sUserId = (String) request.getSession().getAttribute("sUserId");
			if (sUserId == "admin") {
				int result = bookClubService.create(bookClub);
				if (result == 1) {
					code = 1;
					url = "club_list";
					msg = "동아리가 개설되었습니다.";
				} else {
					code = 2;
					url = "main";
					msg = "잘못된 접근입니다.";
				}
			} else {
				code = -1;
				url = "main";
				msg = "관리자권한입니다.";
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

	// 카테고리별 동아리 조회
	@LoginCheck
	@PostMapping("/club_select_by_category")
	public Map club_select_by_category(@RequestParam int category_no) throws Exception {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<BookClub> resultList = new ArrayList<BookClub>();

		resultList = bookClubService.selectByCategory(category_no);
		code = 1;
		url = "";
		msg = "조회성공";

		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;

	}

	// 동아리 상세보기
	@LoginCheck
	@PostMapping("/club_detail")
	public Map club_detail(@RequestParam int club_no) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<BookClub> resultList = new ArrayList<BookClub>();

		try {
			int updateCount = bookClubService.addReadCount(club_no);
			if (updateCount == 1) {
				BookClub bookClub = bookClubService.selectByNo(club_no);
				code = 1;
				url = "";
				msg = "성공";
				resultList.add(bookClub);
			} else {
				code = 2;
				url = "club_list";
				msg = "잘못된 접근입니다.";
			}
		} catch (Exception e) {
			e.printStackTrace();
			code = 2;
			url = "club_list";
			msg = "잘못된 접근입니다.";
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);

		return resultMap;
	}

	// 동아리 수정폼
	@LoginCheck
	@PostMapping("/club_update_form")
	public Map club_update_form(@RequestParam int club_no) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<BookClub> resultList = new ArrayList<BookClub>();

		try {
			BookClub bookClub = bookClubService.selectByNo(club_no);
			code = 1;
			url = "";
			msg = "성공";
			resultList.add(bookClub);
		} catch (Exception e) {
			e.printStackTrace();
			code = 2;
			url = "club_list";
			msg = "잘못된 접근입니다.";
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}

	// 동아리 수정
	@LoginCheck
	@PostMapping("/club_update")
	public Map club_update(@ModelAttribute BookClub bookClub) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<BookClub> resultList = new ArrayList<BookClub>();

		try {
			int result = bookClubService.update(bookClub);
			if (result == 1) {
				code = 1;
				url = "";
				msg = "동아리 내용을 수정하였습니다.";
				resultList.add(bookClubService.selectByNo(bookClub.getClub_no()));
			} else {
				code = -1;
				url = "club_list";
				msg = "동아리 내용이 수정되지 않았습니다.";
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

	// 동아리 삭제
	@LoginCheck
	@PostMapping("/club_remove")
	public Map club_remove(@RequestParam Integer club_no) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<BookClub> resultList = new ArrayList<BookClub>();

		if (club_no == null) {
			code = 2;
			url = "club_list";
			msg = "잘못된 접근입니다.";
		}
		try {
			int result = bookClubService.remove(club_no);
			if (result == 1) {
				code = 1;
				url = "club_list";
				msg = "동아리가 삭제되었습니다.";
			} else {
				code = -1;
				url = "";
				msg = "동아리가 삭제되지 않았습니다.";
			}

		} catch (Exception e) {
			e.printStackTrace();
			code = 2;
			url = "club_list";
			msg = "잘못된 접근입니다.";
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;

	}

	// 신청한 동아리인지 중복체크

	@LoginCheck
	@PostMapping("/club_duplicate")
	public Map club_duplicate(@RequestParam int club_no, HttpServletRequest request) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<BookClub> resultList = new ArrayList<BookClub>();

		try {
			String sUserId = (String) request.getSession().getAttribute("sUserId");
			int result = bookClubService.isDuplicate(sUserId, club_no);
			if (result == 0) {
				code = 1;
				url = "";
				msg = "동아리 신청이 완료되었습니다.";
			} else {
				code = -1;
				url = "club_list";
				msg = "이미 신청한 동아리입니다.";
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

	// 동아리 가입(인원수 카운트)
	/* 중복체크 진행 후 가입되면서 카운트 0이면 정원초과 */
	@LoginCheck
	@PostMapping("/club_join")
	public Map club_join(@RequestParam int club_no, HttpServletRequest request) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<BookClub> resultList = new ArrayList<BookClub>();

		try {
			String sUserId = (String) request.getSession().getAttribute("sUserId");
			// 동아리 가입여부 중복체크
			int duplicateCount = bookClubService.isDuplicate(sUserId, club_no);
			if (duplicateCount == 1) {
				code = -2;
				url = "";
				msg = "이미 가입된 동아리입니다.";
			} else {
				// 정원가능 시 가입성공
				int joinCount = bookClubService.clubJoin(sUserId, club_no);
				if (joinCount == 0) {
					code = -1;
					url = "";
					msg = "정원 초과로 신청할 수 없습니다.";
				} else {
					code = 1;
					url = "";
					msg = "가입성공";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			code = 2;
			url = "main";
			msg = "로그인 후 이용해주세요.";
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}

	// 동아리리스트
	
	@GetMapping("/club_list")
	public Map club_list() throws Exception {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<BookClub> resultList = new ArrayList<BookClub>();

		resultList = bookClubService.selectAll();
		code = 1;
		url = "";
		msg = "조회성공";

		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}

	// 내가 신청한 동아리내역(마이페이지)
	
	@GetMapping("/club_user_list")
	public Map club_user_list(HttpServletRequest request) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<BookClub> resultList = new ArrayList<BookClub>();

		try {
			String sUserId = (String) request.getSession().getAttribute("sUserId");
			resultList = bookClubService.selectById(sUserId);
			code = 1;
			url = "";
			msg = "성공";

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
