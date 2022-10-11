<%@page import="com.itwill.domain.Search"%>
<%@page import="com.itwill.service.SearchServiceImpl"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
String searchType = request.getParameter("searchType");
String keyword = request.getParameter("keyword");
if(searchType==null|| searchType.equals("")){
	response.sendRedirect("book_search_form");
	return;
}

Search search=new Search();

%>
<choose>
<when test="type!=null and type.equals('all')">
</choose>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>도서정보 - 별숲도서관</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/menu.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">

<style type="text/css" media="screen">
</style>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<div id="menu">
	<ul>
	</ul>
</div>
			<h1>
	<div style="width:100px;padding-top: 15px;margin: 1px 240px 1px 240px">
	<a href = kyobo_main.jsp>	
	<img src='image/logo.png' width="220" height="51" align="top" align="center"/>
	</a>
	</div>
	
</h1>
<div id="sub_menu">
	<ul>
		<li><a href="book_search_form.jsp">도서검색</a></li>
		<li><a href="book_list.jsp">도서목록</a></li>
		<li><a href="notice_list.jsp">공지사항</a></li>
		<li><a href="qna_list.jsp">Q&A</a></li>
	</ul>
	<hr size="1px" noshade="noshade" style="margin: 3px 0px 3px 0px" >
</div>
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
         <!-- include_common_left.jsp start-->
         <p>
	
</p>
<ul>
	
</ul>

         <!-- include_common_left.jsp end-->
      </div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->

			<!-- include_content.jsp start-->
			<div id="content">
				<div style="margin: 10px;">
					
					
					<h1 align="center">검색 결과가 없습니다.</h1>
					<br>
					<div class="book-detail-button">
					&nbsp;&nbsp;<button onclick="location.href='book_search_form'">돌아가기</button>
					</div>
					
						<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>

<tr>
<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>검색어와 일치하는 도서 목록</b></td>
							</tr>
							<tr bgcolor="#FFFFFF">

</tr>
</table>
					<div class="book-detail-button">
					&nbsp;&nbsp;<button onclick="location.href='book_search_form'">돌아가기</button>
					</div>
					<form name="f" method="post">
					   <table width="100%" align="center" border="0" cellpadding="10"
									cellspacing="1" bgcolor="BBBBBB">
<%
int book_column_size=4;
int book_line_count=1;


%>

<tr>

<td align="center" width="25%"  bgcolor="ffffff">
<a href="book_detail.jsp?b_no=<%=search.getBook_title()%>">

<img width="63px" height="95px" src='image/<%=search.getBook_image()%>.jpg' border="0"></a><br> 
										 [<%=search.getCategory_no()%>]<br> 
											<%=search.getBook_title()%><br> 
											저자&nbsp;:&nbsp;<%=search.getBook_author()%><br> 
											출판사&nbsp;:&nbsp;<%=search.getBook_publisher()%><br> 
</td>
</table>
</form>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<p align="center"><font color="#8B4513"> Copyright (&copy;) By Java Class 5. All
		rights reserved.</font></p>
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>