function adminContents() {
}
adminContents.admin_total_rental_list_item_content = function(book,i) {
	return `
					
			<tr>
				<th scope="row" style="height:50px;">${i+1}</th>
				<th scope="row">${book.book_title}</th>
				<th scope="row">${book.book_author}</th>
				<th scope="row">${book.book_publisher}</th>
				<th scope="row">${book.category_no}</th>
				<th scope="row">${book.rental.rental_date.substring(0, 10)}</th>
				<th scope="row">${book.rental.return_duedate.substring(0, 10)}</th>
				<th scope="row">${book.rental.user_id}</th>
				<th scope="row"><button  id="btn_admin_return" class="w-btn w-btn-detail" user_id="${book.rental.user_id}">반납</button></th>
			</tr>`
				;
}
adminContents.admin_total_rental_list_content = function(rentalTArray) {
	return `
	<div class="mybook">
			 
					<table class="admintable">
						<thead id=tablehead>
							<tr>
								<th scope="row" style="width:70px; height:60px;">No.</th>
								<th scope="row">제목</th>
								<th scope="row">저자</th>
								<th scope="row">출판사</th>
								<th scope="row">카테고리</th>
								<th scope="row" style="width:120px">대여일</th>
								<th scope="row" style="width:120px">반납예정일</th>
								<th scope="row" style="width:100px">회원ID</th>
								<th scope="row"style="width:80px">반납</th>
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