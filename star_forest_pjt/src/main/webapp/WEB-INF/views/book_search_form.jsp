<%@page import="com.itwill.service.SearchServiceImpl"%>
<%@page import="com.itwill.domain.Search"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
Search search =new Search();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별숲도서관</title>
 <script type="text/javascript">
	function keywordCheck() {
		var str_keyword = window.searchform.keyword.value;
		if (!str_keyword || str_keyword === "") {
			window.alert("검색어를 입력하세요.");
			window.searchform.keyword.focus();
			return false;
		}
		window.searchform.submit();
	}
</script>
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
			<!-- include_common_top.jsp start-->
			<!--jsp:include page="include_common_top.jsp" /-->
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
         <!-- include_common_left.jsp start-->
         <!-- jsp:include page="include_common_left.jsp"/-->
         <!-- include_common_left.jsp end-->
      </div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="35">&nbsp;&nbsp;<Font size="4">도서 검색</td>
								</tr>
							</table>
							</table>


						<div class="row">
				<form name="search_form" autocomplete="off">
							<select name="Type" style="width:60px;height:30px">
										<option value="all">통합</option>
										<option value="title" >제목</option>
										<option value="category_name" >분야</option>
										<option value="author" >저자</option>
										<option value="publisher" >출판사</option>
							</select>
			<input type="text" name="keyword" placeholder="검색어를 입력하세요" style="width:130px;height:25px" value=""></input> 
				<input type="button" value="검색" onclick="location.href='book_search_result'" class="btn btn-outline-primary mr-2" style="width:40px;height:30px"></input>
		</form>
			</div>
	</div>
	
	<div style="margin: 10px;">
				<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>
				<tr>
					<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b>도서 목록</b>
					</td>
				</tr>
				</table>
			<br />
			<!-- list  -->
			<form name="f">
			
			<hr>
				<table class='book-list'>
					<!-- 책정보 시작 -->
					
					<tr>
						<td class='book-list-img' rowspan="4"><a href='book_detail.jsp?bookNo=<%=search.getBook_no()%>'><img alt='bookcover' src='<%=search.getBook_image_src()%>' width="100px" height="140px"></a> <input type="hidden" name="bookNo" value="<%=search.getBook_no()%>"></td>
						<td class='book-td'><span class='bookcategory'><%=search.getCategory_no()%></span>&nbsp;&nbsp;<a href='book_detail.jsp?bookNo=<%=search.getBook_no()%>'><strong><%=search.getBook_title()%></strong></a></td>
					</tr>
					<tr>
						<td class='book-td'><strong>저자:</strong><%=search.getBook_author()%>&nbsp;&nbsp; <strong>출판사:</strong><%=search.getBook_publisher()%></td>
					</tr>
					<tr>
					</tr>
					<tr>
			            <td class='book-td'>
			            <%//if (book.getBookLoan() < book.getBookHoldings()) {%>
			            <input class='btn-action' type="button" value="대출신청" onclick="location.href='loanAddAction.jsp?bookNo=<%=search.getBook_no()%>'">
			            <%//} else { %> 
			            <input class='btn-action' type="button" value="예약신청" onclick="location.href='reservationAddAction.jsp?bookNo=<%=search.getBook_no()%>'">
			            <%//}%>
			            <input class='favorite' type="button" value="관심도서 등록" onclick="location.href='favoriteAddAction.jsp?bookNo=<%=search.getBook_no()%>'">
			            </td>
					</tr>
					<!-- 책정보 끝 -->
				</table>
					
					<hr>
			</form>
		
			</div>
	<!-- include_content.jsp end-->
	<!-- content end -->
	</div>
	<!--wrapper end-->
	<div id="footer">
		<!-- include_common_bottom.jsp start-->
		<!-- jsp:include page="include_common_bottom.jsp" /-->
		<!-- include_common_bottom.jsp end-->
	</div>
	</div>
	<!--container end-->

</body>
</html>

