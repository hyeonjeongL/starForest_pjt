package com.itwill.controller.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.ComponentScan.Filter;

import com.itwill.domain.RequestBoard;
import com.itwill.mapper.RequestBoardMapper;
import com.itwill.repository.RequestBoardDao;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"}, includeFilters = {
        @Filter(
                type = FilterType.ASSIGNABLE_TYPE, 
                classes = {RequestBoardDao.class,RequestBoardMapper.class}
            )
        } )
public class RequestBoardTestController {

	public static void main(String[] args) throws Exception {
		SpringApplication application = 
	            new SpringApplication(RequestBoardTestController.class);
	      application.setWebApplicationType(WebApplicationType.NONE);
	      ConfigurableApplicationContext context=application.run(args);
	      RequestBoardDao requestBoardDao=(RequestBoardDao)context.getBean(RequestBoardDao.class);
	      //int rowCount = requestBoardDao.create(new RequestBoard(0, "피프티피플 신청합니다", 
	    		  					//null, "피프티피플 보고싶어요", 0, null, 0, 0, 0, 0, 700, "woohyuck"));
	      //System.out.println(rowCount);
	      int rowCount = requestBoardDao.createReply(new RequestBoard(0, "[re]피프티피플 신청합니다", null, "신청완료됐습니다", 0, "신청접수완료", 0, 0, 0, 21, 700, "manager"));
	      System.out.println(rowCount);
	      
	}

}
