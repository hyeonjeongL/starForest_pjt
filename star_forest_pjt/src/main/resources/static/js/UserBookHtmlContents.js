function UserBookHtmlContents() {
}
UserBookHtmlContents.user_rental_item_content = function(book) {
	return `
	
	<tr>
				<th scope="row">${book.book_no}</th>
				<th scope="row">${book.book_title}</th>
				<th scope="row">${book.book_author}</th>
				<th scope="row">${book.book_publisher}</th>
				<th scope="row">${book.book_page}</th>
				<th scope="row">${book.category_no}</th>
				<th scope="row">${book.rental.rental_date.substring(0, 10)}</th>
				<th scope="row">${book.rental.return_date.substring(0, 10)}</th>
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
								<th scope="row">페이지수</th>
								<th scope="row">카테고리</th>
								<th scope="row">대여일</th>
								<th scope="row">반납일</th>
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