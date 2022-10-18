<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
   <!-- 구글폰트 전체 기본적용 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap" rel="stylesheet">
	<link rel="icon" type="image/png" sizes="16x16"
	href="favicon/star.png">
	<!-- 구글폰트 전체 기본적용 END -->
   <link rel="stylesheet" href="css/style.css">
   <link rel="stylesheet" href="css/faq.css">
   <script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script type="text/javascript" src="./js/Search.js"></script>
<script type="text/javascript"   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<title>도서정보 - 별숲도서관</title>
<script type="text/javascript">
	/********all list***********/
$(function(){
	
	
	var param = 'category_no=900&pageNum=1&amount=10';
	$.ajax({
		url : 'search_list_json',
		method : 'GET',
		data:param,
		success : function(jsonResult) {
			var bookCateArray = jsonResult.data;
			$('#searchAllList').html(Search.cate_join_html(bookCateArray));
		}
		
	});
	
});	
	
	
	$(document).on('click', '#side_book , .btn_category_search', function(e) {
		const category_no=$(e.target).attr('value');
		console.log(">>>>>>>>>>>>>>>"+category_no);
		if(category_no==null||category_no=='')category_no=900;
		
		var param = "category_no="+category_no+"&pageNum=1&amount=10";
		$.ajax({
			url : 'search_list_json',
			method : 'GET',
			data:param,
			success : function(jsonResult) {
				var bookCateArray = jsonResult.data;
				$('#searchAllList').html(Search.cate_join_html(bookCateArray));
			}
		});
		e.preventDefault();
	});

	/********category_list*******
	$(document).on('click', '#btn1', function(e) {
		var param = 'category_no=' + $(e.target).attr('value');

		$.ajax({
			url : 'search_category',
			method : 'POST',
			dataType : 'json',
			data : param,
			success : function(jsonResult) {
				var bookCateArray = jsonResult.data;
				console.log(bookCateArray);
				$('#searchAllList').html(Search.cate_join_html(bookCateArray));
			}
		});
		e.preventDefault();
	});
	*/
	/********페이징********/
	
	/***********************************************
	function book_list_json(param){
	console.log(param)	   
	$.ajax({
				url:'search_list_json',
				method:'GET',
				data:param,
				success:function(jsonResult){
					var bookCateArray = jsonResult.data;
					var pageArray = jsonResult.pageMaker[0];
					console.log(jsonResult);
					$('#searchAllList').html(cate_list_content(bookCateArray,pageArray));
					//$('#page_wrap').html(pageArray);
				}
			});
	}
	
		
	$(document).on('click', '#side_book,#btn_all', function(e) {
		$.ajax({
			url : 'search_list_json',
			method : 'GET',
			success : function(jsonResult) {
				var bookCateArray = jsonResult.data;
				var pageArray = jsonResult.pageMaker[0];
				$('#searchAllList').html(cate_list_content(bookCateArray,pageArray));
			}
		});
		e.preventDefault();
	});

	
	$(document).on('click', '#btn1', function(e) {
		var param = 'category_no=' + $(e.target).attr('value');

		$.ajax({
			url : 'search_category',
			method : 'POST',
			dataType : 'json',
			data : param,
			success : function(jsonResult) {
				var bookCateArray = jsonResult.data;
				console.log(bookCateArray);
				var pageArray = jsonResult.pageMaker[0];
				$('#searchAllList').html(cate_list_content(bookCateArray,pageArray));
			}
		});
		e.preventDefault();
	});*/
	
</script>
<style type="text/css">


	.card-body.p-0 img{
	width:170px;
	height:220px;
	}
	
	
.card {
	display: inline-block;
	width:170px;
	height:220px;
	margin: 1rem;
	font-size: 1rem;
}




</style>


</head>
<body class="d-flex flex-column">
	
	<div id="page-content">
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="common/include_common_top_menu_templateVer.jsp" />
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- PAGE HEADER -->
		<header id="page-header" class="noto-serif">
			<div class="page-header-overlay">
				<div class="container pt-5">
					<div class="row">
						<div class="col-md-6 m-auto text-center">
							<h2>전체 도서</h2>
						</div>
					</div>
				</div>
			</div>
		</header>

		<!-- MAIN SECTION -->
		<section id="contact" class="py-3">
			<div class="container">
				<div class="row">
					<!-- 사이드바 -->
					<div class="col-md-3 noto-serif mb-3">
						<div class="sidebar">
							<div class="side-head">
								<h4 class="text-light">전체 도서</h4>
							</div>
							<ul class="list-group list-group-flush mb-5">
								<li class="list-group-item"><a href="SearchResult2">도서검색</a></li>
								<li class="list-group-item active" id="side_book"><a href="SearchList">전체 도서</a></li>
								<li class="list-group-item"><a href="recommendedBooks">사서추천도서</a></li>
								<li class="list-group-item"><a href="Newbooks">신착도서</a></li>
								<li class="list-group-item"><a href="popularBook">이달의
										인기도서</a></li>
							</ul>
						</div>
					</div>

					<!--  -->
					<!-- 메인내용 -->
					<div class="col-md-9">
						<div class="row col-md-12">
							<div class="category" id="btn_category">
								 <button type="button" id="btn1"  class="btn_category_search" value="900" style="width:50px" >전체</button>
					             <button type="button" id="btn1"  class="btn_category_search" value="100" style="width:130px">건강/취미/레저</button>
					             <button type="button" id="btn1" class="btn_category_search" value="200" style="width:80px">경제경영</button>
					             <button type="button" id="btn1" class="btn_category_search" value="300" style="width:50px">고전</button>
					             <button type="button" id="btn1" class="btn_category_search" value="400" style="width:50px">과학</button> 
					             <button type="button" id="btn1" class="btn_category_search" value="500" style="width:50px">만화</button>
					             <button type="button" id="btn1" class="btn_category_search" value="600" style="width:85px">사회과학</button>
				             	<button type="button" id="btn1" class="btn_category_search" value="700" style="width:120px">소설/시/희곡</button>
				             	<br>
				        	</div>
						</div>
					   <div id="searchAllList">
						<!-- -------------------------------->
						
						<!-------------------------------- -->
					   </div>
					   
					   
					<!-------------페이징------------------- -->
					<div class="page_area">
	
					<ul id="page">
					</ul>
               		
		</div>
				</div>
			</div>
		</section>
	</div>

	<!--  -->
	<!-- .footer-navigation -->
	<!-- footer start-->
	<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="common/include_common_bottom_templateVer.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
	<!-- footer end-->

</body>
</html>