package com.itwill.controller.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.domain.SeatReservation;
import com.itwill.mapper.NoticeMapper;
import com.itwill.repository.NoticeDao;
import com.itwill.repository.SeatReservationDao;
import com.itwill.service.SeatReservationService;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"}, includeFilters = {
        @Filter(
                type = FilterType.ASSIGNABLE_TYPE, 
                classes = {NoticeDao.class,NoticeMapper.class}
            )
        } )
public class SoyoonDaoTestController {

   public static void main(String[] args) throws Exception{
      SpringApplication application = 
            new SpringApplication(Noticetest1234.class);
      application.setWebApplicationType(WebApplicationType.NONE);
      ConfigurableApplicationContext context=application.run(args);
      SeatReservationDao seatReservationDao=(SeatReservationDao)context.getBean(SeatReservationDao.class);
      System.out.println(seatReservationDao.selectAll());
      System.out.println(seatReservationDao.countAvailableSeat(0));
      System.out.println(seatReservationDao.selectAvailableSeat(0));
      SeatReservation usingSeat = seatReservationDao.selectTimeUsingSeat("B01", 1);
      System.out.println(seatReservationDao.returnByAuto(usingSeat));
      
      //좌석 테스트 완료
   }

}