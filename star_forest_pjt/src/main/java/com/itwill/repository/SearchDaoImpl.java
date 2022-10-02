package com.itwill.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Search;
import com.itwill.domain.SearchSQL;

@Repository
public class SearchDaoImpl implements SearchDao{
	@Autowired
	private DataSource dataSource;
	
	public SearchDaoImpl() {
	}
	
	public SearchDaoImpl(DataSource dataSource) {
		this.dataSource=dataSource;
	}
	public void setDataSource(DataSource dataSource) {
		this.dataSource=dataSource;
	}
	
//제목 검색
	@Override
	public List<Search> selectByTitle(String keyword) throws Exception {
		ArrayList<Search> searchList = new ArrayList<Search>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SearchSQL.BOOK_SELECT_BY_TITLE);
			pstmt.setString(1, "%" + keyword + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Search search = new Search(
						rs.getInt("book_no"), 
						rs.getInt("isbn"), 
						rs.getString("book_title"), 
						rs.getString("book_author"), 
						rs.getString("book_publisher"),
						rs.getString("book_summary"), 
						rs.getString("book_publish_date"), 
						rs.getString("book_image"),
						rs.getDate("book_input_date"),
						rs.getString("book_image_src"),
						rs.getInt("book_page"),
						rs.getInt("book_qty"),
						rs.getInt("book_res_cnt"),
						rs.getInt("book_rental_cnt"),
						rs.getInt("category_no")
						);
				searchList.add(search);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return searchList;
	}
	//번호 검색
	public Search selectByNo(int book_no) throws Exception {
		Search search = null;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(SearchSQL.BOOK_SELECT_BY_NO);
		pstmt.setInt(1, book_no);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			search = new Search(
					rs.getInt("book_no"), 
					rs.getInt("isbn"), 
					rs.getString("book_title"), 
					rs.getString("book_author"), 
					rs.getString("book_publisher"),
					rs.getString("book_summary"), 
					rs.getString("book_publish_date"), 
					rs.getString("book_image"),
					rs.getDate("book_input_date"),
					rs.getString("book_image_src"),
					rs.getInt("book_page"),
					rs.getInt("book_qty"),
					rs.getInt("book_res_cnt"),
					rs.getInt("book_rental_cnt"),
					rs.getInt("category_no")
					
					);
		}
		con.close();
		return search;
	}
	
	//저자 검색
		public List<Search> selectByAuthor(String keyword) throws Exception {
			ArrayList<Search> searchList = new ArrayList<Search>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = dataSource.getConnection();
				pstmt = conn.prepareStatement(SearchSQL.BOOK_SELECT_BY_AUTHOR);
				pstmt.setString(1, "%" + keyword + "%");
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Search search = new Search(
							rs.getInt("book_no"), 
							rs.getInt("isbn"), 
							rs.getString("book_title"), 
							rs.getString("book_author"), 
							rs.getString("book_publisher"),
							rs.getString("book_summary"), 
							rs.getString("book_publish_date"), 
							rs.getString("book_image"),
							rs.getDate("book_input_date"),
							rs.getString("book_image_src"),
							rs.getInt("book_page"),
							rs.getInt("book_qty"),
							rs.getInt("book_res_cnt"),
							rs.getInt("book_rental_cnt"),
							rs.getInt("category_no"));
					searchList.add(search);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}
			
			return searchList;
		}
		
		//출판사검색
		public List<Search> selectByPublisher(String keyword) throws Exception {
			ArrayList<Search> searchList = new ArrayList<Search>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = dataSource.getConnection();
				pstmt = conn.prepareStatement(SearchSQL.BOOK_SELECT_BY_PUBLISHER);
				pstmt.setString(1, "%" + keyword + "%");
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Search search = new Search(
							rs.getInt("book_no"), 
							rs.getInt("isbn"), 
							rs.getString("book_title"), 
							rs.getString("book_author"), 
							rs.getString("book_publisher"),
							rs.getString("book_summary"), 
							rs.getString("book_publish_date"), 
							rs.getString("book_image"),
							rs.getDate("book_input_date"),
							rs.getString("book_image_src"),
							rs.getInt("book_page"),
							rs.getInt("book_qty"),
							rs.getInt("book_res_cnt"),
							rs.getInt("book_rental_cnt"),
							rs.getInt("category_no"));
					searchList.add(search);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}
			
			return searchList;
		}
		
		//분야 검색
		public List<Search> selectByCategoryName(String keyword) throws Exception {
			ArrayList<Search> searchList = new ArrayList<Search>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = dataSource.getConnection();
				pstmt = conn.prepareStatement(SearchSQL.BOOK_SELECT_BY_CATEGORY_NAME);
				pstmt.setString(1, "%" + keyword + "%");
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Search search = new Search(
							rs.getInt("book_no"), 
							rs.getInt("isbn"), 
							rs.getString("book_title"), 
							rs.getString("book_author"), 
							rs.getString("book_publisher"),
							rs.getString("book_summary"), 
							rs.getString("book_publish_date"), 
							rs.getString("book_image"),
							rs.getDate("book_input_date"),
							rs.getString("book_image_src"),
							rs.getInt("book_page"),
							rs.getInt("book_qty"),
							rs.getInt("book_res_cnt"),
							rs.getInt("book_rental_cnt"),
							rs.getInt("category_no"));
					searchList.add(search);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}
			
			return searchList;
		}
		//통합 검색(제목, 저자, 분야, 출판사)
		public List<Search> selectByAll(String keyword) throws Exception {
			ArrayList<Search> searchList = new ArrayList<Search>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = dataSource.getConnection();
				pstmt = conn.prepareStatement(SearchSQL.BOOK_SELECT_ALL);
				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, "%" + keyword + "%");
				pstmt.setString(3, "%" + keyword + "%");
				pstmt.setString(4, "%" + keyword + "%");
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Search search = new Search(
							rs.getInt("book_no"), 
							rs.getInt("isbn"), 
							rs.getString("book_title"), 
							rs.getString("book_author"), 
							rs.getString("book_publisher"),
							rs.getString("book_summary"), 
							rs.getString("book_publish_date"), 
							rs.getString("book_image"),
							rs.getDate("book_input_date"),
							rs.getString("book_image_src"),
							rs.getInt("book_page"),
							rs.getInt("book_qty"),
							rs.getInt("book_res_cnt"),
							rs.getInt("book_rental_cnt"),
							rs.getInt("category_no"));
					searchList.add(search);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}
			
			return searchList;
		}
		
}
/*
	//제목 검색 페이지
	@Override
	public List<Search> selectByTitle(String keyword, int start, int last) throws Exception {
		ArrayList<Search> searchList = new ArrayList<Search>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SearchSQL.BOOK_SELECT_BY_TITLE_LIST);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, last);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Search search = new Search(
						rs.getInt("book_no"), 
						rs.getInt("isbn"), 
						rs.getString("book_title"), 
						rs.getString("book_author"), 
						rs.getString("book_publisher"),
						rs.getString("book_summary"), 
						rs.getString("book_publish_date"), 
						rs.getString("book_image"),
						rs.getDate("book_input_date"),
						rs.getString("book_image_src"),
						rs.getInt("book_page"),
						rs.getInt("book_qty"),
						rs.getInt("book_res_cnt"),
						rs.getInt("book_rental_cnt"),
						rs.getInt("category_no")
						);
				searchList.add(search);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return searchList;
	}*/
/*public class BookDao {
	private DataSource dataSource;

	public BookDao() throws Exception {
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/book/jdbc.properties"));
		*** Apache DataSource ***
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
	}

	
 
	
	

	//저자 검색 페이지
	public ArrayList<Book> selectByAuthor(String keyword, int start, int last) throws Exception {
		ArrayList<Book> bookList = new ArrayList<Book>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(BookSQL.BOOK_SELECT_BY_AUTHOR_LIST);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, last);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Book book = new Book(rs.getInt("b_no"), rs.getString("b_class"), rs.getString("b_name"), rs.getInt("b_price"),
						rs.getString("b_summary"), rs.getString("b_image"), rs.getString("b_author"),
						rs.getString("b_publisher"));
				bookList.add(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return bookList;
	}

	
	
	//분야 검색 페이지
	public ArrayList<Book> selectByClass(String keyword, int start, int last) throws Exception {
		ArrayList<Book> bookList = new ArrayList<Book>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(BookSQL.BOOK_SELECT_BY_CLASS_LIST);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, last);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Book book = new Book(rs.getInt("b_no"), rs.getString("b_class"), rs.getString("b_name"), rs.getInt("b_price"),
						rs.getString("b_summary"), rs.getString("b_image"), rs.getString("b_author"),
						rs.getString("b_publisher"));
				bookList.add(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return bookList;
	}
	
	//출판사 검색
	
	
	//출판사 검색 페이지
	public ArrayList<Book> selectByPublisher(String keyword, int start, int last) throws Exception {
		ArrayList<Book> bookList = new ArrayList<Book>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(BookSQL.BOOK_SELECT_BY_PUBLISHER_LIST);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, last);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Book book = new Book(rs.getInt("b_no"), rs.getString("b_class"), rs.getString("b_name"), rs.getInt("b_price"),
						rs.getString("b_summary"), rs.getString("b_image"), rs.getString("b_author"),
						rs.getString("b_publisher"));
				bookList.add(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return bookList;
	}
	
 * 
	//도서 전체 조회 
	
	public ArrayList<Book> getList() throws Exception{
		ArrayList<Book> bookList = new ArrayList<Book>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(BookSQL.BOOK_LIST);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Book book = new Book(rs.getInt("b_no"), rs.getString("b_class"), rs.getString("b_name"), rs.getInt("b_price"),
						rs.getString("b_summary"), rs.getString("b_image"), rs.getString("b_author"),
						rs.getString("b_publisher"));
				bookList.add(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return bookList;
	}
	//도서 전체 조회2
	public ArrayList<Book> getList(int start, int last) throws Exception{
		ArrayList<Book> bookList = new ArrayList<Book>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(BookSQL.BOOK_LIST_PAGE);
			pstmt.setInt(1, start);
			pstmt.setInt(2, last);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Book book = new Book(rs.getInt("b_no"), rs.getString("b_class"), rs.getString("b_name"), rs.getInt("b_price"),
						rs.getString("b_summary"), rs.getString("b_image"), rs.getString("b_author"),
						rs.getString("b_publisher"));
				bookList.add(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return bookList;
	}
	
	
	//통합 검색(제목, 저자, 분야, 출판사) 페이지
	public ArrayList<Book> selectByAll(String keyword, int start, int last) throws Exception {
		ArrayList<Book> bookList = new ArrayList<Book>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(BookSQL.BOOK_SELECT_ALL_LIST);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			pstmt.setString(3, "%" + keyword + "%");
			pstmt.setString(4, "%" + keyword + "%");
			pstmt.setInt(5, start);
			pstmt.setInt(6, last);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Book book = new Book(rs.getInt("b_no"), rs.getString("b_class"), rs.getString("b_name"), rs.getInt("b_price"),
						rs.getString("b_summary"), rs.getString("b_image"), rs.getString("b_author"),
						rs.getString("b_publisher"));
				bookList.add(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return bookList;
	}
	
	// 도서 수량 조회
	public int getTotBookCount() throws Exception {
		int totBookCount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("select count(*) from book");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totBookCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return totBookCount;
	}
	
	public int getTotBookCount(String keyword) throws Exception {
		int totBookCount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("select count(*) from book where b_name like ? or b_author like ? or b_publisher like ?");
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			pstmt.setString(3, "%" + keyword + "%");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totBookCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return totBookCount;
	}
 * 
 */