function FavoriteHtmlContents() {
}

FavoriteHtmlContents.favorite_item_content = function(favorite,i) {
	return `
					<div class="rentalTable">
						<tr id="favorite_item">
								<td id="favoriteNo">${i+1}
								<td class="bookTitle">${favorite.book.book_title}</td>
								<td class="bookAuthor">${favorite.book.book_author}</td>
								<td class="bookPubl">${favorite.book.book_publisher}</td>
								<td>
									<button id="btn_delete" class="w-btn w-btn-delete" type="button" favorite_no="${favorite.favorite_no}">삭제</button>
								</td>
							</tr>
					 </div>					
`;
}

FavoriteHtmlContents.favorite_list_content = function(favoriteArray) {
	return `
<h2>&nbsp내서재</h2>

					<div class="container">
						<table id="favoriteList" class="tableList">
						<thead>
							<tr>
								<th scope="row">No.</th>
								<th scope="row">제목</th>
								<th scope="row">저자</th>
								<th scope="row">출판사</th>
								<th scope="row">작업</th>
							</tr>
							</thead>
							<!--favorite start -->
							 ${
								favoriteArray.map(FavoriteHtmlContents.favorite_item_content).join('')
								}
							<!--favorite end -->

						</table>
					</div>
					<div class="favorite_delete" style="float: right;">
					${(favoriteArray.length!=0)?'<button id="btn_all_delete" class="w-btn w-btn-delete" type="button">전체삭제</button>':''}
						
					</div>

			
`;

}






