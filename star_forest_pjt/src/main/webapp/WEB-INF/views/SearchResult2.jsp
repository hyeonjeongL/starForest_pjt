<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="jquery-ui-1.12.1/jquery-ui.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<!-- 구글폰트 전체 기본적용 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap" rel="stylesheet">
<!-- 구글폰트 전체 기본적용 END -->
<link rel="stylesheet" href="css/style.css">
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<title>도서정보 - 별숲도서관</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>
<!-- <script type="text/javascript" src="./js/Search.js"></script> -->
<script type="text/javascript">
	$(document).on('click', '#btn_search', function(e) {

		var param = 'keyword=' + $('input').val() + '&type='+ $('select').val();
		console.log(param);
		$.ajax({
			url : 'getSearchList',
			method : 'GET',
			data : param,
			success : function(bookList) {
				console.log(bookList);
				var html='';
				for(var i=0;i < bookList.length;i++){
					var book = bookList[i];
					console.log(book.book_image_src);
					console.log(book.book_title);
					html+="<div class=\"col-md-3\"><div class=\"card mb-3\">";
					html+="					<div class=\"card-body p-0\">";
					html+="					<a href=\"book_detail?book_no="+book.book_no+"\">";
					html+="					<img class=\"card-image-top img-fluid\" width=\"100%\" alt=\"\" src=\""+book.book_image_src+"\">";
					html+="			</a>";
					html+="				<div class=\"card-body\">";
					html+="				<div class=\"card-title\">";
					html+="						<div class=\"book-title\" id=\"book-title\">"+book.book_title+"</div>";
					html+="				<h6 class=\"book_author\">"+book.book_author+"</h6>";
					html+="			</div>";
					html+="				</div>";
					html+="			</div>";
					html+="		</div>";
					html+="	</div>";
					console.log(html);	
				}
				$('#searchBookList').html(html);
			}
		});
		e.preventDefault();
	});
</script>
<style type="text/css">
/* Lazy Load Styles */
.card-image {
	display: block;
	background: #fff center center no-repeat;
	background-size: cover;
	margin: 0 auto;
	/* filter: blur(3px); /* blur the lowres image */
	*/
}

.card-image>img {
	display: block;
	width: 100%;
	opacity: 0; /* visually hide the img element */
}

.card-image.is-loaded {
	filter: none; /* remove the blur on fullres image */
	transition: filter 1s;
	margin: 0 auto;
}

/* Layout Styles */
.card-list {
	display: block;
	padding: 0;
	font-size: 0;
	text-align: center;
	list-style: none;
	width: 825px;
}

.card-body {
	padding: 0;
}

.card {
	display: inline-block;
	width: 200px;
	height: 250px;
	margin: 1rem;
	font-size: 1rem;
	text-decoration: none;
	overflow: hidden;
	box-shadow: 0 0 3rem -1rem rgba(0, 0, 0, 0.5);
	transition: transform 0.1s ease-in-out, box-shadow 0.1s;
}

.card:hover {
	transform: translateY(-0.5rem) scale(1.0125);
	box-shadow: 0 0.5em 3rem -1rem rgba(0, 0, 0, 0.5);
}

.card-description {
	display: block;
	color: #515151;
	width: 200px;
	height: 100px;
	text-align: center;
}

.card-description>h4 {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-size: large;
	font-weight: bold;
}

.searchResult-body {
	float: left;
	width: 100%;
}

.searchResult-options {
	margin-left: 150px;
	float: left;
	width: 20%;
	text-align: center;
}

.paging {
	margin: 0 auto;
	text-align: center;
	width: 100%;
	float: left;
}

.paging-num {
	margin: 0 10px;
}

.input-group {
	height: 26px;
	padding: 25px 5px 25px 5px;
	border: 1px;
	float: left;
}

.searchResult-body {
	float: left;
}
</style>
<style>
li {
	position: relative;
}

li:hover {
	background: #eee;
}

li>ul.low {
	display: none;
	position: absolute;
	top: 0;
	left: 180px;
}

li:hover>ul.low {
	display: block;
}

li:hover>ul.low li a {
	background: #eee;
	border: 1px solid #eee;
}

li:hover>ul.low li a:hover {
	background: #fff;
}

li>ul.low li {
	width: 180px;
}
</style>
<style>
ul li {
	
}

section#content div.book_image_src img {
	width: 200px;
	height: 200px;
}

section#content div.book_title {
	padding: 10px 0;
	text-align: center;
}

section#content div.book_title a {
	color: #000;
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
							<h2>도서검색</h2>
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
								<h4 class="text-light">도서검색</h4>
							</div>
							<ul class="list-group list-group-flush mb-5">
								<li class="list-group-item active"><a href="SearchResult">도서검색</a></li>
								<li class="list-group-item"><a href="SearchList">전체 도서</a></li>
								<li class="list-group-item"><a href="recommendedBooks">사서추천도서</a></li>
								<li class="list-group-item"><a href="Newbooks">신착도서</a></li>
								<li class="list-group-item"><a href="popularBook">이달의 인기도서</a></li>
							</ul>
						</div>
					</div>
					<!--  -->
					<!-- 메인내용 -->
					<div class="col-md-9">
						<div class="row">
							<form name="f" action="getSearchList">
								<div class="input-group noto-serif">
									<select data-trigger="" name="type" id="type">
										<option selected value="">선택하세요</option>
										<option value="book_title">제목</option>
										<option value="book_author">저자</option>
										<option value="book_publisher">출판사</option>
										<option value="category_name">분야명</option>
									</select>
									<input class="form-control searchbar" id="keyword" name="keyword" type="text" placeholder="검색어를 입력하세요." value="${search.keyword}">
									<div class="input-group-append">
										<button class="btn btn-outline-success btn-r" type="button" id="btn_search">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>도서검색</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</button>
									</div>
								</div>
							</form>
							<br> <br> <br>
							<!-- CARD COLUMNS -->
							<div class="paging"></div>
						</div>
						<div class="row" id="searchBookList">
							<!-- -------------------------------- 
							<div class="col-md-3">
								<div class="card mb-3">
									<div class="card-body p-0">
										<a href="book_detail?book_no=454">
											<img class="card-image-top img-fluid" width="100%" alt="남주의 첫날밤을 가져 버렸다 1.img" src="https://image.aladin.co.kr/product/30197/26/cover200/k912839296_1.jpg">
										</a>
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">남주의 첫날밤을 가져 버렸다 1</div>
												<h6 class="book_author">황도톨(원작),MSG(그림),티바(각색)</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
							
						    -------------------------------- -->
						</div>
					</div>
				</div>
				</div>
		</section>
	</div>
	<!--  -->
	<!-- 페이징처리 -->
	<!-- 페이징처리 -->
	<nav>
		<div class="container mt-5">
			<ul class="pagination justify-content-center">
				<c:if test="${startPage > 1}">
					<li class="page-item"><a class="page-link" id="page-link" href="QnaList.do?pageNUM=${startPage-1 }">&laquo;</a></li>
				</c:if>
				<c:if test="${startPage == 1}">
					<li class="page-item disabled"><a class="page-link" id="page-link" href="QnaList.do?pageNUM=${startPage-1 }">&laquo;</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<li class="page-item" id="page${i }"><a class="page-link" id="page-link" href="QnaList.do?pageNUM=${i }">${i }</a></li>
				</c:forEach>
				<c:if test="${endPage < totalPage}">
					<li class="page-item"><a class="page-link" id="page-link" href="QnaList.do?pageNUM=${endPage+1 }">&raquo;</a></li>
				</c:if>
				<c:if test="${endPage == totalPage}">
					<li class="page-item disabled"><a class="page-link" id="page-link" href="QnaList.do?pageNUM=${endPage+1 }">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
		<div style="clear: both"></div>
	</nav>
	<!-- .footer-navigation -->
	<!-- footer start-->
	<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="common/include_common_bottom_templateVer.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
	<!-- footer end-->
	<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<script>
		// Get the current year for the copyright
		$('#year').text(new Date().getFullYear());

		$('.slider').click({
			infinite : true,
			slideToShow : 1,
			slideToScroll : 1
		});
	</script>
</body>
</html>