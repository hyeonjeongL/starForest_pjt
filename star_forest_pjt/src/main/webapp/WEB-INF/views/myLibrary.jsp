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
<link rel="stylesheet" href="jquery-ui-1.12.1/jquery-ui.min.css">

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
<link rel="stylesheet" href="css/style.css">
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

<script type="text/javascript" src="js/MyLibraryHtmlContents.js"></script>
<script type="text/javascript">
	/************로딩시세션체크*********/
	$.ajax({//도서정보 클릭 시 바로 세션확인
		url : 'user_session_check',
		method : 'POST',
		dataType : 'json',
		success : function(jsonResult) {
			if (jsonResult.code == 1) {
				$('.col-md-3 noto-serif') //세션이 존재할경우 도서정보 메인화면 보여줌
						.html(MyLibraryHtmlContents
										.mylibrary_left_menu_content(jsonResult.data[0]));
				$('#content').html(MyLibraryHtmlContents.mylibrary_main_content());
			}else{ //세션 존재하지 않을경우 메세지창보여줌
				alert('로그인이 필요한 페이지입니다:)');
			}
		}
	});

	/*********************favorite(내서재)**********************/

	/*-------내서재 등록-------[bookDetail쪽으로 옮기기]*/
	
	
	/*-------내서재목록---------*/
	$(document).on('click','#user_favorite',function(e){
		$.ajax({
			url:'favorite_list',
			method:'POST',
			success:function(jsonResult){
				var favoriteArray=jsonResult.data;
				$('#content').html(favorite_list_content(favoriteArray));
			}
		});
		e.preventDefault();
	});
	
	/*-------내서재전체삭제---------*/
	${document}.on('click','#btn_all_delete',function(e){
		
	});
	
	
	/*-------내서재개별삭제---------*/
	
	
	
	
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
					<h1>나의도서</h1>
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
							<li class="list-group-item">
								<a href="#" id="mypage">마이페이지</a>
							</li>
							<li class="list-group-item">
								<a href="#" id="user_rental_list">나의도서정보</a>
							</li>
							<li class="list-group-item">
								<a href="#" id="user_rental_status">대출현황</a>
							</li>
							<li class="list-group-item">
								<a href="#" id="user_res_status">예약현황</a>
							</li>
							<li class="list-group-item">
								<a href="#" id="user_club_list">동아리신청내역</a>
							</li>
							<li class="list-group-item">
								<a href="#" id="user_request_list">희망도서신청내역</a>
							</li>
							<li class="list-group-item active">
								<a href="#" id="user_favorite">내서재</a>
							</li>
							<li class="list-group-item">
								<a href=# " id="user_qr">나의QR</a>
							</li>
						</ul>

					</div>
				</div>

				<!-- 메인내용 -->
				<div class="col-md-9" id="content">
					
				</div>
				
				
				
				
				
				
				
				<!-- 나의도서정보(대여리스트) 
				<div class="rentalTable">
					<table class="table">
						<thead>
							<tr>
								<th scope="row">No.</th>
								<th scope="row">제목</th>
								<th scope="row">저자</th>
								<th scope="row">출판사</th>
								<th scope="row">대여일</th>
								<th scope="row">반납일</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="rental" items="${rentalList}">
								<tr id="rental_item_${rental.rental_no}">
									<td id="bookNo">1
									<td class="bookTitle">자바</td>
									<td class="bookAuthor">한예지</td>
									<td class="bookPubl">아이티윌</td>
									<td class="bookRentalDate">2022-01-30</td>
									<td class="bookReturnDate">2022-02-03</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>-->
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



	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript"
		src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>

</body>

</html>