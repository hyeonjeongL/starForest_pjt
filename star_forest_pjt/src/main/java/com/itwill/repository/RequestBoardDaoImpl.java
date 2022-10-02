package com.itwill.repository;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.RequestBoard;
import com.itwill.mapper.RequestBoardMapper;

@Repository
public class RequestBoardDaoImpl implements RequestBoardDao{
	@Autowired
	private RequestBoardMapper requestBoardMapper;
	
	@Override
	public int create(RequestBoard requestBoard) throws Exception {
		return requestBoardMapper.create(requestBoard);
	}

	@Override
	public int createReply(RequestBoard requestBoard) throws Exception {
		return requestBoardMapper.createReply(requestBoard);
	}

	@Override
	public List<RequestBoard> findUserBoard(String user_id) throws Exception {
		return requestBoardMapper.findUserBoard(user_id);
	}

	@Override
	public boolean isExisted(int groupno) throws Exception {
		boolean isExisted=false;
		if(requestBoardMapper.isExisted(groupno)==true) {
			isExisted=true;
		}else {
			isExisted=false;
		}
		return isExisted;
	}

	@Override
	public int delete(int board_no) throws Exception {
		return requestBoardMapper.delete(board_no);
	}

	@Override
	public int deleteByGroupno(int groupno) throws Exception {
		return requestBoardMapper.deleteByGroupno(groupno);
	}

	@Override
	public int update(RequestBoard requestBoard) throws Exception {
		return requestBoardMapper.update(requestBoard);
	}

	@Override
	public int addReadCount(int board_no) throws Exception {
		return requestBoardMapper.addReadCount(board_no);
	}

	@Override
	public List<RequestBoard> selectAll() throws Exception {
		return requestBoardMapper.selectAll();
	}

	@Override
	public int countAll() throws Exception {
		return requestBoardMapper.countAll();
	}

	@Override
	public RequestBoard selectOne(int board_no) throws Exception {
		return requestBoardMapper.selectOne(board_no);
	}

	@Override
	public List<RequestBoard> list() throws Exception {
		return requestBoardMapper.list();
	}

}
