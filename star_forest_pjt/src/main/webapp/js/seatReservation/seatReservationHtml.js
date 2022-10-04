function seatReservationHtml() {
}
seatReservationHtml.seat_list_content=function(seat) {
	return `
		<div id="A_room">
					<div class="a-deck">
	          		 <p class="card-text">${seat.seat_no}</p>
	                 <p class="card-text">${seat.seat_start_time}</p>
	                 <p class="card-text">${seat.seat_end_time}</p>
	                 <p class="card-text">$${seat.seat_status}</p>
	                 </div>
					<div class="a-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
	                  <div class="a-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
	                 <div class="a-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
	                 <div class="a-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
	                 <div class="a-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
	            </div>
            
            	<div id="B_room">
					<div class="b-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
					<div class="b-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
	                  <div class="b-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
	                 <div class="b-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
	                 <div class="b-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
	                 <div class="b-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
	            </div>
            
            <div id="C_room">
					<div class="c-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
					<div class="c-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
	                  <div class="c-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
	                 <div class="c-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
	                 <div class="c-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
	                 <div class="c-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
	            </div>
             <div id="D_room">
					<div class="d-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
					<div class="d-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
	                  <div class="d-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
	                 <div class="d-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
	                 <div class="d-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
	                 <div class="d-deck">
	          		 <p class="card-text">좌석</p>
	                 <p class="card-text">시작시간</p>
	                 <p class="card-text">종료시간</p>
	                 <p class="card-text">이용중</p>
	                 </div>
	            </div>
		
		`;
}