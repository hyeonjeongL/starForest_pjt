package com.itwill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.domain.Notice;
import com.itwill.repository.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;

	@Override
	public int create(Notice notice) throws Exception {
		return noticeDao.create(notice);
	}

	@Override
	public List<Notice> selectAll() throws Exception {
		return noticeDao.selectAll();
	}

	@Override
	public int update(int notice_no) throws Exception {
		return noticeDao.update(notice_no);
	}

	@Override
	public int delete(int notice_no) throws Exception {
		return noticeDao.delete(notice_no);
	}

	@Override
	public int noticeCount() throws Exception {
		return noticeDao.noticeCount();
	}
	
	
}
