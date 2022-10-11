function UserBookHtmlContents() {
}
UserBookHtmlContents.user_rental_item_content = function(book) {
	return `
	
	<tr>
				<th scope="row">${book.book_no}</th>
				<th scope="row">${book.book_title}</th>
				<th scope="row">${book.book_author}</th>
				<th scope="row">${book.book_publisher}</th>
				<th scope="row">${book.category_no}</th>
				<th scope="row">${book.rental.rental_date.substring(0, 10)}</th>
				<th scope="row">${book.rental.return_duedate.substring(0, 10)}</th>
				<th scope="row">${book.rental.return_date}</th>
			</tr>`;
}
UserBookHtmlContents.user_rental_list_content = function(rentalArray) {
	return `
			
	<div class="mybook">
			
			</div>
					<table class="table">
						<thead>
							<tr>
								<th scope="row">No.</th>
								<th scope="row">제목</th>
								<th scope="row">저자</th>
								<th scope="row">출판사</th>
								<th scope="row">카테고리</th>
								<th scope="row">대여일</th>
								<th scope="row">반납예정일</th>
								<th scope="row">반납일자</th>
							</tr>
						</thead>
						<tbody>
							<!-- rentalList start -->
								${rentalArray.map(UserBookHtmlContents.user_rental_item_content).join('')
		}
							
							<!-- rentalList end -->
						</tbody>
					</table>
				`;
}

UserBookHtmlContents.user_now_rental_item_content = function(book) {
	return `
	
	<tr>
				<th scope="row">${book.book_no}</th>
				<th scope="row">${book.book_title}</th>
				<th scope="row">${book.book_author}</th>
				<th scope="row">${book.book_publisher}</th>
				<th scope="row">${book.book_page}</th>
				<th scope="row">${book.category_no}</th>
				<th scope="row">${book.rental.rental_date.substring(0, 10)}</th>
				<th scope="row">${book.rental.return_duedate.substring(0, 10)}</th>
			</tr>`;
}
UserBookHtmlContents.user_now_rental_list_content = function(rentalArray) {
	return `
			
	<div class="mybook">
			
			</div>
					<table class="table">
						<thead>
							<tr>
								<th scope="row">No.</th>
								<th scope="row">제목</th>
								<th scope="row">저자</th>
								<th scope="row">출판사</th>
								<th scope="row">페이지수</th>
								<th scope="row">카테고리</th>
								<th scope="row">대여일</th>
								<th scope="row">반납예정일</th>
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

function user_list_item_content(resList){
	return`<tr>
												<td width=50 align=center bgcolor="ffffff" height="20">${1}</td>
												<td width=300 align=center bgcolor="ffffff" height="20">${resList.BOOK_TITLE}</td>
												<td width=50 align=center bgcolor="ffffff" height="20">${resList.BOOK_AUTHOR}</td>
												<td width=50 align=center bgcolor="ffffff" height="20">${resList.ISBN}</td>
												<td width=50 align=center bgcolor="ffffff" height="20">${resList.RES_DATE.substring(0, 10)}</td>
											</tr>
`;
}

UserBookHtmlContents.user_reservation_list_html=function(resList){
	return `<form name="f" method="POST">

									<table border="0" cellpadding="0" cellspacing="1" width="590"
										bgcolor="BBBBBB">
										<tr>
											<td width=50 align=center bgcolor="E6ECDE" height="22">번호</td>
											<td width=300 align=center bgcolor="E6ECDE">책제목</td>
											<td width=120 align=center bgcolor="E6ECDE">저자</td>
											<td width=120 align=center bgcolor="E6ECDE">ISBN</td>
											<td width=120 align=center bgcolor="E6ECDE">예약일시</td>
										</tr>
											<!--requestBoard start-->
												${
													resList.map(user_list_item_content).join('')
												}
											<!--requestBoard end-->



									</table>
								</form>`;
	}