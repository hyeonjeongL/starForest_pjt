<%@page import="com.itwill.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% User user=new User(); %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<!-- 구글폰트 전체 기본적용 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap" rel="stylesheet">
<!-- 구글폰트 전체 기본적용 END -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/yurim.css">
<script type="text/javascript" src="static/js/User.js"></script>
<script type="text/javascript" src="static/js/UserHtmlContents.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".mypage").click(function(event){
		if(${cust_no == null}){
			event.preventDefault();
			const loginOk = confirm("로그인 후 사용 가능합니다. 로그인하시겠습니까?");
			console.log(loginOk);
			if(loginOk){
				console.log("로그인하러갑니다.");
				window.location.href = "LoginPage";
			}
		}else{
			window.location.href="Home";
		}
	});
});

function userCreate() {
	if (document.f.user_id.value == "") {
		alert("사용자 아이디를 입력하십시요.");
		f.user_id.focus();
		return false;
	}
	if (document.f.user_password.value == "") {
		alert("비밀번호를 입력하십시요.");
		f.user_password.focus();
		return false;
	}
	if (document.f.user_password2.value == "") {
		alert("비밀번호확인을 입력하십시요.");
		f.user_password2.focus();
		return false;
	}
	if (document.f.user_name.value == "") {
		alert("이름을 입력하십시요.");
		f.user_name.focus();
		return false;
	}
	if (document.f.user_birth.value == "") {
		alert("생년월일을 입력하십시요.");
		f.user_birth.focus();
		return false;
	}
	if (document.f.user_gender.value == "") {
		alert("성별을 입력하십시요.");
		f.user_gender.focus();
		return false;
	}
	if (document.f.user_email.value == "") {
		alert("이메일 주소를 입력하십시요.");
		f.user_email.focus();
		return false;
	}
	if (document.f.user_phone.value == "") {
		alert("전화번호를 입력하십시요.");
		f.user_phone.focus();
		return false;
	}
	if (document.f.user_address.value == "") {
		alert("주소를 입력하십시요.");
		f.user_address.focus();
		return false;
	}
	if (document.f.category_no.value == "") {
		alert("관심 분야를 입력하십시요.");
		f.category_no.focus();
		return false;
	}
	if (document.f.user_password.value != document.f.user_password2.value) {
		alert("비밀번호와 비밀번호확인은 일치하여야합니다.");
		f.user_password.focus();
		f.user_password.select();
		return false;
	}
	document.f.action = "user_write_action";
	document.f.method='POST';
	document.f.submit();
}

/****************user_write_form******************/
$(document).on('click', '#a_user_write_form,#btn_user_write_form', function(e) {
    $('#content').html(UserHtmlContents.user_write_form_content());
    validator=$('#user_write_form').validate({
		rules:{
		    user_id : {
			    required : true,
			    remote : {
					url : "user_id_check_json",
					dataType:'json',
					method:'GET',
					data : {user_id :function() {
										return $("[name='user_id']").val();
						    		}
				}
			  }
			}
		    
		},
		messages:{
			user_id : {
		    	remote: jQuery.validator.format("{0} 는 이미사용중인 아이디입니다.")
		  	}
		}
		
	
    });
    e.preventDefault();
});
/****************user_write_action******************/
$(document).on('click',	'#btn_user_write_action',function(e) {
    if(validator.form()){
	    var param = $('#user_write_form').serialize();
	    $.ajax({
			url : 'user_write_action_json',
			method : 'GET',
			dataType : 'json',
			data : param,
			success : function(jsonResult) {
			    if (jsonResult.code == 1) {
					$('#content').html(UserHtmlContents.user_login_form_content());
			    } else if (jsonResult.code == 2) {
					$('#msg1').html(jsonResult.msg);
			    }
			    console.log(jsonResult);
			}
	    });
    }    
	e.preventDefault();
});
</script>
<title>회원가입 - 별숲도서관</title>
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
							<h2>회원가입</h2>
							<small style="color: Gainsboro;">별숲도서관의 도서를 온라인으로 대여하세요.</small>
						</div>
					</div>
				</div>
			</div>
		</header>
		<!-- MAIN SECTION -->
		<section id="insertCustomer">
			<!-- 폼 시작 -->
			<form action="insertCustomer" method="post" enctype="multipart/form-data">
				<!-- 이메일 INPUT START -->
				<label class="mt-4" for="m_phone">아이디</label> 
				<span class="signup_required">*</span>
				<div class="input-group mb-3">
					<input value="${user_id}" class="form-control" type="text"  id="user_id" name="user_id" placeholder="아이디 입력" required>
					&nbsp;&nbsp;<font color="red">${msg}</font>
				</div>
				<!-- 이메일 INPUT END -->
				<!-- 비번 INPUT START -->
				<div class="form-group mt-2">
					<label for="pw">비밀번호</label> 
					<span class="signup_required">*</span>
					<input value="${user_password}"  class="form-control" type="password"  id="user_password" name="user_password" placeholder="비밀번호 4자리 입력" >
				</div>
				<!-- 비번 INPUT END -->
				<!-- 비번확인 INPUT START -->
				<div class="form-group mt-3">
					<label for="pw_check">비밀번호 확인</label> 
					<span class="signup_required">*</span>
					<input  value="${user_password}" class="form-control" type="password"   id="user_password2" name="user_password2" placeholder="비밀번호 다시 입력" required>
				</div>
				<!-- 비번확인 INPUT END -->
				<!-- 이름 INPUT START -->
				<div class="form-group mt-2">
					<label for="name">이름</label> 
					<span class="signup_required">*</span>
					<input  value="${user_name}" class="form-control" type="text"  id="user_name" name="user_name" placeholder="이름 입력" required>
					<small class="form-text text-muted">반드시 <span class="signup_required">한글 실명</span>으로 기입해주세요.<br> 실명이 아닐 경우, 서비스 이용에 제약이 생길 수 있습니다.<br> - 띄어쓰기, 특수 문자 사용 불가
					</small>
				</div>
				<!-- 이름 INPUT END -->
				<!-- 이름 INPUT START -->
				<div class="form-group mt-2">
					<label for="birth">생년월일</label> 
					<span class="signup_required">*</span>
					<input  value="${user_birth}" class="form-control" type="text"  id="user_birth" name="user_birth" placeholder="ex) 1999-01-01" required>
				</div>
				<!-- 이름 INPUT END -->
				<div class="form-group mt-2">
					<label for="gender">성별</label>
					<span class="signup_required">*</span>
					<input  value="${user_gender}" class="form-control" type="text"  id="user_gender" name="user_gender" placeholder="ex) M (남성) / F (여성)" required>
				</div>
				<!-- 이메일 INPUT START -->
				<label class="mt-4" for="m_phone">이메일</label> 
				<span class="signup_required">*</span>
				<div class="input-group mb-3">
					<input  value="${user_email}" class="form-control" type="text"  id="user_email" name="user_email" placeholder="ex) hello@delibrary.com" required>
				</div>
				<!-- 이메일 INPUT END -->
				<!-- 이메일 INPUT START -->
				<label class="mt-4" for="m_phone">전화번호</label> 
				<span class="signup_required">*</span>
				<div class="input-group mb-3">
					<input  value="${user_phone}" class="form-control" type="tel"  id="user_phone" name="user_phone" placeholder="ex) 010-1234-5678" required>
				</div>
				<!-- 이메일 INPUT END -->
				<!-- 주소 INPUT START -->
				<label for="m_phone mt-4">주소</label> 
				<span class="signup_required">*</span>
				<!-- 상세주소 INPUT START -->
				<div class="form-group mt-1">
					<input  value="${user_address}" class="form-control"type="text"  id="user_address" name="user_address" placeholder="주소 입력 ex) 서울시 강남구 역삼동" required>
				</div>
				<!-- 주소 INPUT END -->
					<!-- 관심장르 CHECKBOX START -->
				<label for="m_phone mt-4">도서 관심 분야</label> 
				<span class="signup_required">*</span>
				<div class="form-group mt-1">
				<small class="form-text text-muted mb-2">
				<span class="signup_required">100</span><span> - 건강/취미/레저</span>&nbsp;&nbsp;&nbsp;//&nbsp;&nbsp;&nbsp;<span class="signup_required">200</span><span> - 경제경영</span>&nbsp;&nbsp;&nbsp;//&nbsp;&nbsp;&nbsp;<span class="signup_required">300</span><span> - 고전</span></small> 
				<small class="form-text text-muted mb-2">
				<span class="signup_required">400</span><span> - 과학</span>&nbsp;&nbsp;&nbsp;//&nbsp;&nbsp;&nbsp;<span class="signup_required">500</span> <span> - 만화</span>&nbsp;&nbsp;&nbsp;//&nbsp;&nbsp;&nbsp;
				<span class="signup_required">600</span><span> - 사회과학</span>&nbsp;&nbsp;&nbsp;//&nbsp;&nbsp;&nbsp;<span class="signup_required">700</span><span> - 소설/시/희곡</span></small> 
					<input  value="${user_address}" class="form-control"type="text"  id="category_no" name="category_no" placeholder="관심 분야 입력 ex) 100" required>
							<!-- 관심장르 CHECKBOX 1st ROW -->
					</div>
	<!-- 관심장르 CHECKBOX 3rd ROW END -->
	<!-- 관심장르 CHECKBOX END -->
	<!-- 가입버튼 -->
		<div class="form-group mt-2">
			<button class="btn btn-dark btn-block mb-1 btn-Customer" type="submit" onclick="userCreate();" id="btn_user_write_action" name="btn_user_write_action">가입하기</button>
			<small class="form-text text-muted text-center mb-4">회원가입 진행 시 별숲도서관의 <span class="signup_required">개인정보처리방침</span>에 동의하신 것으로 간주됩니다.
			</small>
		</div>
		
		</form>
	</section>
	</div>
	<!-- .footer-navigation -->
	<!-- footer start-->
	<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="common/include_common_bottom_templateVer.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
	<!-- footer end-->
	<!---------------------- 자바스크립트 섹션 ----------------------->
	<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>
	  <script type="text/javascript"	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript"	src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		$(function() {
			//푸터 명언
			const footer_display = document.getElementById('footer-display');
			const footer_quotes = [
					'좋은 책은 인류에게 불멸의 정신이다. — J. 밀턴',
					'내가 인생을 알게 된 것은 사람과 접촉해서가 아니라 책과 접하였기 때문이다. — A. 프 랜스',
					'목적이 없는 독서는 산보일 뿐이다. — B. 리튼',
					'사람은 책을 만들고, 책은 사람을 만든다. — 신용호',
					'기회를 기다리는 것은 바보짓이다. 독서의 시간이라는 것은 지금 이 시간이지 결코 이제부터가 아니다. 오늘 읽을 수 있는 책을 내일로 넘기지 말라. — H. 잭슨',
					'책은 한 권 한 권이 하나의 세계다. — W. 워즈워스',
					'책을 한 권 읽으면 한 권의 이익이 있고, 책을 하루 읽으면 하루의 이익이 있다. — 괴문절' ];
			const footer_getQuote = Math.floor(Math.random()
					* footer_quotes.length);
			footer_display.textContent = footer_quotes[footer_getQuote];
		});
	</script>
</body>
</html>