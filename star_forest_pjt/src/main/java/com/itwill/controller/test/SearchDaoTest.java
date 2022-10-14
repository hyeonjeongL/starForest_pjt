package com.itwill.controller.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.FilterType;

import com.itwill.domain.Search;
import com.itwill.mapper.SearchMapper;
import com.itwill.repository.SearchDao;
import com.itwill.service.SearchService;

//검색 기능

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"},
includeFilters= {@Filter(type= FilterType.ASSIGNABLE_TYPE,
				classes= {SearchDao.class,SearchService.class,SearchMapper.class}
		)
})
public class SearchDaoTest {
	public static void main(String[] args) throws Exception {
		SpringApplication application = 
				new SpringApplication(SearchDaoTest.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		SearchService searchService=(SearchService)context.getBean(SearchService.class);
		System.out.println(searchService.searchList(new Search(0, "축구", null, null, null)));
		
		//제목 검색
		
		//번호 검색
		
		//분야명 검색
		//분야번호 검색
		
		//출판사 검섹
		
		//저자 검색
		
		//통합 검색
		
		//도서 전체 리스트
		
	}
}
