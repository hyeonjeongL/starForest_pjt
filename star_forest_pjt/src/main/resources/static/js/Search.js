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