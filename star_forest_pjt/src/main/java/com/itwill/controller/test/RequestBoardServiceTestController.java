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
import com.itwill.service.RequestBoardService;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"}, includeFilters = {
        @Filter(
                type = FilterType.ASSIGNABLE_TYPE, 
                classes = {RequestBoardService.class,RequestBoardMapper.class}
            )
        } )
public class RequestBoardServiceTestController {
	public static void main(String[] args) throws Exception{
		 SpringApplication application = 
		            new SpringApplication(RequestBoardServiceTestController.class);
		      application.setWebApplicationType(WebApplicationType.NONE);
		      ConfigurableApplicationContext context=application.run(args);
		      RequestBoardService requestBoardService=(RequestBoardService)context.getBean(RequestBoardService.class);
		      System.out.println(requestBoardService.selectAll());
		      //int rowCount = requestBoardService.createReply(new RequestBoard(0, "[re]피프티피플 신청합니다", null, "신청완료됐습니다", 0, "신청접수완료", 0, 0, 0, 21, 700, "manager"));
		      System.out.println(requestBoardService.deleteByGroupno(21));
		      System.out.println(requestBoardService.deleteByGroupno(8));
		      
		      //서비스 테스트 완료
	}

}
