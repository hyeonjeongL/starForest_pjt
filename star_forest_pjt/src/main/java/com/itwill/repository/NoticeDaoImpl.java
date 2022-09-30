package com.itwill.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Notice;
import com.itwill.mapper.NoticeMapper;

@Mapper
@Repository
public class NoticeDaoImpl implements NoticeDao{
	
	@Autowired
	private NoticeMapper noticeMapper;

	@Override
	public int create(Notice notice) throws Exception {
		return noticeMapper.create(notice);
	}

	@Override
	public List<Notice> selectAll() throws Exception {
		return noticeMapper.selectAll();
	}

	@Override
	public int update(int notice_no) throws Exception {
		return noticeMapper.update(notice_no);
	}

	@Override
	public int delete(int notice_no) throws Exception {
		return noticeMapper.delete(notice_no);
	}

	@Override
	public int noticeCount() throws Exception {
		return noticeMapper.noticeCount();
	}
	
	
	
	
}
