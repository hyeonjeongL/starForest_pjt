package com.itwill.domain;
/*
 이름              널?       유형                
--------------- -------- ----------------- 
SEAT_NO         NOT NULL VARCHAR2(50 CHAR) 
SEAT_DATE                DATE              
SEAT_START_TIME          VARCHAR2(50)      
SEAT_END_TIME            VARCHAR2(50)      
SEAT_STATUS              NUMBER            
USER_ID                  VARCHAR2(100)     
 */

import java.util.Date;

public class SeatReservation {
	public String seat_no;
	public Date seat_date;
	public String seat_start_time;
	public String seat_end_time;
	public int seat_status;
	public String user_id;
	
}
