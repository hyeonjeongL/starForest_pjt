package com.itwill.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwill.repository.BookDao;


@Service
@Transactional
public class BookService {
	@Autowired(required=false) //해당 타입의 빈 객체가 존재하지 않는 경우 예외 처리
	BookDao bookDataDao;
	
	

}
