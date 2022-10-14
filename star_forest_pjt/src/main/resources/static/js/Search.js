Search.list_content = function(SearchArray) {
	return ` 
	${SearchArray.map(Search.list_content).join('')}
	<div class="col-md-9">
            <div class="row">
					<div class="col-md-3">
						<div class="card mb-3">
							<div class="card-body p-0">
								<a href="book_detail?book_no="><img class="card-image-top img-fluid" width="100%" alt="" src=""></a>
								<div class="card-body">
									<div class="card-title">
										<div class="book-title" id="book-title"></div>
										<h6 class="book_author"></h6>
									</div>
								</div>
							</div>
						</div>
					</div>
               </div>
				<!-- CARD COLUMNS -->
				
					
					
            </div>			
				`;
}

Search.__html = function(SearchArray) {
	return `
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
							<br><br>
	
								<div class="rentalTable">
									${SearchArray.map(Search._item_html).join('')
		}
								</div>
								
	`;

}
function getSearchList(){
	$.ajax({
		type: 'GET',
		url : "/getSearchList",
		data : $("form[name=search-form]").serialize(),
		success : function(result){
			//테이블 초기화
			$('#boardtable > tbody').empty();
			if(result.length>=1){
				result.forEach(function(item){
					str='<tr>'
					str += "<td>"+item.idx+"</td>";
					str+="<td>"+item.writer+"</td>";
					str+="<td><a href = '/board/detail?idx=" + item.idx + "'>" + item.title + "</a></td>";
					str+="<td>"+item.date+"</td>";
					str+="<td>"+item.hit+"</td>";
					str+="</tr>"
					$('#boardtable').append(str);
        		})				 
			}
		}
	})
}


function keywordCheck() {
		var str_keyword = window.searchform.keyword.value;
		if (!str_keyword || str_keyword === "") {
			window.alert("검색어를 입력하세요.");
			window.searchform.keyword.focus();
			return false;
		}
		window.searchform.submit();
	}
	
		/* 검색 */
$(function() {
	$('#search').click(function() {
		location.href = "http://localhost/star_forest_pjt/SearchList?query=" + $("#book_title").val();
	})
});

/* 추천도서 누르면 bookDetail 페이지로 이동 */
$(function() {
	$('.card').click(function() {
		location.href = "http://localhost/star_forest_pjt/book_detail?book_no=1&query=" + $(this).find('#book_title').text();
	})
});
