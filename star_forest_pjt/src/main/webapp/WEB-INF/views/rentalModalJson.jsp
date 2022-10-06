<%@page import="com.itwill.domain.Book"%>
<%@page import="com.itwill.service.BookService"%>
<%@page import="com.itwill.service.BookServiceImpl"%>
<%@page import="com.itwill.service.RentalService"%>
<%@page import="com.itwill.domain.Rental"%>
<%@ page language="java" contentType="text/html; charset="
    pageEncoding="UTF-8"%>
    
    
    <%
	int code = 1;
	String url = "";
	String msg = "";
	StringBuffer jsonData = new StringBuffer();
	
	
	String book_no = request.getParameter("book_no");
	if (book_no == null || book_no.equals("")){
		code = 2;
		url = "";
		msg = "잘못된요청방식입니다.";
	}else{
		BookServiceImpl bookService = new BookServiceImpl();
		Book book = bookService.selectBookDetail(Integer.parseInt(book_no));
		
		code = 1;
		url = "";
		msg = "책정보";
		jsonData.append("{");
		jsonData.append("\"guest_no\":" + book.getBook_title() + ",");
		jsonData.append("\"guest_name\":\"" + book.getBook_author() + "\",");
		jsonData.append("}");
	}
%>
{ 
	 "code":<%=code%>,
	 "url":"<%=url%>", 
	 "msg":"<%=msg%>", 
	 "data":[<%=jsonData.toString()%>]
}
    
    
<!-- <!DOCTYPE html>
<html lang="ko-KR"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서예약 신청</title>
<script src="/wp-includes/js/jquery/jquery.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli%3A400%2C500%2C700%7CNoto+Sans+KR%3A400%2C500%2C700&amp;display=swap&amp;ver=5.3.2" type="text/css" media="all">
<link rel="stylesheet" href="/wp-content/themes/kulib/plugins/bootstrap/css/bootstrap.css" type="text/css" media="all">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.9.0/css/all.css?ver=5.9.0" type="text/css" media="all">
<link rel="stylesheet" href="/wp-content/themes/kulib/style.css" type="text/css" media="all">
<script>
	var url = "";


	jQuery(function($) {
		$(".submit-request").click(function(e) {
			window.location.replace(url);
			return;
		});

	});

</script></head>



<body class="modal-page">
	
	<div class="container">

		<div class="entry-content">

			
			<div class="content-d">
				<h4 class="content-h4"><i class="fas fa-arrow-alt-circle-right"></i> 도서예약 안내</h4>
				<div class="content-l">
					<ol>
						<li>
							<div>예약자료 도착 알림 : 개인공지 / E-mail / 카카오알림톡(또는 SMS)</div>
							<div>&lt;도서관 홈페이지 - 나의공간 - 이용자정보관리&gt;에서 <font color="red">연락처를 확인</font>하여 주시기 바랍니다.</div>
						</li><li>
							<div>예약 정보 확인 및 취소 : &lt;나의공간 - 대출/예약 현황&gt; 메뉴</div>
							<div>단, <font color="red">도착통보 후에는 직접 취소가 불가</font>하오니 1:1 문의 게시판 또는 전화로 취소 요청하시기 바랍니다.</div>
						</li>
					</ol>
				</div>
			</div>
			<div class="content-d d-flex justify-content-center">
				<button type="button" class="btn btn-primary submit-request">신청</button>
			</div>

			
		</div>.entry-content

	</div>.container


</body>
</html> 


<html lang="ko-KR"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소장정보 모바일(알림톡/SMS) 발송 신청</title>
<script src="/wp-includes/js/jquery/jquery.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli%3A400%2C500%2C700%7CNoto+Sans+KR%3A400%2C500%2C700&amp;display=swap&amp;ver=5.3.2" type="text/css" media="all">
<link rel="stylesheet" href="/wp-content/themes/kulib/plugins/bootstrap/css/bootstrap.css" type="text/css" media="all">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.9.0/css/all.css?ver=5.9.0" type="text/css" media="all">
<link rel="stylesheet" href="/wp-content/themes/kulib/style.css" type="text/css" media="all">
<script>
	var url = "/send-sms/?cmd=request&apikey=egY5cMuhlF8N3sTXD4Af&accessno=000131055284&mainno=1016448558";


	jQuery(function($) {
		$(".submit-request").click(function(e) {
			window.location.replace(url);
			return;
		});

	});


</script></head>



<body class="modal-page">
	
	<div class="container">

		<div class="entry-content">

			
			<div class="content-d">
				<h4 class="content-h4"><i class="fas fa-arrow-alt-circle-right"></i> 소장정보 모바일(알림톡/SMS) 발송 서비스</h4>
				<div class="content-l">
					<h5>소장정보</h5>
					<ul>
						<li>도서정보: 소크라테스 익스프레스 : 철학이 우리 인생에 스며드는 순간 / Weiner, Eric</li>
						<li>출판정보: 어크로스 (2021)</li>						
						<li>청구기호: 102 2021z3</li>
						<li>소장정보: 의학도서관/자료실(3층)/신착</li>
					</ul>
				</div>
			</div>
			
			<div class="content-d">
				<div class="content-l">
					<h5>수신번호 : 010-3329-****</h5>
					<div class="content-desc">
						※ 수신번호 변경 방법<br>-포털 아이디 이용자 : 학교 포털사이트(http://portal.korea.ac.kr/)에서 직접 변경 <br>- 도서관 아이디 이용자 : 도서관 홈페이지 로그인 후 [내 정보 변경] 페이지에서 직접 변경
					</div>
				</div>
			</div>
			
			<div class="content-d d-flex justify-content-center">
				<button type="button" class="btn btn-primary submit-request">신청</button>
			</div>

			
		</div>

	</div>



</body></html>

-->