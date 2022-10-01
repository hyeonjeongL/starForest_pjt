package com.itwill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.itwill.domain.User;
import com.itwill.repository.UserDao;

public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	// 회원가입

	@Override
	public int create(User user) throws Exception {

		/*
		 * 아이디중복체크
		 * 
		 * -1:아이디중복 1:회원가입성공
		 */
		if (userDao.existedUser(user.getUser_id())) {
			// 중복될 경우 -1 반환
			return -1;
		} else {
			// 회원가입성공
			int rowCount = userDao.create(user);
			return rowCount;
		}
	}

	// 로그인
	@Override
	public int login(String user_id, String user_password) throws Exception {
		/*
		 * 회원로그인
		 * 
		 * 0:아이디존재안함 -1:패쓰워드 불일치 1:로그인성공
		 */

		if (userDao.existedUser(user_id)) {
			// 아이디존재
			User user = userDao.findUser(user_id);
			if (user.getUser_password().equals(user_password)) {
				// 패스워드일치
				return 1;
			} else {
				// 패스워드불일치
				return -1;
			}
		} else {
			// 아이디존재안함
			return 0;
		}

	}

	// 비밀번호 확인 후 비밀번호변경
	@Override
	public int updatePassword(User user) throws Exception {
		if(userDao.PWcheck(user.getUser_id(), user.getUser_password())) {
			return userDao.updatePassword(user);
		}else {
			System.out.println("비밀번호를 다시 입력해주세요.");
			return 0;
		}
			
	}

	// 비밀번호 확인 후 회원정보수정
	@Override
	public int update(User user) throws Exception {
		if(userDao.PWcheck(user.getUser_id(), user.getUser_password())) {
			return userDao.update(user);
		}else {
			System.out.println("비밀번호를 다시 입력해주세요.");
			return 0;
		}
	}

	// 비밀번호 확인 후 회원탈퇴
	@Override
	public int remove(User user) throws Exception {
		if(userDao.PWcheck(user.getUser_id(), user.getUser_password())) {
			return userDao.remove(user);
		}else {
			System.out.println("비밀번호를 다시 입력해주세요.");
			return 0;
		}
	}

	// 회원전체리스트
	@Override
	public List<User> userList() throws Exception {
		return userDao.userList();
	}

	// 회원상세보기
	@Override
	public User findUser(String user_id) throws Exception {
		return userDao.findUser(user_id);
	}

	// 아이디중복체크
	@Override
	public boolean existedUser(String user_id) throws Exception {
		boolean isExist = userDao.existedUser(user_id);
		if (isExist) {
			return true;
		} else {
			return false;
		}
	}

	// 회원당 대출권수카운트
	@Override
	public int userRentalCount(String user_id) throws Exception {
		return userDao.userRentalCount(user_id);
	}

	//연체에 따른 대출정지기간
	@Override
	public int rentalStopPeriod(String user_id) throws Exception {
		try {
		int stopPeriod=userDao.rentalStopPeriod(user_id);
		/*
		 * 대출정지 : -1
		 * 대출가능 : 1
		 */
		if(stopPeriod>0) {
			System.out.println("연체로 인해 "+stopPeriod+" 일 동안 대출정지입니다.");
			return  -1;
		}else {
			return 1;
		}
		}catch (Exception e) {
			e.printStackTrace();
			return -2;
		}
	}
	

}
