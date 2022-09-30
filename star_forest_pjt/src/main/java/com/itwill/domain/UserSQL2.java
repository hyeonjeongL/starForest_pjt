package com.itwill.domain;

public class UserSQL2 {

	//회원가입
	public static final String USER_INSERT = 
			"insert into user_info values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
	
	//정보수정
	public static final String USER_UPDATE = 
			"update user_info set user_password=?, user_phone=?, user_email=?, user_address=? where user_id=?";
	
	//회원탈퇴
	public static final String USER_DELETE_BY_ID = 
			"delete from user_info where user_id=?";
	
	//회원리스트
	public static final String USER_SELECT_ALL = 
			"select * from user_info";
	
	//회원검색
	public static final String USER_SELECT_BY_ID = 
			"select * from user_info where user_id=?";
	
	//전화번호 검색
	public static final String USER_SELECT_BY_PHONE = 
			"select * from user_info where user_phone=?";
	
	//이메일 검색
	public static final String USER_SELECT_BY_EMAIL = 
			"select * from user_info where user_email=?";
	
	//아이디 중복체크
	public static final String USER_COUNT_ID=
			"select count(*) cnt from user_info where user_id=?";
	//전화번호 중복체크
	public static final String USER_COUNT_PHONE=
			"select count(*) cnt from user_info where user_phone=?";
	//이메일 중복체크
	public static final String USER_COUNT_EMAIL=
			"select count(*) cnt from user_info where user_email=?";
	
	//아이디 찾기
	public static final String FIND_ID=
			"select * from user_info where user_name=? and user_phone=?";
	
	//비밀번호 찾기
	public static final String FIND_PASSWORD=
			"select * from user_info where user_id=? and user_email=?";
	
}
/*

*아이디 중복체크*
select count(*) cnt from user_info where user_id='yeji';

*이메일 중복체크*
select count(*) cnt from user_info where USER_EMAIL='so@naver.com';

*전화번호 중복체크*
select count(*) cnt from user_info where USER_PHONE='01025894567';

*아이디 찾기*
select * from user_info where USER_NAME='이정현' and USER_PHONE='01012345678';

*비밀번호 찾기*
select * from user_info where user_id='woohyuk' and USER_EMAIL='woohyuk@naver.com';
*
*/

