<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon/star.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<link rel="stylesheet" href="./css/style.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="./js/Search.js"></script>

<title>도서정보 - 별숲도서관</title>
<script type="text/javascript">
	/********all list***********/
	$.ajax({
		url : 'book_list',
		method : 'GET',
		success : function(jsonResult) {
			var bookCateArray = jsonResult.data;
			$('#content').html(Search.cate_join_html(bookCateArray));
		}
	});
	$(document).on('click', '#side_book,#btn_all', function(e) {
		$.ajax({
			url : 'book_list',
			method : 'GET',
			success : function(jsonResult) {
				var bookCateArray = jsonResult.data;
				$('#content').html(Search.cate_join_html(bookCateArray));
			}
		});
		e.preventDefault();
	});

	/********category_list********/
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
				$('#content').html(Search.cate_join_html(bookCateArray));
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
						<div class="row">
							<div class="category" id="btn_category">
							</div>
						</div>
						<br> <br> <br>

						<div class="searchAllList" id="content">
						<!-- -------------------------------->

						<!-------------------------------- -->
						</div>
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