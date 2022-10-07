package com.itwill.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.User;
import com.itwill.domain.UserSQL2;


@Repository
public class UserDaoImpl2 implements UserDao2{
	@Autowired
	private DataSource dataSource;
	
	public UserDaoImpl2(){
		
	}
	public UserDaoImpl2(DataSource dataSource){
		this.dataSource = dataSource;
	}
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	/*
	 * 사용자관리테이블에 새로운사용자생성
	 */
	@Override
	public int create(User user) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int insertRowCount = 0;
		try {
			/*
			 * 예외발생 예상코드
			 */
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserSQL2.USER_INSERT);
			pstmt.setString(1,user.getUser_id());
			pstmt.setString(2,user.getUser_name());
			pstmt.setString(3,user.getUser_password());
			pstmt.setString(4,user.getUser_email());
			pstmt.setString(5,user.getUser_birth());
			pstmt.setString(6,user.getUser_gender());
			pstmt.setString(7,user.getUser_phone());
			pstmt.setString(8,user.getUser_address());
			pstmt.setInt(9,user.getCategory_no());
			insertRowCount = pstmt.executeUpdate();
		} finally {
			/*
			 * 예외발생과 관계없이 반듯시 실행되는 코드
			 */
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return insertRowCount;
	}
	
	//회원가입
	@Override
	public int insertUser(User user) throws Exception {
		Connection con=dataSource.getConnection();
		PreparedStatement pstmt=con.prepareStatement(UserSQL2.USER_INSERT);
		pstmt.setString(1,user.getUser_id());
		pstmt.setString(2,user.getUser_name());
		pstmt.setString(3,user.getUser_password());
		pstmt.setString(4,user.getUser_email());
		pstmt.setString(5,user.getUser_birth());
		pstmt.setString(6,user.getUser_gender());
		pstmt.setString(7,user.getUser_phone());
		pstmt.setString(8,user.getUser_address());
		pstmt.setInt(9,user.getCategory_no());
		int insertRowCount=pstmt.executeUpdate();
		con.close();
		return insertRowCount;
	}
	
	//회원 아이디 검색_내정보
	@Override
	public User selectByUserId(String user_id) throws Exception {
		User user=null;
		Connection con = 
				dataSource.getConnection();
		PreparedStatement pstmt=
				con.prepareStatement(UserSQL2.USER_SELECT_BY_ID);
		pstmt.setString(1, user_id);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()) {
			user=new User(rs.getString("user_id"),
					rs.getString("user_name"),
					rs.getString("user_password"),
					rs.getString("user_email"),
					rs.getString("user_birth"),
					rs.getString("user_gender"),
					rs.getString("user_phone"),
					rs.getString("user_address"),
					rs.getString("user_qr"),
					rs.getString("user_rental_status"),
					rs.getInt("user_book_cnt_limit"),
					rs.getInt("user_book_weight"),
					rs.getInt("category_no")
					);
			
					
		}
		rs.close();
		pstmt.close();
		con.close();
		return user ;
	}
	
	//회원리스트
	@Override
	public List<User> selectAll() throws Exception {
		ArrayList<User> userList=new ArrayList<User>();
		Connection con = 
				dataSource.getConnection();
		PreparedStatement pstmt=
				con.prepareStatement(UserSQL2.USER_SELECT_ALL);
		ResultSet rs=pstmt.executeQuery();
		while (rs.next()) {
			userList.add(new User(rs.getString("user_id"),
					rs.getString("user_name"),
					rs.getString("user_password"),
					rs.getString("user_email"),
					rs.getString("user_birth"),
					rs.getString("user_gender"),
					rs.getString("user_phone"),
					rs.getString("user_address"),
					rs.getString("user_qr"),
					rs.getString("user_rental_status"),
					rs.getInt("user_book_cnt_limit"),
					rs.getInt("user_book_weight"),
					rs.getInt("category_no")
					));
			
		}
		rs.close();
		pstmt.close();
		con.close();
		return userList;
	}
	
	//회원수정
	@Override
	public int updateUser(User user) throws Exception {
		Connection con=dataSource.getConnection();
		PreparedStatement pstmt=con.prepareStatement(UserSQL2.USER_UPDATE);
		pstmt.setString(1,user.getUser_id());
		pstmt.setString(2,user.getUser_name());
		pstmt.setString(3,user.getUser_password());
		pstmt.setString(4,user.getUser_email());
		pstmt.setString(5,user.getUser_birth());
		pstmt.setString(6,user.getUser_gender());
		pstmt.setString(7,user.getUser_phone());
		pstmt.setString(8,user.getUser_address());
		pstmt.setInt(9,user.getCategory_no());
		int updateRowCount=pstmt.executeUpdate();
		con.close();
		return updateRowCount;
	}
	
	//회원탈퇴
	@Override
	public int deleteUser(String user_id) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(UserSQL2.USER_DELETE_BY_ID);
		pstmt.setString(1, user_id);
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		return rowCount;
	}
	
	//아이디중복
	@Override
	public boolean existUserId(String user_id)throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(UserSQL2.USER_COUNT_ID);
		pstmt.setString(1, user_id);
		ResultSet rs = pstmt.executeQuery();
		boolean isExist = false;
		rs.next();
		int count = rs.getInt("cnt");
		if(count == 1) {
			isExist = true;
		}
		rs.close();
		pstmt.close();
		con.close();
		return isExist;
	
	}
	//전화번호 중복
	@Override
	public boolean existUserPhone(String user_phone) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(UserSQL2.USER_COUNT_PHONE);
				pstmt.setString(1, user_phone);
		ResultSet rs = pstmt.executeQuery();
		boolean isExist = false;
		rs.next();
		int count = rs.getInt("cnt");
		if(count == 1) {
			isExist = true;
		}
		rs.close();
		pstmt.close();
		con.close();
		return isExist;
		
	}
	//이메일 중복
	@Override
	public boolean existUserEmail(String user_email) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(UserSQL2.USER_COUNT_EMAIL);
		pstmt.setString(1, user_email);
		ResultSet rs = pstmt.executeQuery();
		boolean isExist = false;
		rs.next();
		int count = rs.getInt("cnt");
		if(count == 1) {
			isExist = true;
		}
		rs.close();
		pstmt.close();
		con.close();
		return isExist;
		
	}
	//아이디찾기
	@Override
	public String findId(String user_name, String user_phone) throws Exception {
		String mid = null;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(UserSQL2.FIND_ID);
		User findId = null;
		pstmt.setString(1, user_name);
		pstmt.setString(2, user_phone);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			mid = rs.getString("user_Id");
		}
		con.close();
		pstmt.close();
		rs.close();
		return mid;
	}
	
	//비밀번호찾기
	@Override
	public String findPassword(String user_id, String user_email) throws Exception {
		String mid = null;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(UserSQL2.FIND_PASSWORD);
		User findId = null;
		pstmt.setString(1, user_id);
		pstmt.setString(2, user_email);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			mid = rs.getString("user_password");
		}
		con.close();
		pstmt.close();
		rs.close();
		return mid;
	}
	
	
	
}