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

//검색 기능

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"},includeFilters= {
		@Filter(type= FilterType.ASSIGNABLE_TYPE,
				classes= {SearchDao.class,SearchMapper.class}
		)
})
public class SearchDaoTest {
	public static void main(String[] args) throws Exception {
		SpringApplication application = 
				new SpringApplication(SearchDaoTest.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		SearchDao searchDao=(SearchDao)context.getBean(SearchDao.class);
		
		//제목 검색_안됨_되는데 이상함
		System.out.println(searchDao.selectByTitle("2023년"));
	}
}
