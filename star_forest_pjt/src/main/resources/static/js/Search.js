function Search() {
}
Search.cate_join_html = function(bookArray,pageMaker) {
	return `

	
	<div class="row">
	
		${bookArray.map(Search.cate_item_html).join('')}
	</div>	
	`; 
}

Search.cate_item_html = function(book) {
	return `
					
					
						<!-- -------------------------------->
						<div class="col-md-3">
									<div class="card mb-3">
										<div class="card-body p-0">
											<a href="book_detail?book_no=${book.book_no}"><img class="card-image-top img-fluid" width="100%" alt="${book.book_image}" src="${book.book_image_src}"></a>
											<div class="card-body">
												<div class="card-title">
													<div class="book-title" id="book-title">${book.book_title}</div>
												</div>
											</div>
										</div>
									</div>
						</div>
						<!-------------------------------- -->
						
					
	`;
	
}



/*function cate_list_content(bookCateArray,pageArray) {
	return `
	<div class="row">
		${bookCateArray.map(Search.cate_item_html).join('')}
	</div>	
	
  	  	
		<div class="page_area">
	
					<ul id="page">
				 		
				 		
				 		<!-- 이전페이지 버튼 -->
				 		${
							function(){
								var prev = pageArray.prev;
								var html='';
								if(prev){
									html=`<li class="page_btn_prev"><a href="SearchList?pageNum=${pageArray.startPage-1}" pageNum=${pageArray.startPage-1}>Prev</a></li>`
								}
								return html;
							}()
						}
                    	${
							function(){
								var html='';	
							 	for(var i=pageArray.startPage;i <= pageArray.endPage;i++){
							 		html+=`<li class="page_btn ${pageArray.cri.pageNum == i ? 'active':'' }"><a href="SearchList?pageNum=${i}" pageNum=${i}>${i}</a></li>`;
								}							
								return html;
							}()
	                    }
	                    
	                     <!-- 다음페이지 버튼 -->${
							function(){
								var next = pageArray.next;
								var html='';
								if(next){
									html=`<li class="page_btn_next"><a href="SearchList?pageNum=${pageArray.endPage + 1 }" pageNum=${pageArray.endPage+1}>Next</a></li>`
								}
								return html;
							}()
						}
	                    
	                    
               		</ul>
               		
		</div>
		
	`; 
}
*/



