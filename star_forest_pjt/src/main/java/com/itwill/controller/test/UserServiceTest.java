package com.itwill.controller.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;

import com.itwill.domain.User;
import com.itwill.repository.UserDao;
import com.itwill.service.UserService;

import org.springframework.context.annotation.ComponentScan.Filter;



@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"}, includeFilters = {
		@Filter(
				type=FilterType.ASSIGNABLE_TYPE,
				classes = {UserService.class,UserDao.class}
				)
			})
public class UserServiceTest {
	public static void main(String[] args) throws Exception {
		SpringApplication application=new SpringApplication(UserServiceTest.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		UserService userService=(UserService)context.getBean(UserService.class);
		System.out.println("user service test!!");
		User user=new User("yeji3", "예지3", "3333", "ye@naver.com", "1995-02-02", "F", 
							"01025894567", "서울시강남구", "qr", "대출가능", 3, 89, 300);
		System.out.println(userService.create(user));
		System.out.println(userService.login("yeji3", "2222"));
		
		System.out.println(userService.updatePassword(new User("soyoon", "4567")));
		User updateUser=new User("yeji", "예찌", "3333", "han@naver.com", 
									"1997-03-03", null, "01023456789", "서울", null, 
									null, 0, 0, 600);
		System.out.println(userService.update(updateUser));
		System.out.println(userService.remove("yeji4"));
		System.out.println(userService.userList());
		System.out.println(userService.findUser("yeji2"));
		System.out.println(userService.existedUser("soyoon"));
		System.out.println(userService.userRentalCount("junghyeon"));
	}
}
