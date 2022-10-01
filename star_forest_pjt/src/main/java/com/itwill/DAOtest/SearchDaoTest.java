package com.itwill.DAOtest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.FilterType;

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
		SearchDao searchDao=(SearchDao)context.getBean(SearchDao.class);
		SearchService searchService=(SearchService)context.getBean(SearchService.class);
		
		//제목 검색_성공
		System.out.println(searchDao.selectByTitle("2023년"));
		System.out.println(searchService.selectByTitle("2022"));
		
		//번호검색_성공
		System.out.println(searchDao.selectByNo(50));
		System.out.println(searchService.selectByNo(60));
		
		//저자검색_성공
		System.out.println(searchDao.selectByAuthor("박영광"));
		System.out.println(searchService.selectByAuthor("장중덕"));
		
		//출판사검색_성공
		System.out.println(searchDao.selectByPublisher("보누스"));
		System.out.println(searchService.selectByPublisher("소우주"));
		
		//분야검색_성공
		System.out.println(searchDao.selectByCategoryName("만화"));
		System.out.println(searchService.selectByCategoryName("건강"));
		
		
	}
}
