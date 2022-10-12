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
	<!-- top 메뉴 css -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/yeji.css">
<link rel="stylesheet" href="./css/admin.css">
<title>나의도서 - 별숲도서관</title>
<style>
.img-fluid {
	height: 250px;
	width: 244px;
}
</style>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"
	src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="./js/adminContents.js"></script>
<script type="text/javascript">
/*********도서관 총 대출 리스트***********/
$(document).on('click','#admin_return',function(e){
	$.ajax({
		url:'total_rental_list',
		method:'POST',
		dataType:'json',
		success:function(jsonResult){
			if(jsonResult.code==1){
				var rentalTArray=jsonResult.data;
				$('.listTable').html(adminContents.admin_total_rental_list_content(rentalTArray));
			}else if(jsonResult.code==2){
				alert(jsonResult.msg);
			}
		}
	});
	e.preventDefault();
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
	<header id="page-header" class="noto-serif">
		<div class="page-header-overlay">
			<div class="container pt-5">
				<div class="row">
					<div class="col-md-6 m-auto text-center">
						<h2>어드민</h2>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- MAIN SECTION -->
	<!-- 사이드바 -->
	<!-- <section id="contact" class="py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-3 noto-serif">
					<div class="sidebar">
						<div class="side-head">
							<h4 class="text-light">어드민</h4>
						</div>
						<ul class="list-group list-group-flush mb-5"  id="menu">
							<li class="list-group-item">
								<a href="" id="admin_return" >도서 반납</a>
							</li>
							<li class="list-group-item">
								<a href="#"  id="side_userbook_status">신착도서 입력</a>
							</li>
								
					</ul>
					</div>
				</div> -->

				<!-- 메인내용 -->
						<div class="rentalTable">
						<!-- 대여리스트 -->
						<div class="col-md-9">
					<div class="col-6">
						<div class="row">
							<br>
						</div>
						<div class="row" id="item">
						<br>
							<button  id="btn_write_form" class="w-btn w-btn-detail">게시글 작성</button><br>
						
							<!-- 동아리신청,상세 -->
							<div class="listTable" id="content">
							
								<!-- 동아리신청,상세 -->
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




</body>

</html>