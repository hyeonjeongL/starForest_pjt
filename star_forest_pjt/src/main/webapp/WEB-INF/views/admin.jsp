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
<link rel="stylesheet" href="./css/yeji.css">
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
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
<<<<<<< HEAD
<script type="text/javascript" src="./js/adminContents.js"></script>
<script type="text/javascript">
/*********도서관 총 대출 리스트***********/
$(function(){
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
=======
>>>>>>> branch 'master' of https://github.com/2022-05-JAVA-DEVELOPER/final-project-team2-xxx.git

<<<<<<< HEAD
$(document).on('click','#btn_admin_return',function(e){
	$.ajax({
		url:'rest_return',
		method:'POST',
		dataType:'json',
		data:'book_no='+$(e.target).attr("book_no"),
		success:function(jsonResult){
			if(jsonResult.code==1){
				var rentalTArray=jsonResult.data;
				console.log(user_id, book_no);
				alert("반납처리 되었습니다.");
			}else if(jsonResult.code==2){
				alert(jsonResult.msg);
			}
		}
	});
	e.preventDefault();
});
})
=======
<script type="text/javascript">
	
>>>>>>> branch 'master' of https://github.com/2022-05-JAVA-DEVELOPER/final-project-team2-xxx.git
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
						<h2>나의도서정보</h2>
					</div>
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
							<h4 class="text-light">나의도서</h4>
						</div>
						<ul class="list-group list-group-flush mb-5"  id="menu">
							<li class="list-group-item">
								<a href="" id="btn_mypage" >어드민</a>
								<ul class='submenu'>
									<li><a href="MyPage_Folder" id="side_mypage">내정보</a></li>
									<li><a href=MyPage_Info id="side_update">개인정보변경</a></li>
								</ul>
							</li>
							<li class="list-group-item">
								<a href="#"  id="side_userbook_status">나의도서정보</a>
								<ul class='submenu'>
									<li><a href="#" id="side_userbook_status">대출현황</a></li>
									<li><a href="#" id="side_reservation">예약현황</a></li>
									<li><a href="#" id="side_now_userbook_status">현재대출현황</a></li>
								</ul>
							</li>
								
							<li class="list-group-item">
								<a href="MyPage_Folder" id="side_user_club">동아리신청내역</a></li>
							<li class="list-group-item">
								<a href="MyPage_Folder" id="side_user_request_list">희망도서신청내역</a></li>
							<li class="list-group-item">
								<a href="MyPage_Folder" id="side_favorite">내서재</a></li>
							<li class="list-group-item">
								<a href="MyPage_Folder" id="side_user_qr">나의QR</a></li>

					</ul>
					</div>
				</div>

				<!-- 메인내용 -->
				<div class="col-md-9">
					<div class="p-4">
						<div class="mypage">
							<ul class="nav nav-tabs mypage-tabs">

								<li class="nav-item"><a class="nav-link active" href="#">대출현황</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">예약현황</a>
								</li>

							</ul>

						</div>
						<div class="rentalTable">
						<!-- 대여리스트 -->
<<<<<<< HEAD
						<div class="col-md-9">
					<div class="col-6">
						<div class="row">
							<br>
						</div>
						<div class="row" id="item">
						<br>
							<button  id="btn_write_form" class="w-btn w-btn-detail" >게시글 작성</button><br>
						
							<!-- 도서관 대여 리스트 -->
							<div class="listTable" id="content" >
							
							<!-- 도서관 대여 리스트 -->
=======
						<form name="f" method="post">

									<table border="0" cellpadding="0" cellspacing="1" width="590"
										bgcolor="BBBBBB">
										<tr>
											<td width=50 align=center bgcolor="E6ECDE" height="22">번호</td>
											<td width=300 align=center bgcolor="E6ECDE">책제목</td>
											<td width=120 align=center bgcolor="E6ECDE">저자</td>
											<td width=120 align=center bgcolor="E6ECDE">ISBN</td>
											<td width=120 align=center bgcolor="E6ECDE">예약일시</td>
										</tr>
										<c:forEach items="${resList}" var="res" varStatus="status">
											<tr>
												<td width=50 align=center bgcolor="ffffff" height="20">${status.count}</td>
												<td width=300 align=center bgcolor="ffffff" height="20">${res.BOOK_TITLE}</td>
												<td width=50 align=center bgcolor="ffffff" height="20">${res.BOOK_AUTHOR}</td>
												<td width=50 align=center bgcolor="ffffff" height="20">${res.ISBN}</td>
												<td width=50 align=center bgcolor="ffffff" height="20">${res.RES_DATE}</td>
											</tr>
										</c:forEach>



									</table>
								</form>
>>>>>>> branch 'master' of https://github.com/2022-05-JAVA-DEVELOPER/final-project-team2-xxx.git
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