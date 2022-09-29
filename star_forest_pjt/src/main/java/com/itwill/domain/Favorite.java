package com.itwill.domain;

public class Favorite {
	
	int favorite_no;
	String user_id;
	int book_no;
	
	public Favorite() {
	}

	public Favorite(int favorite_no, String user_id, int book_no) {
		super();
		this.favorite_no = favorite_no;
		this.user_id = user_id;
		this.book_no = book_no;
	}

	public int getFavorite_no() {
		return favorite_no;
	}

	public void setFavorite_no(int favorite_no) {
		this.favorite_no = favorite_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getBook_no() {
		return book_no;
	}

	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}

	@Override
	public String toString() {
		return "Favorite [favorite_no=" + favorite_no + ", user_id=" + user_id + ", book_no=" + book_no + "]";
	}

	
	

}
