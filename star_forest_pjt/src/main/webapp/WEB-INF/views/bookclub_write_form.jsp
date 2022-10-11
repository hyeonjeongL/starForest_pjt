<%@page import="com.itwill.domain.BookClub"%>
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
@import
	url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap')
	;

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

#btn_category, .rentalTable {
	font-family: 'Gowun Dodum', sans-serif;
}
</style>



<script type="text/javascript">
	$(function() {

		/***********로그인 세션확인**************/
		$.ajax({
			url : 'user_session_check',
			method : 'POST',
			dataType : 'json',
			success : function(jsonResult) {
				if (jsonResult.code == 1) {
					console.log(jsonResult);
				}else{ //세션 존재하지 않을경우 메세지창보여줌
					alert('로그인이 필요한 페이지입니다:)');
				}
			}
		});
		/********club_list***********/
		
		$(document).on('click','#btn_list',function(e) {
					$.ajax({
						url : 'club_list',
						method : 'POST',
						success : function(jsonResult) {
							var bookClubArray = jsonResult.data;
							$('#content').html(
									BookClubHtmlContents
											.club_join_html(bookClubArray));
						}
					});
					e.preventDefault();
				});

		
	

		/************club_write_action**************/
		$(document).on('click', '#btn_write_action', function(e) {
			var param = $('#club_write_form').serialize();
			console.log(param);
			$.ajax({
				url : 'club_create',
				method : 'POST',
				dataType : 'json',
				data : param,
				success : function(jsonResult) {
					if (jsonResult.code == 1) {
						$("#btn_list").trigger('click');
					} else if (jsonResult.code == 2) {
						alert(jsonResult.msg);
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
							<li id="side_bookClub" class="list-group-item"><a
								href="bookclub" class="returnAll">도서동아리</a></li>
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
								<img src="./img/detail.png" width=25 height=25>&nbsp&nbsp도서동아리
								> 작성
								<form id="club_write_form" name="f" method="post">
									<table class="table" style="width: 855px">
										<br>
										<tbody>
											<tr id="rental_item_"
												style="border: 1px solid #dee2e6; height: 50px;">


												<td colspan="1"
													style="padding: 0px; text-align: center; padding-left: 20px; background-color: #eff3f7; font-weight: bold">작성자
												</td>
												<td colspan="2"
													style="padding: 0px; text-align: middle; padding-left: 20px">${sUserId}
													
												</td>



											</tr>
											<tr id="rental_item_"
												style="border: 1px solid #dee2e6; height: 50px;">


												<td colspan="1"
													style="padding: 0px; text-align: center; padding-left: 20px; background-color: #eff3f7; font-weight: bold">대상
												</td>
												<td colspan="2"
													style="padding: 0px; text-align: middle; padding-left: 20px">
													<input type="text" name="club_person">
												</td>



											</tr>
											<tr id="rental_item_"
												style="border: 1px solid #dee2e6; height: 50px;">


												<td colspan="1"
													style="padding: 0px; text-align: center; padding-left: 20px; background-color: #eff3f7; font-weight: bold">모집인원
												</td>
												<td colspan="2"
													style="padding: 0px; text-align: middle; padding-left: 20px">
													<input type="text" name="club_count">
												</td>



											</tr>
											<tr id="rental_item_"
												style="border: 1px solid #dee2e6; height: 50px;">


												<td colspan="1"
													style="padding: 0px; text-align: center; padding-left: 20px; background-color: #eff3f7; font-weight: bold">장소
												</td>
												<td colspan="2"
													style="padding: 0px; text-align: middle; padding-left: 20px">
													<input type="text" name="club_place">
												</td>



											</tr>
											<tr id="rental_item_"
												style="border: 1px solid #dee2e6; height: 50px;">


												<td colspan="1"
													style="padding: 0px; text-align: center; padding-left: 20px; background-color: #eff3f7; font-weight: bold">시간
												</td>
												<td colspan="2"
													style="padding: 0px; text-align: middle; padding-left: 20px">
													<input type="text" name="club_time">
												</td>



											</tr>
											<tr id="rental_item_"
												style="border: 1px solid #dee2e6; height: 130px;">


												<td colspan="1"
													style="padding: 0px; text-align: center; padding-left: 20px; background-color: #eff3f7; font-weight: bold">내용
												</td>
												<td colspan="2"
													style="padding: 0px; text-align: middle; padding-left: 20px">
													<textarea wrap="soft" style="width: 500px" rows="10"
														name="club_content">
															
															</textarea>
												</td>
											</tr>
											<tr id="rental_item_"
												style="border: 1px solid #dee2e6; height: 130px;">


												<td colspan="1"
													style="padding: 0px; text-align: center; padding-left: 20px; background-color: #eff3f7; font-weight: bold">카테고리
												</td>
												<td colspan="2"
													style="padding: 0px; text-align: middle; padding-left: 20px">
													<select name="category_name">
															<option value="건강/취미/레저">건강/취미/레저</option>
															<option value="경제경영">경제경영</option>
															<option value="고전">고전</option>
															<option value="과학">과학</option>
															<option value="만화">만화</option>
															<option value="사회과학">사회과학</option>
															<option value="소설/시/희곡">소설/시/희곡</option>
															<option value="기타">기타</option>	
													</select>
												</td>
											</tr>

											<tr style="height: 130px;">

												<td colspan="5">
													<button id="btn_write_action" class="w-btn w-btn-detail"
														type="button">작성</button>


													<button id="btn_list" class="w-btn w-btn-detail"
														type="button">목록</button>
													<br>
												</td>




											</tr>

										</tbody>
									</table>
								</form>
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
	<!-- <script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
	<!-- 	<script type="text/javascript"
		src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>
 -->
</body>

</html>