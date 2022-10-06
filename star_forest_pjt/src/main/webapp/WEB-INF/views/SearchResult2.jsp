<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

   
<style>
 li { position:relative; }
li:hover { background:#eee; }     
li > ul.low { display:none; position:absolute; top:0; left:180px;  }
 li:hover > ul.low { display:block; }
li:hover > ul.low li a { background:#eee; border:1px solid #eee; }
 li:hover > ul.low li a:hover { background:#fff;}
 li > ul.low li { width:180px; }
</style>

<style>
   ul li { display:inline-block; margin:10px; }
   section#content div.book_image_src img { width:200px; height:200px; }
   section#content div.book_title { padding:10px 0; text-align:center; }
   section#content div.book_title a { color:#000; }
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
                  <li class="list-group-item active"><a href="SearchResult">도서검색</a></li>
                  <li class="list-group-item active"><a href="SearchList">전체 도서</a>
	                  <ul class="low">
		                  <li><a href="/star_forest_pjt/SearchList/list?c=100&l=2">100 건강/취미/레저</a></li>
		                  <li><a href="/star_forest_pjt/SearchList/list?c=200&l=2">200 경제경영</a></li>
		                  <li><a href="/star_forest_pjt/SearchList/list?c=300&l=2">300 고전</a></li>
		                  <li><a href="/star_forest_pjt/SearchList/list?c=400&l=2">400 과학</a></li>
		                  <li><a href="/star_forest_pjt/SearchList/list?c=500&l=2">600 사회과학</a></li>
		                  <li><a href="/star_forest_pjt/SearchList/list?c=700&l=2">700 소설/시/희곡</a></li>
	                  </ul>
                  </li>
                  <li class="list-group-item"><a href="recommendedBooks">사서추천도서</a></li>
                  <li class="list-group-item"><a href="Newbooks">신착도서</a></li>                  
                  <li class="list-group-item"><a href="popularBook">이달의 인기도서</a></li>
               </ul>
						</div>
					</div>


					<!-- 메인내용 -->
			<div class="col-md-9">
				<div class="input-group noto-serif">
				
				<section id="content">
				<ul>
				   <c:forEach items="${list}" var="list">
				   <li>
				    <div class="book_image_src">
				     <img src="${list.book_image_src}">
				    </div>   
				    <div class="book_title">
				     <a href="/SearchList/view?n=${list.book_no}">${list.book_title}</a>
				    </div>
				   </li>
				   </c:forEach>
				</ul>
					</section>
					
				</div>
				<br><br><br>
				<!-- CARD COLUMNS -->
				<div class="searchResult-body">
					
				</div>
				<div class="paging">
					
				</div>
				
				
				
			</div>
		  </div>
		</div>
	</section>
	</div>
	
	<div style="clear: both"></div>
<div>

	<c:if test="${page.prev}">
		<span>[ <a href="/board/listPage?num=${page.startPageNum - 1}">이전</a> ]</span>
	</c:if>
	
	<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
		<span>
		
			<c:if test="${select != num}">
				<a href="/board/listPage?num=${num}">${num}</a>
			</c:if> 			
			
			<c:if test="${select == num}">
				<b>${num}</b>
			</c:if>
	 			
		</span>
	</c:forEach>
	
	<c:if test="${page.next}">
		<span>[ <a href="/board/listPage?num=${page.endPageNum + 1}">다음</a> ]</span>
	</c:if>
	
	
	<%-- <c:forEach begin="1" end="${pageNum}" var="num">
  		<span>
  			<a href="/board/listPage?num=${num}">${num}</a>
		</span>
	</c:forEach> --%>
</div>
  <!-- .footer-navigation -->
	<!-- footer start-->
	<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="common/include_common_bottom_templateVer.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
	<!-- footer end-->

  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
      <script type="text/javascript"   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <script type="text/javascript"   src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>
  <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());

    $('.slider').click({
      infinite: true,
      slideToShow: 1,
      slideToScroll: 1
    });
  </script>
  
  <script type="text/javascript">
      window.onload = function() {
         //푸터 명언
         const footer_display = document.getElementById('footer-display');
         const quotes = ['좋은 책은 인류에게 불멸의 정신이다. — J. 밀턴', '내가 인생을 알게 된 것은 사람과 접촉해서가 아니라 책과 접하였기 때문이다. — A. 프 랜스', '목적이 없는 독서는 산보일 뿐이다. — B. 리튼', '사람은 책을 만들고, 책은 사람을 만든다. — 신용호','기회를 기다리는 것은 바보짓이다. 독서의 시간이라는 것은 지금 이 시간이지 결코 이제부터가 아니다. 오늘 읽을 수 있는 책을 내일로 넘기지 말라. — H. 잭슨','책은 한 권 한 권이 하나의 세계다. — W. 워즈워스', '책을 한 권 읽으면 한 권의 이익이 있고, 책을 하루 읽으면 하루의 이익이 있다. — 괴문절'];
         const getQuote = Math.floor(Math.random() * quotes.length);
         footer_display.textContent = quotes[getQuote];
      }   

      <!-- 미로그인시 글쓰기 버튼 누르면 로그인페이지로 이동 -->
	
   </script>
</body>
</html>