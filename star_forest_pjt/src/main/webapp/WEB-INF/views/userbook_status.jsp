<%@page import="com.itwill.domain.Reservation"%>
<%@page import="com.itwill.domain.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
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
<!--  <link rel="stylesheet" href="jquery-ui-1.12.1/jquery-ui.min.css">-->

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
<!-- <script type="text/javascript"
	src="../jquery-ui-1.12.1/jquery-ui.min.js"></script> -->

<script type="text/javascript">
	
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
						<ul class="list-group list-group-flush mb-5">
							<li class="list-group-item"><a href="mypage" id="mypage">마이페이지</a>
							</li>
							<li class="list-group-item"><a href="userbook_status"
								id="userbook_status">나의도서정보</a></li>
							<li class="list-group-item"><a href="user_club_list"
								id="user_club_list">동아리신청내역</a></li>
							<li class="list-group-item"><a href="user_request_list"
								id="user_request_list">희망도서신청내역</a></li>
							<li class="list-group-item active"><a href="favorite"
								id="favorite">내서재</a></li>
							<li class="list-group-item"><a href="user_qr" id="user_qr">나의QR</a></li>

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
										<c:forEach items="${resList}" var="res">
											<tr>
												<td width=50 align=center bgcolor="ffffff" height="20">${resList}</td>
												<td width=50 align=center bgcolor="ffffff" height="20">${map.value}</td>
												<!--  <td width=50 align=center bgcolor="ffffff" height="20">${res}</td>-->
												<td width=50 align=center bgcolor="ffffff" height="20">${map.value[book_title]}</td>
												<td width=50 align=center bgcolor="ffffff" height="20">${r}${map[book_title]}</td>
											</tr>
										</c:forEach>



									</table>
								</form>
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