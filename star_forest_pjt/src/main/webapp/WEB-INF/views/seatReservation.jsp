<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

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
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<!-- 구글폰트 전체 기본적용 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap"
	rel="stylesheet">
<!-- 구글폰트 전체 기본적용 END -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/BookCart.css">
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon/favicon-16x16.png">
<title>도서정보 - 딜리브러리</title>


<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"
	src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript">
	$(function() {

		$(document).ready(function() {
			var zindex = 10;

			$("div.card").click(function(e) {
				e.preventDefault();

				var isShowing = false;

				if ($(this).hasClass("show")) {
					isShowing = true
				}

				if ($("div.cards").hasClass("showing")) {
					// a card is already in view
					$("div.card.show").removeClass("show");

					if (isShowing) {
						// this card was showing - reset the grid
						$("div.cards").removeClass("showing");
					} else {
						// this card isn't showing - get in with it
						$(this).css({
							zIndex : zindex
						}).addClass("show");

					}

					zindex++;

				} else {
					// no cards in view
					$("div.cards").addClass("showing");
					$(this).css({
						zIndex : zindex
					}).addClass("show");

					zindex++;
				}

			});
		});
		/* 추천도서 누르면 bookDetail 페이지로 이동 */
		$(function() {
			$('.card_image-holder')
					.click(
							function() {
								location.href = "http://localhost:8088/detailBook.do?b_no=1&query="
										+ $(this).find('#book-title').text();
							})
		});

	});
</script>

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
							<h2>열람실예약</h2>
						</div>
					</div>
				</div>
			</div>
		</header>

		<!-- MAIN SECTION -->
		<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">좌석배정</h3>
				</div>
				<div class="box-body">

					<table class="table table-bordered">
						<tr>
							<th style="width: 10px">번호</th>
							<th>좌석</th>
							<th>회원</th>
							<th>좌석배정일</th>
							<th>시작시간</th>
							<th>종료시간</th>
						</tr>

						<c:forEach items="${list}" var="seatReservation">

							<tr>

								<td>${seatReservation.seat_no}</td>
								<td>${seatVO.seat_nm}</td>
								<td>${seatVO.mem_nm}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${seatVO.seat_aloc_dd}" /></td>
								<td><fmt:formatDate pattern="HH:mm"
										value="${seatVO.seat_aloc_strt_tm}" /></td>
								<td><fmt:formatDate pattern="HH:mm"
										value="${seatVO.seat_aloc_end_tm}" /></td>

							</tr>

						</c:forEach>

					</table>
</html>