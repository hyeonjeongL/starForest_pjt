package com.itwill.domain;
//검색기능
import java.util.Date;

public class Search {
	
	private int book_no;
	private int isbn;
	private String book_title;
	private String book_author;
	private String book_publisher;
	private String book_summary;
	private String book_publish_date;
	private String book_image;
	private Date book_input_date;
	private String book_image_src;
	private int book_page;
	private int book_qty;
	private int book_res_cnt;
	private int book_rental_cnt;
	private int category_no;
	private String category_name;
	
	//검색 필터
	private String type;//검색 타입
	private String Keyword; //검색 내용
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return Keyword;
	}

	public void setKeyword(String keyword) {
		Keyword = keyword;
	}

	public Search() {
		// TODO Auto-generated constructor stub
	}
	
	public Search(int book_no, int isbn, String book_title, String book_author, String book_publisher,
			String book_summary, String book_publish_date, String book_image, Date book_input_date,
			String book_image_src, int book_page, int book_qty, int book_res_cnt, int book_rental_cnt, int category_no
			) {
		super();
		this.book_no = book_no;
		this.isbn = isbn;
		this.book_title = book_title;
		this.book_author = book_author;
		this.book_publisher = book_publisher;
		this.book_summary = book_summary;
		this.book_publish_date = book_publish_date;
		this.book_image = book_image;
		this.book_input_date = book_input_date;//필요?
		this.book_image_src = book_image_src;//필요?
		this.book_page = book_page;//필요?
		this.book_qty = book_qty;//필요?
		this.book_res_cnt = book_res_cnt;//필요?
		this.book_rental_cnt = book_rental_cnt;//필요?
		this.category_no = category_no;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public int getBook_no() {
		return book_no;
	}

	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}

	public int getIsbn() {
		return isbn;
	}

	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}

	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public String getBook_author() {
		return book_author;
	}

	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}

	public String getBook_publisher() {
		return book_publisher;
	}

	public void setBook_publisher(String book_publisher) {
		this.book_publisher = book_publisher;
	}

	public String getBook_summary() {
		return book_summary;
	}

	public void setBook_summary(String book_summary) {
		this.book_summary = book_summary;
	}

	public String getBook_publish_date() {
		return book_publish_date;
	}

	public void setBook_publish_date(String book_publish_date) {
		this.book_publish_date = book_publish_date;
	}

	public String getBook_image() {
		return book_image;
	}

	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}

	public Date getBook_input_date() {
		return book_input_date;
	}

	public void setBook_input_date(Date book_input_date) {
		this.book_input_date = book_input_date;
	}

	public String getBook_image_src() {
		return book_image_src;
	}

	public void setBook_image_src(String book_image_src) {
		this.book_image_src = book_image_src;
	}

	public int getBook_page() {
		return book_page;
	}

	public void setBook_page(int book_page) {
		this.book_page = book_page;
	}

	public int getBook_qty() {
		return book_qty;
	}

	public void setBook_qty(int book_qty) {
		this.book_qty = book_qty;
	}

	public int getBook_res_cnt() {
		return book_res_cnt;
	}

	public void setBook_res_cnt(int book_res_cnt) {
		this.book_res_cnt = book_res_cnt;
	}

	public int getBook_rental_cnt() {
		return book_rental_cnt;
	}

	public void setBook_rental_cnt(int book_rental_cnt) {
		this.book_rental_cnt = book_rental_cnt;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	@Override
	public String toString() {
		return "Search [book_no=" + book_no + ", isbn=" + isbn + ", book_title=" + book_title + ", book_author="
				+ book_author + ", book_publisher=" + book_publisher + ", book_summary=" + book_summary
				+ ", book_publish_date=" + book_publish_date + ", book_image=" + book_image + ", book_input_date="
				+ book_input_date + ", book_image_src=" + book_image_src + ", book_page=" + book_page + ", book_qty="
				+ book_qty + ", book_res_cnt=" + book_res_cnt + ", book_rental_cnt=" + book_rental_cnt
				+ ", category_no=" + category_no + "]";
	}

	
	
}