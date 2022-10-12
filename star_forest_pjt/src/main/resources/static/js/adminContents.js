function adminContents() {
}
adminContents.admin_total_rental_list_item_content = function(book,i) {
	return `
					
	<tr>
				<th scope="row">${i+1}</th>
				<th scope="row">${book.book_title}</th>
				<th scope="row">${book.book_author}</th>
				<th scope="row">${book.book_publisher}</th>
				<th scope="row">${book.category_no}</th>
				<th scope="row">${book.rental.rental_date.substring(0, 10)}</th>
				<th scope="row">${book.rental.return_duedate.substring(0, 10)}</th>
				<th scope="row">${book.rental.return_date}</th>
				<th scope="row">${book.rental.user_id}</th>
			</tr>`
				;
}
adminContents.admin_total_rental_list_content = function(rentalTArray) {
	return `
	<div class="mybook">
			 
					<table class="table">
						<thead>
							<tr>
								<th scope="row" style="width:20px">No.</th>
								<th scope="row">제목</th>
								<th scope="row">저자</th>
								<th scope="row">출판사</th>
								<th scope="row">카테고리</th>
								<th scope="row" style="width:130px">대여일</th>
								<th scope="row">반납예정일</th>
								<th scope="row">반납일자</th>
								<th scope="row">회원ID</th>
							</tr>
						</thead>
						<tbody>
							<!-- rentalList start -->
								${rentalTArray.map(adminContents.admin_total_rental_list_item_content).join('')
		}
							
							<!-- rentalList end -->
						</tbody>
					</table>
				`;
}