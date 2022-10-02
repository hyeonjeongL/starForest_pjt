package com.itwill.service;

import java.util.List;
import java.util.Map;

import com.itwill.domain.Book;
import com.itwill.domain.Rental;

public interface RentalService {

	/** 대여 시 insert */

	int insertRental(Rental rental);

	/** 대여 기간 연장 */
	int updateDate(String user_id, int book_no);

	/** user_id로 대출 리스트 뽑기 */
	List<Rental> selectById(String user_id);

	/** book_no로 대출유저 리스트 */
	List<Map<String, Object>> selectByNo(int book_no);

	/** 반납했을 때 렌탈테이블 업데이트 (admin) */
	int updateRentalStatus(String user_id, int book_no);

	/** 연체중일 때 status 2(연체)로 변경*/
	int updateRentalStatusOverdue(int rental_no);


}
