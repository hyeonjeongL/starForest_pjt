package com.itwill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.domain.BookCategory;
import com.itwill.domain.RequestBoard;
import com.itwill.domain.RequestBoardListPageMaker;
import com.itwill.repository.RequestBoardDao;
@Service
public class RequestBoardServiceImpl implements RequestBoardService{
	@Autowired
	private RequestBoardDao requestBoardDao;
	
	@Override
	public int create(RequestBoard requestBoard) throws Exception {
		return requestBoardDao.create(requestBoard);
	}

	@Override
	public int createReply(RequestBoard requestBoard) throws Exception {
		return requestBoardDao.createReply(requestBoard);
	}

	@Override
	public List<RequestBoard> findUserBoard(String user_id) throws Exception {
		return requestBoardDao.findUserBoard(user_id);
	}

	@Override
	public boolean isExisted(int groupno) throws Exception {
		return requestBoardDao.isExisted(groupno);
	}

	@Override
	public int delete(int board_no) throws Exception {
		return requestBoardDao.delete(board_no);
	}

	@Override
	public int deleteByGroupno(int groupno) throws Exception {
		/*
		 * 답글이 있으면 삭제 불가능:0
		 * 답글 없으면 삭제 가능:1
		 */
		int rowCount = -999;
		if(requestBoardDao.isExisted(groupno)==true) {
			rowCount = 0;
		}else if(requestBoardDao.isExisted(groupno)==false) {
			rowCount =requestBoardDao.deleteByGroupno(groupno);
		}
		return rowCount;
	}

	@Override
	public int update(RequestBoard requestBoard) throws Exception {
		return requestBoardDao.update(requestBoard);
	}

	@Override
	public int addReadCount(int board_no) throws Exception {
		return requestBoardDao.addReadCount(board_no);
	}

	@Override
	public List<RequestBoard> selectAll() throws Exception {
		return requestBoardDao.selectAll();
	}
	
	@Override
	public List<BookCategory> selectCategoryAll() throws Exception {
		return requestBoardDao.selectCategoryAll();
	}

	@Override
	public int countAll() throws Exception {
		return requestBoardDao.countAll();
	}

	@Override
	public RequestBoard selectOne(int board_no) throws Exception {
		return requestBoardDao.selectOne(board_no);
	}

	@Override
	public RequestBoardListPageMaker list(RequestBoardListPageMaker page) throws Exception {
		return requestBoardDao.list(page);
	}

}
