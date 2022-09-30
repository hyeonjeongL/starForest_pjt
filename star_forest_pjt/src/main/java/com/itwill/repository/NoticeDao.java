package com.itwill.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Notice;

public interface NoticeDao {
	
	//공지사항 생성
	int create(Notice notice) throws Exception;
	
	//공지사항 전체리스트
	List<Notice> selectAll() throws Exception;
	
	//공지사항 수정
	int update(int notice_no) throws Exception;
	
	//공지사항 조회수
	int updateCount() throws Exception;
	
	//공지사항 삭제
	int delete(int notice_no) throws Exception;
	
	//공지사항 총 개수
	int noticeCount() throws Exception;
	
	//공지사항 검색
	//List<Notice> selectByTitle(String notice_title) throws Exception;
	
}
