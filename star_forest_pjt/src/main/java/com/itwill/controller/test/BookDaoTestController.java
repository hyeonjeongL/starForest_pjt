package com.itwill.controller.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.ComponentScan.Filter;

import com.itwill.mapper.BookMapper;
import com.itwill.mapper.NoticeMapper;
import com.itwill.repository.BookDao;
import com.itwill.repository.NoticeDao;

@SpringBootApplication
@ComponentScan(basePackages = { "com.itwill" }, includeFilters = {
		@Filter(type = FilterType.ASSIGNABLE_TYPE, classes = { BookDao.class, BookMapper.class }) })
public class BookDaoTestController {

	public static void main(String[] args) throws Exception {
		SpringApplication application = new SpringApplication(BookDaoTestController.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context = application.run(args);
		BookDao bookDao = (BookDao) context.getBean(BookDao.class);
//		System.out.println(bookDao.selectBookDetail(12));
// 		System.out.println(bookDao.updateRentalBookQty(1));
// 		System.out.println(bookDao.updateReturnBookQty(2));
		System.out.println(bookDao.updateById("hyeonjeong")); //왜 한권빌린애는 처리되는데 3권빌린 나는 처리 안되지 밀당오지네 완료
//		System.out.println(bookDao.updateByIdNo("yeji",2)); //맵만 해결하면 완료
//		System.out.println(bookDao.selectAll());
	}

}
