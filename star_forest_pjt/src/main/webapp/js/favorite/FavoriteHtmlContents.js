function FavoriteHtmlContents() {
}
FavoriteHtmlContents.favorite_item_content = function(favorite) {
	return `<div class="e-item d-md-flex align-items-center">
					<div class="item-no">${favorite.favorite_no}</div>
						<div class="item item-data d-flex">
							<div class="item-cover">
								 <a href="/detail/?cid=CAT000000949038&ctype=m"></a>
							</div>
								<div class="item-meta">
									<div class="item-isbn">
										${favorite.book.isbn}																			</div>
									<div class="item-title">
										<h4><a href="/detail/?cid=CAT000000949038&ctype=m">${favorite.book.book_title}</a></h4>
									</div>
										<div class="item-author">${favorite.book.book_author}</div>
										<div class="item-pub">${favorite.book.book_publisher}</div>
									</div>								
								</div>
						<div class="item-functions">
							<a role="button" class="btn btn-sm btn-primary item-delete-trigger" item-val="234279">삭제</a>
					</div>
			</div><!-- item : 1 -->
`;
}

FavoriteHtmlContents.favorite_list_content = function(favoriteArray) {
	return `
<div class="entry-content">
	
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-9">

					<div class="items-header directory-header d-flex justify-content-lg-between align-items-baseline">
						<h4 class="selected-dir-name">전체</h4>
						<div class="item-count">
							<span class="number">${favorite.length}</span>건						</div>
					</div><!-- .items-header -->
					
					<div class="e-items list">
						
						<div class="e-item item-headings d-none d-xl-flex align-items-center">
							<div class="item-index">번호</div>
							<div class="item-data">ISBN</div>
							<div class="item-data">제목</div>
							<div class="item-data">저자</div>
							<div class="item-data">출판사</div>
							<div class="item-functions">작업</div>
						</div><!-- .item-headings -->

												
						<!--favorite start-->
						${
							favoriteArray.map(favorite_item_content).join('')							
						}
						<!--favorite end-->
												
					</div><!-- .e-items.list -->
			
				</div><!-- .col -->
			</div><!-- .row -->

		</div><!-- .container -->
	</div><!-- .content -->
	
</div><!-- .entry-content -->
`;

}






