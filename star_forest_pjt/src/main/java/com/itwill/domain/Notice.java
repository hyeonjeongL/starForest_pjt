package com.itwill.domain;

import java.util.Date;

public class Notice {
	private int notice_no;
	private String notice_title;
	private Date notice_date;
	private String notice_content;
	private String notice_image;
	private int notice_readcount;
	private int setting;
	
	public Notice() {
	}
	
	public Notice(int notice_no, String notice_title, Date notice_date, String notice_content, String notice_image,
			int setting, int notice_readcount) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_date = notice_date;
		this.notice_content = notice_content;
		this.notice_image = notice_image;
		this.notice_readcount = notice_readcount;
		this.setting = setting;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_image() {
		return notice_image;
	}

	public void setNotice_image(String notice_image) {
		this.notice_image = notice_image;
	}

	public int getNotice_readcount() {
		return notice_readcount;
	}

	public void setNotice_readcount(int notice_readcount) {
		this.notice_readcount = notice_readcount;
	}

	public int getSetting() {
		return setting;
	}

	public void setSetting(int setting) {
		this.setting = setting;
	}

	@Override
	public String toString() {
		return "Notice [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_date=" + notice_date
				+ ", notice_content=" + notice_content + ", notice_image=" + notice_image + ", notice_readcount="
				+ notice_readcount + ", setting=" + setting + "]";
	}

	

	
	
	
	
	}