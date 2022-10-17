function Search() {
}

Search.cate_join_html = function(bookCateArray) {
	return `
	<div class="row">
		${bookCateArray.map(Search.cate_item_html).join('')}
	</div>	
	`; 
}

Search.cate_item_html = function(cate) {
	return `
					
					
						<!-- -------------------------------->
						<div class="col-md-3">
									<div class="card mb-3">
										<div class="card-body p-0">
											<a href="book_detail?book_no=${cate.book_no}"><img class="card-image-top img-fluid" width="100%" alt="${cate.book_image}" src="${cate.book_image_src}"></a>
											<div class="card-body">
												<div class="card-title">
													<div class="book-title" id="book-title">${cate.book_title}</div>
												</div>
											</div>
										</div>
									</div>
						</div>
						<!-------------------------------- -->
						
					
	`;
	
}



