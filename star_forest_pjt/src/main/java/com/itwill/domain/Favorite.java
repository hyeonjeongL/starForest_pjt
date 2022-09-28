package com.itwill.domain;

public class Favorite {
	
	int favorite_no;
	int book_no;
	String user_id;
	
	public Favorite() {
	}

	public Favorite(int favorite_no, int book_no, String user_id) {
		super();
		this.favorite_no = favorite_no;
		this.book_no = book_no;
		this.user_id = user_id;
	}

	public int getFavorite_no() {
		return favorite_no;
	}

	public void setFavorite_no(int favorite_no) {
		this.favorite_no = favorite_no;
	}

	public int getBook_no() {
		return book_no;
	}

	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "Favorite [favorite_no=" + favorite_no + ", book_no=" + book_no + ", user_id=" + user_id + "]";
	}
	
	

}
