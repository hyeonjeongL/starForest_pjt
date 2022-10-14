package com.itwill.domain.notice123;

import java.util.Date;

public class Notice {
	private int notice_no;
	private String notice_title;
	private String notice_date;
	private String notice_content;
	private String notice_image;
	private int notice_readcount;
	private int setting;
	private int group_no;
	
	public Notice() {
	}

	public Notice(int notice_no, String notice_title, String notice_date, String notice_content, String notice_image,
			int notice_readcount, int setting, int group_no) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_date = notice_date;
		this.notice_content = notice_content;
		this.notice_image = notice_image;
		this.notice_readcount = notice_readcount;
		this.setting = setting;
		this.group_no = group_no;
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

	public String getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(String notice_date) {
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

	public int getGroup_no() {
		return group_no;
	}

	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}

	@Override
	public String toString() {
		return "Notice [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_date=" + notice_date
				+ ", notice_content=" + notice_content + ", notice_image=" + notice_image + ", notice_readcount="
				+ notice_readcount + ", setting=" + setting + ", group_no=" + group_no + "]";
	}
	
	

	

	
	
	
	
	}