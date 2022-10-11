package com.itwill.mapper;

import java.util.List;




import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.itwill.domain.RequestBoard;
import com.itwill.domain.BookCategory;
import com.itwill.domain.RequestBoardListPageMaker;

@Mapper
public interface RequestBoardMapper {
	
	//게시물생성
	@Insert("insert into request_board values(#{board_no},#{board_title},\r\n"
			+ "									 sysdate,#{board_content},0,'신청접수',#{board_type_no},0,1,\r\n"
			+ "									 SEQ_REQUEST_BOARD_BOARD_NO.currval,#{category_name},#{user_id})")
	@SelectKey(statement = "select SEQ_REQUEST_BOARD_BOARD_NO.nextval from dual",
	   keyColumn = "board_no",
	   keyProperty = "board_no",
	   before = true,
	   resultType = Integer.class
		)
	public int create(RequestBoard requestBoard);
	
	//답글생성
	
	@Insert("insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval ,#{board_title},sysdate,\r\n"
			+ "									 #{board_content},0,#{board_status},2,#{board_depth}+1,#{board_step}+1,\r\n"
			+ "									 #{board_groupno},#{category_name},#{user_id})\r\n")
	public int createReply(RequestBoard requestBoard);
	/*
	@Update("update request_board set board_step = board_step+1 where board_step>#{board_step} and groupno=#{groupno}")
	public int addStep(RequestBoard requestBoard);
	*/
	@Update("update request_board set board_step=board_step+1 where board_groupno=#{board_groupno}")
	public int addStep(RequestBoard requestBoard);
	
	//내가 쓴 게시물들 확인
	@Select("select * \r\n"
			+ "	from request_board\r\n"
			+ "	where user_id = #{user_id}")
	public List<RequestBoard> findUserBoard(String user_id);
	
	//게시물 존재 여부  ..?
	@Select("SELECT count(*) FROM request_board WHERE board_groupno = #{board_groupno} AND board_depth > 0 AND board_step > 1 ORDER BY board_step,board_depth ASC")
	public boolean isExisted(int board_groupno);
	
	
	//게시물 삭제(게시판번호)
	@Delete("delete from request_board where board_no=#{board_no}")
	public int delete(int board_no);
	
	//게시물 삭제(게시판 그룹번호)
	@Delete("delete from request_board where board_groupno=#{board_groupno}")
	public int deleteByGroupno(int board_groupno);
	
	//게시물 수정
	@Update("update request_board set board_title=#{board_title}, board_content=#{board_content},\r\n"
			+ "							 category_name=#{category_name}\r\n"
			+ "							 where board_no=#{board_no}")
	public int update(RequestBoard requestBoard);
	
	//조회수 증가
	@Update("update request_board set board_readcount = board_readcount+1 \r\n"
			+ "	where board_no=#{board_no}")
	public int addReadCount(int board_no);
	
	//게시물 전체 리스트
	@Select("select board_no,board_title,board_date,board_content,board_readcount,board_status,board_type_no,category_name,user_id from\r\n"
			+ "	request_board\r\n"
			+ "	order by board_groupno desc, board_step asc")
	public List<RequestBoard> selectAll();
	
	//카테고리 리스트
	@Select("select * from book_category")
	public List<BookCategory> selectCategoryAll();
	
	//게시물 총 갯수
	@Select("select count(*)\r\n"
			+ "	from request_board")
	public int countAll();
	
	//게시물 상세보기
	@Select("select *\r\n"
			+ "	from request_board\r\n"
			+ "	where board_no=#{board_no}")
	public RequestBoard selectOne(int board_no);
	
	//페이지에 있는 게시물 시작번호 / 끝번호
	@Select("SELECT * FROM\r\n"
			+ "		( SELECT rownum idx, s.*  FROM\r\n"
			+ "				( SELECT board_no, board_title, user_id,board_date,board_readcount,board_groupno,board_step, board_depth FROM request_board\r\n"
			+ "					ORDER BY board_groupno DESC,board_step ASC\r\n"
			+ "				) s\r\n"
			+ "		 )\r\n"
			+ "WHERE idx between #{pageBegin} and #{pageEnd}")
	public List<RequestBoard> list(RequestBoardListPageMaker page);
}
