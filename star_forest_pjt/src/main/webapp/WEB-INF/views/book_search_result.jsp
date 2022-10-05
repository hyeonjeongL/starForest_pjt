<%@page import="com.itwill.domain.Search"%>
<%@page import="com.itwill.util.PageMakerDto"%>
<%@page import="com.itwill.service.SearchServiceImpl"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
  <!-- 구글폰트 전체 기본적용 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap" rel="stylesheet">
	<!-- 구글폰트 전체 기본적용 END -->
  <link rel="stylesheet" href="css/style.css">
  <!-- <script src="https://cdn.jsdelivr.net/npm/vue"></script> -->
  <title>도서정보 - 별숲도서관</title>
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
<!-- kakao 검색 API -->
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"crossorigin="anonymous"></script>

<script type="text/javascript">
	$(function() {
		
	});
</script>

<style type="text/css">
	/* Lazy Load Styles */
	.card-image {
		display: block;
		background: #fff center center no-repeat;
		background-size: cover;
		margin: 0 auto;
		/* filter: blur(3px); /* blur the lowres image */ */
	}
	
	.card-image > img {
		display: block;
		width: 100%;
		opacity: 0; /* visually hide the img element */
	
	}
	
	.card-image.is-loaded {
		filter: none; /* remove the blur on fullres image */
		transition: filter 1s;
		margin: 0 auto;
	}
	
	/* Layout Styles */
	
	.card-list {
		display: block;
		padding: 0;
		font-size: 0;
		text-align: center;
		list-style: none;
		width: 825px;
	}
	
	.card-body {
		padding: 0;
	}
	
	.card {
		display: inline-block;
		width: 200px;
		height: 250px;
		margin: 1rem;
		font-size: 1rem;
		text-decoration: none;
		overflow: hidden;
		box-shadow: 0 0 3rem -1rem rgba(0, 0, 0, 0.5);
		transition: transform 0.1s ease-in-out, box-shadow 0.1s;
	}
	
	.card:hover {
		transform: translateY(-0.5rem) scale(1.0125);
		box-shadow: 0 0.5em 3rem -1rem rgba(0, 0, 0, 0.5);
	}
	
	.card-description {
		display: block;
		color: #515151;
		width: 200px;
		height: 100px;
		text-align: center;
	}
	
	.card-description > h4 {
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		font-size: large;
		font-weight: bold;
	}
	
	.searchResult-body {
		float: left;
		width: 100%;
	}
	
	.searchResult-options {
		margin-left: 150px;
		float: left;
		width: 20%;
		text-align: center;
	}
	
	.paging {
		margin: 0 auto;
		text-align: center;
		width: 100%;
		float: left;
	}
	
	.paging-num {
		margin: 0 10px;
	}
	
	.input-group {
		height: 26px;
		padding: 25px 5px 25px 5px;
		border: 1px; 
		float: left;
	}
	
	.searchResult-body {
		float: left;
	}
</style>
</head>
<body class="d-flex flex-column">
	<input type="hidden" value="${query}" id="query">
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
					  <h2>도서검색</h2>
					</div>
				  </div>
				</div>
			</div>
		</header>
	
 <!-- MAIN SECTION -->
		<section id="contact" class="py-3">
			<div class="container">
				<div class="row">
					<!-- 사이드바 -->
					<div class="col-md-3 noto-serif mb-3">
						<div class="sidebar">
							<div class="side-head">
								<h4 class="text-light">도서검색</h4>
							</div>
							<ul class="list-group list-group-flush mb-5">
                  <li class="list-group-item active"><a href="SearchResult.do">도서검색</a></li>
                  <li class="list-group-item"><a href="recommendedBooks.do">사서추천도서</a></li>
                  <li class="list-group-item"><a href="Newbooks.do">신착도서</a></li>                  
                  <li class="list-group-item"><a href="popularBook.do">이달의 인기도서</a></li>
               </ul>
						</div>
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
	<div style="clear: both"></div>

  <!-- .footer-navigation -->
	<!-- footer start-->
	<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="common/include_common_bottom_templateVer.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
	<!-- footer end-->
</body>
</html>