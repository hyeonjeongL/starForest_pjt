function FavoriteHtmlContents() {
}
FavoriteHtmlContents.favorite_left_menu_content=function(user){
	return `<div class="col-md-3 noto-serif">
					<div class="sidebar">
						<div class="side-head">
							<h4 class="text-light">나의도서</h4>
						</div>
						<ul class="list-group list-group-flush mb-5">
							<li class="list-group-item"><a href="mypage" id="mypage">마이페이지</a>
							</li>
							<li class="list-group-item"><a href="userbook_status"
								id="userbook_status">나의도서정보</a></li>
							<li class="list-group-item"><a href="user_club_list"
								id="user_club_list">동아리신청내역</a></li>
							<li class="list-group-item"><a href="user_request_list"
								id="user_request_list">희망도서신청내역</a></li>
							<li class="list-group-item active"><a href="favorite"
								id="favorite">내서재</a></li>
							<li class="list-group-item"><a href="user_qr" id="user_qr">나의QR</a></li>

						</ul>

					</div>
				</div>
	`;
}

FavoriteHtmlContents.favorite_item_content = function(favorite) {
	return `
					<div class="rentalTable">
						<tr id="favorite_item">
								<td id="favoriteNo">${favorite_no}
								<td class="bookTitle">${favorite.book.book_title}</td>
								<td class="bookAuthor">${favorite.book.book_author}</td>
								<td class="bookPubl">${favorite.book.book_publisher}</td>
								<td>
									<button id="btn_delete" class="w-btn w-btn-delete" type="button">삭제</button>
								</td>
							</tr>
					 </div>					
`;
}

FavoriteHtmlContents.favorite_list_content = function(favoriteArray) {
	return `


					<div class="container">
						<table id="favoriteList" class="table table-hover">
							<tr>
								<th scope="row">No.</th>
								<th scope="row">제목</th>
								<th scope="row">저자</th>
								<th scope="row">출판사</th>
								<th scope="row">작업</th>
							</tr>
							<!--favorite start -->
							 ${
								favoriteArray.map(FavoriteHtmlContents.favorite_item_content).join('')
								}
							<!--favorite end -->

						</table>
					</div>
					<div class="favorite_delete" style="float: right;">
						<button id="btn_all_delete" class="w-btn w-btn-delete" type="button">전체삭제</button>
					</div>

			
`;

}






