package com.itwill.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Good;
//추천도서
import com.itwill.domain.GoodSQL;

@Repository
public class GoodDaoImpl implements GoodDao{
	@Autowired
	private DataSource dataSource;
	
	public GoodDaoImpl() {
		
	}
	public GoodDaoImpl(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
//분야추천
	@Override
	public List<Good> goodCategoryNo(int category_no) throws Exception{
		ArrayList<Good> goodList=new ArrayList<Good>();
		Connection con = 
				dataSource.getConnection();
		PreparedStatement pstmt=
				con.prepareStatement(GoodSQL.SELECT_BY_CATEGORYNO);
		pstmt.setInt(1, category_no);
		ResultSet rs=pstmt.executeQuery();
		while (rs.next()) {
					goodList.add(new Good(
					rs.getInt("book_no"),
					rs.getInt("isbn"),
					rs.getString("book_title"),
					rs.getString("book_author"),
					rs.getString("book_publisher"),
					rs.getString("book_image"),
					rs.getInt("category_no"),
					rs.getString("category_name")
				));
				
		}
		con.close();
		return goodList;
}
	
	
}