<%@page import="com.itwill.domain.Search"%>
<%@page import="com.itwill.util.PageMakerDto"%>
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

String pageno = request.getParameter("pageno");
if (pageno == null || pageno.equals("")) {
	pageno = "1";
}

PageMakerDto<Search> listPage = null;

 if (searchType.equals("all")) {
		listPage = new SearchServiceImpl().selectByAll(keyword, Integer.parseInt(pageno));
    }
 if (searchType.equals("title")) {
		listPage = new SearchServiceImpl().selectByTitle(keyword, Integer.parseInt(pageno));
    }
 if (searchType.equals("author")) {
		listPage = new SearchServiceImpl().selectByAuthor(keyword, Integer.parseInt(pageno));
    }
 if (searchType.equals("category_name")) {
		listPage = new SearchServiceImpl().selectByCategoryName(keyword, Integer.parseInt(pageno));
    }
 if (searchType.equals("publisher")) {
		listPage = new SearchServiceImpl().selectByPublisher(keyword, Integer.parseInt(pageno));
    }
 
 String u_id = (String)session.getAttribute("sUserId");
%>

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
	<%if(u_id == null){ %>
	    <li id="logo"><a href="userinfo_view.jsp"></a></li>
		<li><a href="userinfo_insert_form.jsp">회원가입</a></li>
		<li><a href="userinfo_login_form.jsp">로그인</a></li>
		<%}else {%>
	
	    <li id="logo"><a href="userinfo_view.jsp"><%=u_id %></a></li>
	    
		<li><a href="userinfo_logout_action.jsp">로그아웃</a></li>
		<li><a href="cart_view.jsp">장바구니</a></li>
		<li><a href="order_list.jsp">주문목록</a></li>
		<%} %>
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
								<td height="20" class="t1" align="right" valign="bottom">♠ 총 <font color="#FF0000"><%=listPage.totRecordCount%></font>건 | 현재페이지( <font color="#FF0000"><%=listPage.pageMaker2.getCurPage()%></font> / <font color="#0000FF"><%=listPage.pageMaker2.getTotPage()%></font> )
								</td>

</tr>
</table>
					<div class="book-detail-button">
					&nbsp;&nbsp;<button onclick="location.href='book_search_form'">돌아가기</button>
					</div>
					<form name="f" method="post">
					   <table width="100%" align="center" border="0" cellpadding="10"
									cellspacing="1" bgcolor="BBBBBB">
<%
int book_size=listPage.itemList.size();
int book_column_size=4;
int book_line_count=1;

for(int i=0;i < listPage.itemList.size();i++){
	Search search=listPage.itemList.get(i);
%>
<%
if(i%book_column_size==0){
%>
<tr>
<%}%> 

<td align="center" width="25%"  bgcolor="ffffff">
<a href="book_detail.jsp?b_no=<%=search.getBook_title()%>">

<img width="63px" height="95px" src='image/<%=search.getBook_image()%>.jpg' border="0"></a><br> 
										 [<%=search.getCategory_no()%>]<br> 
											<%=search.getBook_title()%><br> 
											저자&nbsp;:&nbsp;<%=search.getBook_author()%><br> 
											출판사&nbsp;:&nbsp;<%=search.getBook_publisher()%><br> 
</td>
<%if(i%book_column_size==3){%>
</tr>
<%}%>
<%}%>
</table>
</form>
<!-- 페이지 번호 리스트 -->
			<table border="0" cellpadding="0" cellspacing="1" width="590">
				<tr>
					<td align="center">
			     
									<%if(listPage.pageMaker2.getPrevGroupStartPage()>0) {%>    
									    <a href="./book_search_result.jsp?pageno=1&searchType=<%=searchType%>&keyword=<%=keyword%>">◀◀</a>&nbsp;
									 <%}%>
									 <%if(listPage.pageMaker2.getPrevPage()>0) {%>    
										<a href="./book_search_result.jsp?pageno=<%=listPage.pageMaker2.getPrevPage()%>&searchType=<%=searchType%>&keyword=<%=keyword%>">◀</a>&nbsp;&nbsp;
									 <%}%>
									
									<%
										for (int i = listPage.pageMaker2.getBlockBegin(); i <= listPage.pageMaker2.getBlockEnd(); i++) {
									 	if (listPage.pageMaker2.getCurPage() == i) {
									%>
									 <font color='blue'><strong><%=i%></strong></font>&nbsp;
									<%} else {%>
									<a href="./book_search_result.jsp?pageno=<%=i%>&searchType=<%=searchType%>&keyword=<%=keyword%>"><strong><%=i%></strong></a>&nbsp;
									<%
									   }
									  }%>
									  
									  
									 <%if(listPage.pageMaker2.getCurPage() < listPage.pageMaker2.getTotPage()){%>
									  <a href="./book_search_result.jsp?pageno=<%=listPage.pageMaker2.getNextPage()%>&searchType=<%=searchType%>&keyword=<%=keyword%>">▶&nbsp;</a>
									 <%}%>
									 <%if(listPage.pageMaker2.getNextGroupStartPage()< listPage.pageMaker2.getTotPage()){%>
									<a href="./book_search_result.jsp?pageno=<%=listPage.pageMaker2.getTotPage()%>&searchType=<%=searchType%>&keyword=<%=keyword%>">▶▶</a>&nbsp;
									 <%
									 }%>
						</td>
				</tr>
			</table> 
			<!-- 페이지 번호 리스트 -->
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