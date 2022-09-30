package com.itwill.controller.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.FilterType;

import com.itwill.mapper.NoticeMapper;
import com.itwill.repository.NoticeDao;



@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"}, includeFilters = {
        @Filter(
                type = FilterType.ASSIGNABLE_TYPE, 
                classes = {NoticeDao.class,NoticeMapper.class}
            )
        } )
public class Noticetest1234 {

   public static void main(String[] args) throws Exception{
      SpringApplication application = 
            new SpringApplication(Noticetest1234.class);
      application.setWebApplicationType(WebApplicationType.NONE);
      ConfigurableApplicationContext context=application.run(args);
      NoticeDao noticeDao=(NoticeDao)context.getBean(NoticeDao.class);
      System.out.println(noticeDao.selectAll());
   }

}