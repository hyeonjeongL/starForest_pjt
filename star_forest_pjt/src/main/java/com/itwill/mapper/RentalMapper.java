package com.itwill.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.domain.Book;
import com.itwill.domain.Rental;

@Mapper
public interface RentalMapper {
	public Rental updateDate(Rental rental);
	
	public Book selectById(int user_id); //이게 맞나?
	
	public Map<String, Object> selectByNo();
	
	public Rental updateRentalStatus(Rental rental);
	

}
