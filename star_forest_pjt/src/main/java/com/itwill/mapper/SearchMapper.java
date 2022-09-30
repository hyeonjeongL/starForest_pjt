package com.itwill.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.domain.Search;
//검색 기능
@Mapper
public interface SearchMapper {
	
//제목 검색
	@Select("select * from book where book_title like ?")
	public List<Search> TitleList();

}
