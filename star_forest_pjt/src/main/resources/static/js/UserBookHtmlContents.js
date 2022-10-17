function UserBookHtmlContents() {
}
UserBookHtmlContents.user_rental_item_content = function(book,i) {
	return `
					
	<tr>
				<th scope="row">${i+1}</th>
				<th scope="row"><a href="book_detail?book_no=${book.book_no}">${book.book_title}</a></th>
				<th scope="row">${book.rental.rental_date.substring(0, 10)}</th>
				<th scope="row">${book.rental.return_duedate.substring(0, 10)}</th>
				<th scope="row">${(book.rental.return_date!=null)?book.rental.return_date.substring(0, 10):'미반납'}</th>
			</tr>
			`
				;
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function numberWithCommas(x) {
    return x.toLoaclString();
}
UserBookHtmlContents.user_rental_list_content = function(rentalArray) {
	return `
						<h3>대출현황</h3>
	<div class="mybook">
			 
					<table class="tableList">
						<thead>
							<tr>
								<th scope="row" style="width:20px">No.</th>
								<th scope="row">제목</th>
								<th scope="row" style="width:150px">대여일</th>
								<th scope="row" style="width:150px">반납예정일</th>
								<th scope="row" style="width:150px">반납일자</th>
							</tr>
						</thead>
						<tbody>
							<!-- rentalList start -->
								${rentalArray.map(UserBookHtmlContents.user_rental_item_content).join('')}
							<!-- rentalList end -->
						</tbody>
					</table>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<table>
					<div class="count_wrap"> 
					나의 마음의 양식은<span class="count"">
					${
						function(){
							var weight=0;
							var finalweight=0;
							for(var i=0; i<rentalArray.length; i++){
								weight =rentalArray[i].book_page;
								finalweight+=weight;
							}
							
							return finalweight;
							}()
							
					}
					</span>쪽입니다
					</div>
					</table>
				`;
}

UserBookHtmlContents.user_now_rental_item_content = function(book,i) {
	return `
	
	<tr>
				<th scope="row">${i+1}</th>
				<th scope="row"><a href="book_detail?book_no=${book.book_no}">${book.book_title}</a></th>
				<th scope="row">${book.book_author}</th>
				<th scope="row" style="width:130px">${book.rental.rental_date.substring(0, 10)}</th>
				<th scope="row" style="width:130px">${book.rental.return_duedate.substring(0, 10)}</th>
				<th scope="row"><button id="btn_extend_rental" class="w-btn w-btn-detail" book_no="${book.book_no}">연장</button></th>
			</tr>`;
}
UserBookHtmlContents.user_now_rental_list_content = function(rentalArray) {
	return `
	<h3>현재 대출 리스트</h3>
			
			</div>
					<table class="tableList" width="100%">
						<thead>
							<tr>
								<th scope="row">No.</th>
								<th scope="row" >제목</th>
								<th scope="row">저자</th>
								<th scope="row" style="width:150px">대여일</th>
								<th scope="row" style="width:150px">반납예정일</th>
								<th scope="row">대출연장</th>
							</tr>
						</thead>
						<tbody>
							<!-- rentalList start -->
								${rentalArray.map(UserBookHtmlContents.user_now_rental_item_content).join('')
		}
							
							<!-- rentalList end -->
						</tbody>
					</table>
				`;
}

function user_list_item_content(resList,i){
	return`
			<tr>
				<th scope="row">${i+1}</th>
				<th scope="row">${resList.ISBN}</th>
				<th scope="row"><a href="book_detail?book_no=${resList.BOOK_NO}">${resList.BOOK_TITLE}</a></th>
				<th scope="row">${resList.BOOK_AUTHOR}</th>
				<th scope="row">${resList.RES_DATE.substring(0, 10)}</th>
			</tr>
	
	
`;
}

UserBookHtmlContents.user_reservation_list_html=function(resList){
	return `
	<h3>예약현황</h3>
			<div class="mybook">
			 
					<table class="tableList" width="100%">
						<thead>
							<tr>
								<th scope="row" style="width:20px">No.</th>
								<th scope="row">ISBN</th>
								<th scope="row">제목</th>
								<th scope="row" >저자</th>
								<th scope="row"style="width:150px">예약일시</th>
								<th scope="row" >대출가능여부</th>
							</tr>
						</thead>
						<tbody>
							<!-- rentalList start -->
								${resList.map(user_list_item_content).join('')}
							
							<!-- rentalList end -->
						</tbody>
					</table>
	
	`;
	}