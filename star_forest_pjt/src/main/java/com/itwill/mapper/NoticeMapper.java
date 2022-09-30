package com.itwill.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.domain.Notice;

@Mapper
public interface NoticeMapper {
	
	@Insert("insert into notice values(SEQ_notice_notice_no.nextval,#{notice_title},sysdate, #{notice_content},#{notice_image},0)")
	public int create(Notice notice) throws Exception;
	
	@Select("select * from notice order by notice_no asc")
	public List<Notice> selectAll() throws Exception;
	
	@Update("update notice set notice_title=#{notice_title},notice_content=#{notice_content},"
			+ 								"notice_image=#{notice_image} where notice_no=#{notice_no}")
	public int update(Notice notice) throws Exception;
	
	@Update("update notice set notice_readcount=notice_readcount+1")
	public int updateCount() throws Exception;
	
	@Delete("delete from notice where notice_no=#{notice_no}")
	public int delete(int notice_no) throws Exception;
	
	@Select("select count(*) from notice")
	public int noticeCount() throws Exception;
}
