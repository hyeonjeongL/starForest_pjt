package com.itwill.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import org.springframework.stereotype.Repository;

import com.itwill.domain.BookCategory;
import com.itwill.domain.RequestBoard;
import com.itwill.domain.RequestBoardListPageMaker;
import com.itwill.util.PageMaker;

public interface RequestBoardDao {
	
		//게시물생성
		int create(RequestBoard requestBoard) throws Exception;
		
		//답글생성
		int createReply(RequestBoard requestBoard) throws Exception;
		
		//내가 쓴 게시물들 확인
		List<RequestBoard> findUserBoard(String user_id) throws Exception;
		
		//게시물 존재 여부
		boolean isExisted(int board_groupno) throws Exception;
		
		//게시물 삭제(게시판번호)
		int delete(int board_no) throws Exception;
		
		//게시물 삭제(게시판 그룹번호)
		int deleteByGroupno(int board_groupno) throws Exception;
		
		//게시물 수정
		int update(RequestBoard requestBoard) throws Exception;
		
		int addStep(RequestBoard requestBoard) throws Exception;
		
		//조회수 증가
		int addReadCount(int board_no) throws Exception;
		
		//게시물 전체 리스트
		List<RequestBoard> selectAll() throws Exception;
		
		//카테고리 전체 리스트
		List<BookCategory> selectCategoryAll() throws Exception;
		
		//게시물 총 갯수
		int countAll() throws Exception;
		
		//게시물 상세보기
		RequestBoard selectOne(int board_no) throws Exception;
		
		//페이지에 있는 게시물 시작번호 / 끝번호
		public RequestBoardListPageMaker list(RequestBoardListPageMaker page) throws Exception;
		
}
