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
	 
	public List<Notice> selectAll(int pageStart, int pageEnd) throws Exception;
	
	@Insert("insert into notice(notice_no,notice_date,notice_readcount,notice_title,notice_content) values(SEQ_notice_notice_no.nextval,sysdate,1,#{notice_title},#{notice_content})")
	public int create(Notice notice) throws Exception;
	
	@Update("update notice set notice_title=#{notice_title},notice_content=#{notice_content} "
			+ "where notice_no=#{notice_no}")
	public int update(Notice notice) throws Exception;
	
	@Update("update notice set notice_readcount=notice_readcount+1 where notice_no=#{notice_no}")
	public int updateCount(int notice_no) throws Exception;
	
	@Delete("delete from notice where notice_no=#{notice_no}")
	public int delete(int notice_no) throws Exception;
	
	@Select("select count(*) from notice")
	public int noticeCount() throws Exception;
	
	@Select("select * from notice where notice_no=#{notice_no}")
	public Notice selectByNo(int notice_no);
	
}
