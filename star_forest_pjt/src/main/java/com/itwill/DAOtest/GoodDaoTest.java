package com.itwill.DAOtest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.FilterType;

import com.itwill.mapper.GoodMapper;
import com.itwill.repository.GoodDao;

//분야 번호 추천_성공_근데 이거 맞나?

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"},includeFilters= {
		@Filter(type= FilterType.ASSIGNABLE_TYPE,
				classes= {GoodDao.class,GoodMapper.class}
		)
})
public class GoodDaoTest {
	public static void main(String[] args) throws Exception {
		SpringApplication application = 
				new SpringApplication(GoodDaoTest.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		GoodDao goodDao=(GoodDao)context.getBean(GoodDao.class);
		System.out.println(goodDao.goodCategoryNo(100)); //분야 번호 추천
	}
}
