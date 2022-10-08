<%@page import="com.itwill.domain.BookCategory" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<link rel="stylesheet" href="./css/style.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script type="text/javascript" src="./js/BookClubHtmlContents.js"></script>

<title>나의도서 - 별숲도서관</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
.img-fluid {
	height: 250px;
	width: 244px;
}

.table td {
	border: 1px solid ffffff;
}

.container table tr td {
	text-align: left;
	vertical-align: middle;
	word-break: keep-all;
	padding-right: 3em;
}

#btn_category,.rentalTable{
	font-family: 'Gowun Dodum', sans-serif;
}
</style>



<script type="text/javascript">
	$(function() {
		
		
		/*
		$('#item').html(BookClubHtmlContents.club_item_html);
		$('#content').html(BookClubHtmlContents.club_join_ml);
		$(document).on('click', '#club_join_detail_btn', function(e) {
			$('#content').html(BookClubHtmlContents.club_detail_html);
		});
		$(document).on('click', '#club_join_btn', function(e) {
			alert('동아리신청하기');
		});
		*/
		/********club_list***********/
		$.ajax({
				url:'club_list',
				method:'POST',
				success:function(jsonResult){
					var bookClubArray=jsonResult.data;
						$('#content').html(BookClubHtmlContents.club_join_html(bookClubArray));
				}
			});
		$(document).on('click','#side_bookClub,#menu_bookClub,#btn_all,#btn_list',function(e){
			$.ajax({
				url:'club_list',
				method:'POST',
				success:function(jsonResult){
					var bookClubArray=jsonResult.data;
					$('#content').html(BookClubHtmlContents.club_join_html(bookClubArray));
				}
			});
			e.preventDefault();
		});
		
		/********club_category_list********
		$(document).on('click','#btn_category',function(e){
			var category_no=$("#btn1").val();
			var param='category_no='+category_no;
			
			$.ajax({
				url:'club_select_by_category',
				method:'POST',
				dataType:'json',
				data:param,
				success:function(jsonResult){
					var bookClubArray=jsonResult.data;
					console.log(bookClubArray);
					$('#content').html(BookClubHtmlContents.club_join_html(bookClubArray));
				}
			});
			e.preventDefault();
		});*/
		
		/***********club_detail*************/
		$(document).on('click','.club_item,#btn_detail',function(e){
			var club_no=$(e.target).attr('club_no');
			var param='club_no='+club_no;
			console.log(param);
			$.ajax({
				url:'club_detail',
				method:'POST',
				dataType:'json',
				data:param,
				success:function(jsonResult){
					var club=jsonResult.data[0];
					$('#content').html(BookClubHtmlContents.club_detail_html(club));
					console.log(club);
				}
				
			});
		e.preventDefault();
		});
		/**********club_join(인원수카운트)********/
		$(document).on('click','#btn_join,#btn_club_join',function(e){
			var club_no=$(e.target).attr('club_no');
			var param='club_no='+club_no;
			console.log(param);
			$.ajax({
				url:'club_join',
				method:'POST',
				dataType:'json',
				data:param,
				success:function(jsonResult){
					if(jsonResult.code==-2){
						alert(jsonResult.msg);
					}else if(jsonResult.code==-1){
						alert(jsonResult.msg);
					}else if(jsonResult.code==1){
						alert("신청되었습니다 :)");
						location.reload(); //인원수 카운트 후 새로고침
					}
				}
				
			});
		e.preventDefault();	
			
		});
	
	
	
		
	});
</script>

</head>

<body>
	<!-- navigation start-->
	<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="common/include_common_top_menu_templateVer.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
	<!-- navigation end-->

	<!-- PAGE HEADER -->
	<header id="page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-6 m-auto text-center">
					<h1>도서동아리</h1>
				</div>
			</div>
		</div>
	</header>

	<!-- MAIN SECTION -->
	<!-- 사이드바 -->
	<section id="contact" class="py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-3 noto-serif">
					<div class="sidebar">
						<div class="side-head">
							<h4 class="text-light">커뮤니티</h4>
						</div>
						<ul class="list-group list-group-flush mb-5">
							<li id="side_bookClub" class="list-group-item"><a href="bookclub"
								class="returnAll">도서동아리</a></li>
							<li id="post20" class="list-group-item"><a
								href="postList.do?option=p_title&search=&group=20"
								class="returnAll">창작물게시판</a></li>
							<li id="post30" class="list-group-item"><a
								href="postList.do?option=p_title&search=&group=30"
								class="returnAll">중고장터</a></li>
							<li id="post60" class="list-group-item"><a
								href="postList.do?option=p_title&search=&group=60"
								class="returnAll">자유게시판</a></li>
						</ul>
					</div>
				</div>

				<!-- 메인내용 -->
				<div class="col-md-9">
					<div class="col-6">
						<div class="row">
							<br>
						</div>
						<div class="row" id="item">
						<br>
						
						
							<!-- 동아리신청,상세 -->
							<div class="rentalTable" id="content">
								
									<!-- 동아리신청,상세 -->

							</div>
						</div>
					</div>
					</div>
				</div>
			</div>
	</section>
	<!-- .footer-navigation -->
	<!-- footer start-->
	<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="common/include_common_bottom_templateVer.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
	<!-- footer end-->



<!-- 	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script> -->
<!-- 	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script> -->
	<!-- <script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script> -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
	<!-- <script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<!-- 	<script type="text/javascript"
		src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>
 -->
</body>

</html>