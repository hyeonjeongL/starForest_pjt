package com.itwill.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.domain.User;


@Mapper
public interface UserMapper2 {
	
	//회원가입
	@Insert("insert into user_info values(?,?,?,?,?,?,?,?,?,?,?,?,?)")
	public int insertUser(User user);
	
	//회원 아이디 검색_내정보
	@Select("select * from user_info where user_id=?")
	public User selectByUserId(String user_id);
	
	//회원리스트
	@Select("select * from user_info")
	public List<User> selectAll();
	
	//정보수정
	@Update("update user_info set user_password=?, user_phone=?, user_email=?, user_address=? where user_id=?")
	public int updateUser(User user);
	
	//회원탈퇴
	@Delete("delete from user_info where user_id=?")
	public int deleteUser(String user_id);
	
	//로그인체크
	@Select("select * from user_info where user_id=?")
	public int login(String user_Id, String user_password);
	
	//아이디중복
	@Select("select count(*) cnt from user_info where user_id=?")
	public boolean existUserId(String user_Id);
	
	//전화번호 중복
	@Select("select count(*) cnt from user_info where user_phone=?")
	
	public boolean existUserPhone(String user_phone);
	//이메일중복
	@Select("select count(*) cnt from user_info where user_email=?")
	public boolean existUserEmail(String user_email);
	
	//아이디찾기
	@Select("select * from user_info where user_name=? and user_phone=?")
	public String findId(String user_name, String user_phone);
	
	//비밀번호찾기
	@Select("select * from user_info where user_id=? and user_email=?")
	public String findPassword(String user_Id, String user_email);
	
	public int create(User user);
	
	public int existedUser(String user_Id);
	
}