<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<link rel="stylesheet" href="css/yurim.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
<script type="text/javascript" src="js/UserHtmlContents.js"></script>
<script type="text/javascript">

	/************user_login_form*************/
	$(document).on('click','#a_user_login_form',function(e){
		$('#loginPage').html(UserHtmlContents.user_login_form_content());
		
	    e.preventDefault();
	});
	
	/*********user_login_action***********/
	$(document).on('click', '#btn_login_action', function(e) {
			$.ajax({
				url:'user_login_action',
				method:'POST',
				dataType:'json',
				data:$('#user_login_form').serialize(),
				success:function(jsonResult){
				    if (jsonResult.code == 0) {
						console.log(jsonResult);
				    }else if (jsonResult.code == -1) {
						console.log(jsonResult);
				    }else if (jsonResult.code == 1) {
						$('#app').html(UserHtmlContents.user_login_content(jsonResult.data[0]));
						$('#page-header').html(UserHtmlContents.user_main_content());
						
						console.log("성공");
				    }
				}
			});
	    
	    e.preventDefault();
	});
	

</script>
	
<title>로그인 - 별숲도서관</title>
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
		<header id="page-header">
			<div class="darkOverlay">
				<div class="container">
					<div class="row">
						<div class="col-md-6 m-auto text-center">
							<h1></h1>
						</div>
					</div>
				</div>
			</div>
		</header>


		<!-- MAIN SECTION -->
		<section id="loginPage">
			<!-- 타이틀: 별숲 -->
			<h1 class="heroTitle">
				별숲<span class="heroTitle_dot"> : </span> <span class="heroTitle_kor">로그인</span>
			</h1>
			<hr class="heroLine">

			<!-- 로그인 폼 시작 -->
			<form id="user_login_form">
				<div class="form-group mt-4">
					<input class="form-control form-control-lg loginForm" type="id"
						id="id" name="id" placeholder="아이디"> <input
						class="form-control form-control-lg mt-2 loginForm"
						type="password" id="pw" name="pw" placeholder="비밀번호"> <input
						type="hidden" name="loginOk" value="ok">
					<button
						class="btn btn-outline-success btn-lg btn-block mt-2 btn-Customer"
						type="submit" id="btn_login_action">로그인</button>
				</div>
			</form>

			<!-- 회원가입 / 이메일찾기 / 비밀번호찾기 -->
			<div id="loginInfo">
				<p class="text-right m-0 noto-serif">아직 별숲 회원이 아니신가요?</p>
				<p class="text-right m-0">
					<a href="insertCustomer">회원가입하기 </a>
				</p>
				<hr class="heroLineSecond">
				<p class="text-muted text-center mb-5">
					<a href="#" data-toggle="modal" data-target="#emailModal">아이디
						찾기 </a> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#"
						data-toggle="modal" data-target="#pwModal">비밀번호찾기</a>
				</p>
				</form>
			</div>

			<!-- 이메일찾기 MODAL -->
			<div class="modal" id="emailModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">내 아이디 찾기</h5>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<!-- 폼시작 -->
							<!-- <form action="findEmail.do" method="post"> -->
							<div class="form-group">
								<label for="username">이름</label> <input type="text"
									id="findEmail_name" name="name" placeholder="이름을 입력하세요"
									class="form-control" required>
							</div>
							<div class="form-group">
								<label for="password">가입 휴대전화번호</label> <input type="tel"
									id="findEmail_cell" name="m_phone"
									placeholder="예시) 010-1234-5678" class="form-control" required>
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-outline-info btn-Customer"
								id="findMyEmail" type="button">내 아이디 찾기</button>
							<!-- </form> -->
							<!--폼 종료 -->
						</div>
					</div>
				</div>
			</div>

			<!-- 비밀번호 찾기 MODAL -->
			<div class="modal" id="pwModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">내 비밀번호 찾기</h5>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label for="username">아이디 </label> <input type="text"
									id="findPw_name" placeholder="이름을 입력하세요" class="form-control">
							</div>
							<div class="form-group">
								<label for="password">가입 이메일</label> <input type="email"
									id="findPw_email" placeholder="예시)hello@delibrary.com"
									class="form-control">
							</div>

						</div>
						<div class="modal-footer">
							<button type="submit" id="findPw_btn"
								class="btn btn-outline-info btn-Customer" data-dismiss="modal">비밀번호
								찾기</button>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- FOOTER -->
	<footer id="main-footer" class="p-5 noto-serif">
		<div class="container">
			<div class="row">
				<div class="col-md-3 mb-3">
					<p class="mb-1">
						<a href="howtoInfo.do">이용안내</a>
					</p>
					<p class="mb-1">
						<a href="postList.do?option=p_title&search=&group=10">공지사항</a>
					</p>
					<p class="mb-1">
						<a href="faqViewpage.do">자주묻는질문</a>
					</p>
					<p class="mb-1">
						<a href="QnaList.do">묻고답하기</a>
					</p>
				</div>
				<div class="col-md-3 mb-3">
					<p class="mb-1">
						<a href="postList.do?option=p_title&search=&group=20">창작물게시판</a>
					</p>
					<p class="mb-1">
						<a href="postList.do?option=p_title&search=&group=30">중고장터</a>
					</p>
					<p class="mb-1">
						<a href="postList.do?option=p_title&search=&group=60">자유게시판</a>
					</p>
					<p class="mb-1">
						<a
							href="http://localhost:8088/MyPage_Folder.do?cust_no=${cust_no }&group=50">내서재</a>
					</p>
				</div>
				<div class="col-md-6">
					<table class="footer-table">
						<tbody>
							<tr>
								<th>Delibrary</th>
								<td>서울 마포구 백범로 23 구프라자 3층</td>
							</tr>
							<tr>
								<th>고객센터</th>
								<td>070-1234-5678</td>
							</tr>
							<tr>
								<th>이용시간</th>
								<td>평일 9:00 - 18:00, 점심시간 12:00 - 13:30 &nbsp;<small>(
										주말/공휴일 휴무 )</small></td>
							</tr>
							<tr>
								<th>팩스번호</th>
								<td>0504-123-1234</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>delibrary@book.com</td>
							</tr>
						</tbody>
					</table>
					<br> <br>
					<p>
						Copyright &copy; <span id="year"></span> Delibrary
					</p>
				</div>
			</div>
		</div>
	</footer>

	<!---------------------- 자바스크립트 섹션 ----------------------->

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
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>

</html>