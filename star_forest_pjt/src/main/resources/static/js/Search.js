function Search() {
}

Search.cate_join_html = function(bookCateArray) {
	return `
	<div class="row">
	<div class="category" id="btn_category">
				            <div>
				             <button type="button" id="btn_all" value="all" style="width:50px" >전체</button>
				             <button type="button" id="btn1" value="100" style="width:130px">건강/취미/레저</button>
				             <button type="button" id="btn1" value="200" style="width:80px">경제경영</button>
				             <button type="button" id="btn1" value="300" style="width:50px">고전</button>
				             <button type="button" id="btn1" value="400" style="width:50px">과학</button> 
				             <button type="button" id="btn1" value="500" style="width:50px">만화</button>
				             <button type="button" id="btn1" value="600" style="width:85px">사회과학</button>
				             <button type="button" id="btn1" value="700" style="width:120px">소설/시/희곡</button>
				             <br>
				        </div>
				        </div>
							<br><br><br>	
	
								<div id="searchAllList">
									${bookCateArray.map(Search.cate_item_html).join('')
		}
								</div>
							
									
									
							`;
}

Search.cate_item_html = function(cate) {
	return `
	<div id="searchAllList" class="row">
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
					</div>
	
	
	`;
	
}



