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
<link rel="stylesheet" href="css/yurim.css">
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
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
			<form action="insertCustomer.do" method="post"
				enctype="multipart/form-data">

				<!-- 이메일 INPUT START -->
				<label class="mt-4" for="m_phone">아이디</label> <span
					class="signup_required">*</span>
				<div class="input-group mb-3">
					<input class="form-control" type="id" id="id" name="id"
						placeholder="아이디 입력" required>
					<div class="input-group-append">
						<button class="btn btn-outline-success btn-Customer"
							id="btn_idCheck" type="button">중복체크</button>
					</div>
				</div>
				<!-- 이메일 INPUT END -->

				<!-- 비번 INPUT START -->
				<div class="form-group mt-2">
					<label for="pw">비밀번호</label> <span class="signup_required">*</span>
					<input class="form-control" type="password" id="pw" name="pw"
						placeholder="비밀번호를 입력해주세요"
						pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required> <small
						class="form-text text-muted">비밀번호는 <span
						class="signup_required">8~16자, 영문 대문자, 소문자, 숫자 </span>를 포함해야 합니다.
					</small>

				</div>
				<!-- 비번 INPUT END -->

				<!-- 비번확인 INPUT START -->
				<div class="form-group mt-3">
					<label for="pw_check">비밀번호 확인</label> <span class="signup_required">*</span>
					<input class="form-control" type="password" id="pw_check" name="pw_check"
						placeholder="비밀번호를 다시 입력해주세요" required> <span
						class="signup_required"> <small
						class="form-text pw_message" id="pw_match">비밀번호가 일치하지
							않습니다.</small> <small class="form-text pw_message" id="pw_length">8~16자로
							설정해주세요. </small> <small class="form-text pw_message" id="pw_ok">영문
							대문자, 소문자, 숫자 조합으로 해주세요.</small>
					</span>
				</div>
				<!-- 비번확인 INPUT END -->


				<!-- 이름 INPUT START -->
				<div class="form-group mt-2">
					<label for="name">이름</label> <span class="signup_required">*</span>
					<input class="form-control" type="text" id="name" name="name"
						placeholder="이름을 입력해주세요" required> <small
						class="form-text text-muted">반드시 <span
						class="signup_required">한글 실명</span>으로 기입해주세요.<br> 실명이 아닐 경우,
						서비스 이용에 제약이 생길 수 있습니다.<br> - 띄어쓰기, 특수 문자 사용 불가
					</small>
				</div>
				<!-- 이름 INPUT END -->

				<div class="form-group mt-2">
					<label for="gender">성별</label>
				</div>
				<div>
					<div class="form-check">
						<input type="checkbox" id="open" name="male"
							class="form-check-input"> <label for="open"
							class="form-check-label">남성 Male &nbsp;&nbsp;&nbsp;</label> <input
							type="checkbox" id="open" name="female" class="form-check-input">
						<label for="open" class="form-check-label">여성 Female</label>
					</div>
				</div>

				<!-- 이메일 INPUT START -->
				<label class="mt-4" for="m_phone">이메일</label> <span
					class="signup_required">*</span>
				<div class="input-group mb-3">
					<input class="form-control" type="email" id="email" name="email"
						placeholder="예시)hello@delibrary.com" required>
					<div class="input-group-append">
						<button class="btn btn-outline-success btn-Customer"
							id="btn_emailCheck" type="button">중복체크</button>
					</div>
				</div>
				<small class="form-text email_message" id="email_ok"
					style="color: red;">이미 가입되어있는 이메일 입니다. 다른 이메일로 중복확인을 다시
					해주세요.</small> <small class="form-text email_message" id="email_ok_ok"
					style="color: green;">사용 가능한 이메일입니다. </small> <small
					class="form-text text-muted email" id="email_msg"><span
					class="signup_required">실제 사용하시는 이메일을</span> 입력해주세요.</small>
				<!-- 이메일 INPUT END -->

				<!-- 이메일 INPUT START -->
				<label class="mt-4" for="m_phone">전화번호</label> <span
					class="signup_required">*</span>
				<div class="input-group mb-3">
					<input class="form-control" type="tel" id="m_phone" name="m_phone"
						placeholder="예시)010-1234-5678" required>
					<div class="input-group-append">
						<button class="btn btn-outline-success btn-Customer"
							id="btn_emailCheck" type="button">중복체크</button>
					</div>
				</div>
				<!-- 이메일 INPUT END -->


				<!-- 주소 INPUT START -->
				<label for="m_phone mt-4">주소</label> <span class="signup_required">*</span>

				<div id="address_postcode">
					<div class="input-group">
						<input class="form-control" type="text" name="addr2_a"
							id="getPostcode_input" required> <input
							class="form-control" type="text" name="addr2_b"
							id="getDetail_addr">
						<div class="input-group-append">
							<button class="btn btn-outline-success btn-Customer"
								type="button" id="getPostcode">우편번호찾기</button>
						</div>
					</div>
				</div>
				<!-- 상세주소 INPUT START -->
				<div class="form-group mt-1">
					<input class="form-control" type="text" id="getAddr1"
						name="addr1_a"> <input class="form-control mt-1"
						type="text" id="getAddr2" name="addr1_b"
						placeholder="상세주소를 입력해주세요." required>
				</div>
				<!-- 주소 INPUT END -->

				<div class="interest_check">
					<!-- 관심장르 CHECKBOX START -->
					<div class="form-group mt-4">
						<label class="mb-1">도서 관심 분야를 선택해주세요.</label> <br>

						<div class="row">
							<!-- 관심장르 CHECKBOX 1st ROW -->
							<div class="d-inline-block w-50 p-1 form-check"></div>
						</div>
					</div>
				</div>
			</form>
			<select name="language">
				<option value="none">=== 선택 ===</option>
				<option value="100">100 건강/취미/레저</option>
				<option value="200">200 경제경영</option>
				<option value="300">300 고전</option>
				<option value="400">400 과학</option>
				<option value="500">500 만화</option>
				<option value="600">600 사회과학</option>
				<option value="700">700 소설/시/희곡</option>
			</select>
			</form>
	</div>
	<!-- 관심장르 CHECKBOX 3rd ROW END -->
	</div>
	<!-- 관심장르 CHECKBOX END -->

	<!-- 마케팅 동의 -->
	<div class="form-group form-check mt-4">
		<input type="checkbox" class="form-check-input" id="agreement">
		<label class="form-check-label" for="agreement">마케팅 정보 수신
			동의(선택)</label> <small class="form-text text-muted mb-2">마케팅 정보 수신에
			동의하시면 신간도서 소식을 빠르게 전해드립니다.</small>
	</div>

	<!-- 가입버튼 -->
	<div class="form-group mt-2">
		<button class="btn btn-dark btn-block mb-1 btn-Customer" type="submit">가입하기</button>
		<small class="form-text text-muted text-center mb-4">회원가입 진행 시
			별숲도서관의 <span class="signup_required">개인정보처리방침</span>에 동의하신 것으로 간주됩니다.
		</small>
	</div>
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
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript"
		src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
//////////////////////////**우편번호**//////////////////////////////////
window.onload=function(){
	document.querySelector('#getPostcode').addEventListener('click',function (){
		 new daum.Postcode({
			oncomplete: function (data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("getDetail_addr").value = extraAddr;

				} else {
					document.getElementById("getAddr1").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('getPostcode_input').value = data.zonecode;
				document.getElementById("getAddr1").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("getAddr2").focus();
			}
		}).open();

	});
</script>

	<script type="text/javascript">
	  $(function(){
			//푸터 명언
			const footer_display = document.getElementById('footer-display');
			const footer_quotes = ['좋은 책은 인류에게 불멸의 정신이다. — J. 밀턴', '내가 인생을 알게 된 것은 사람과 접촉해서가 아니라 책과 접하였기 때문이다. — A. 프 랜스', '목적이 없는 독서는 산보일 뿐이다. — B. 리튼', '사람은 책을 만들고, 책은 사람을 만든다. — 신용호','기회를 기다리는 것은 바보짓이다. 독서의 시간이라는 것은 지금 이 시간이지 결코 이제부터가 아니다. 오늘 읽을 수 있는 책을 내일로 넘기지 말라. — H. 잭슨','책은 한 권 한 권이 하나의 세계다. — W. 워즈워스', '책을 한 권 읽으면 한 권의 이익이 있고, 책을 하루 읽으면 하루의 이익이 있다. — 괴문절'];
			const footer_getQuote = Math.floor(Math.random() * footer_quotes.length);
			footer_display.textContent =footer_quotes[footer_getQuote];
	  });
  </script>
</body>

</html>