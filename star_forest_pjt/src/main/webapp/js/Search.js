


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
		location.href = "http://localhost/star_forest_pjt/detailBook.?b_no=1&query=" + $(this).find('#book_title').text();
	})
});
