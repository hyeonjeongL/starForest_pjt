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
		msg = "";
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
</html> -->