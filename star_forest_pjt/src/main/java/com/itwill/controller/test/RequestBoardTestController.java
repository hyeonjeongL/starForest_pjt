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

	public static void main(String[] args) {
		SpringApplication application = 
	            new SpringApplication(RequestBoardTestController.class);
	      application.setWebApplicationType(WebApplicationType.NONE);
	      ConfigurableApplicationContext context=application.run(args);
	      RequestBoardDao requestBoardDao=(RequestBoardDao)context.getBean(RequestBoardDao.class);

	}

}
