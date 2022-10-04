<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
    crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<!-- 구글폰트 전체 기본적용 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap" rel="stylesheet">
	<!-- 구글폰트 전체 기본적용 END -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
<link rel="stylesheet" type="text/css" href="css/wang_hw.css">
<link rel="stylesheet" type="text/css" href="css/delete_btn_hw.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script type="text/javascript">

/*************************************************************************
 * 창 새로 고침 할때 폴더가 계속 생성되는것을 막기 위한, 새로고침 할때 폼태그 양식 재제출 방지 코드 *
 *************************************************************************/
if ( window.history.replaceState ) {
    window.history.replaceState( null, null, "MyPage_Folder.do?user_id="+${user_id});
}

$(function(){
	/*************************************************************************
	 * 관리 버튼 눌렀을때 체크박스 띄우면서 삭제할 부분 띄우기 *
	 *************************************************************************/
	$("#manage_btn").click(function(){
		$("div.btn-front").toggle('fast');
		$("input.delete_check").toggle('fast');
		
		$(".delete_check").css('display','inline-block');
		$(".btn").css('display','inline-block');
		$(".btn").css('margin-top','-17px');
		$(".btn").css('margin-left','-10px');
		$(".btn-front").css('display','block');
		var btn = document.querySelector( '.btn' );
	
		var btnFront = btn.querySelector( '.btn-front' ),
		    btnYes = btn.querySelector( '.btn-back .yes' ),
		    btnNo = btn.querySelector( '.btn-back .no' );
	
		btnFront.addEventListener( 'click', function( event ) {
		  var mx = event.clientX - btn.offsetLeft,
		      my = event.clientY - btn.offsetTop;
	
		  var w = btn.offsetWidth,
		      h = btn.offsetHeight;
			
		  var directions = [
		    { id: 'top', x: w/2, y: 0 },
		    { id: 'right', x: w, y: h/2 },
		    { id: 'bottom', x: w/2, y: h },
		    { id: 'left', x: 0, y: h/2 }
		  ];
		  
		  directions.sort( function( a, b ) {
		    return distance( mx, my, a.x, a.y ) - distance( mx, my, b.x, b.y );
		  } );
		  
		  btn.setAttribute( 'data-direction', directions.shift().id );
		  btn.classList.add( 'is-open' );
	
		} );
	
		btnYes.addEventListener( 'click', function( event ) {	
		  btn.classList.remove( 'is-open' );
		} );
	
		btnNo.addEventListener( 'click', function( event ) {
		  btn.classList.remove( 'is-open' );
		} );
	
		function distance( x1, y1, x2, y2 ) {
		  var dx = x1-x2;
		  var dy = y1-y2;
		  return Math.sqrt( dx*dx + dy*dy );
		}
	});	
	
	$(".yes").click(function(){
		var check_val_arr = [];
		
		$('input:checked').each(function(i){
			check_val_arr.push($(this).val());
		})
		
		var data = {"fol_no_arr" : check_val_arr};
	
	    $.ajax({
	         url:"/deleteMyPage_folder",
	         data:data, type:"POST",
	         success:function(res){
	        if(res == 1) {
	           alert('삭제가 완료 되었습니다.');
		       location.href = "http://localhost:8088/MyPage_Folder.do?group=50&cust_no="+${cust_no};
	        }
	        else if(res == -1){
	           alert('삭제에 실패하였습니다.');
	        }
	        else if(res == -2){
				alert('삭제가 완벽히 완료되지않았습니다. 폴더를 확인해주세요.');
		        location.href = "http://localhost:8088/MyPage_Folder.do?group=50&cust_no="+${cust_no};
	        }
			console.log(check_val_arr);
	   }}); 
	});

	window.onload = function() {
	    function onClick() {
	        document.querySelector('.modal_wrap_fol').style.display ='block';
	        document.querySelector('.black_bg_fol').style.display ='block';
	    }   
	    function offClick() {
	        document.querySelector('.modal_wrap_fol').style.display ='none';
	        document.querySelector('.black_bg_fol').style.display ='none';
	    }
	 
	    document.getElementById('modal_btn_fol').addEventListener('click', onClick);
	    document.querySelector('.modal_close').addEventListener('click', offClick);
	};	

	$("#btn_fol_add").click(function(){
		var fol_title = $("#fol_title_text").val();
		console.log(fol_title);
	});
});
</script>
<title>나의서재 - 딜리브러리</title>

</head>

<body class="d-flex flex-column">
	<div id="page-content">
		<nav class="navbar sticky-top navbar-expand-sm navbar-light bg-light p-0">
			<div class="container">
				<a href="Home.do" class="navbar-brand"><img alt="딜리브러리" src="img/logo_sm.png" height="20" class="pl-3 mb-1"></a>
				<button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse noto-serif" id="navbarCollapse">
				<ul class="navbar-nav ml-4">
					<li class="nav-item dropdown">
						<a href="howtoInfo.do" class="nav-link dropdown-toggle" data-toggle="dropdown">도서관소개</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="howtoInfo.do"> 대출/반납/연장</a></li>
								<li><a class="dropdown-item" href="postList.do?group=10"> 공지사항 </a></li>
								<li><a class="dropdown-item" href="faqViewpage.do"> 자주묻는질문</a></li>
								<li><a class="dropdown-item" href="QnaList.do"> 묻고답하기 </a></li>
								<li><a class="dropdown-item" href="addrViewpageAPI.do"> 오시는길 </a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="SearchResult.do" class="nav-link dropdown-toggle" data-toggle="dropdown">도서정보</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="SearchResult.do">도서 검색</a></li>
								<li><a class="dropdown-item" href="recommendedBooks.do">사서추천도서</a></li>
								<li><a class="dropdown-item" href="Newbooks.do">신착도서</a></li>
								<li><a class="dropdown-item" href="popularBook.do">이달의 인기도서</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="postList.do?group=20" class="nav-link dropdown-toggle" data-toggle="dropdown">커뮤니티</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="postList.do?group=20">창작물게시판</a></li>
								<li><a class="dropdown-item" href="postList.do?group=30">중고장터</a></li>
								<li><a class="dropdown-item" href="Postlist.do?group=60">자유게시판</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="mypage_main.do?cust_no=${cust_no }" class="nav-link dropdown-toggle" data-toggle="dropdown">나의도서</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="mypage_main.do?cust_no=${cust_no }"> 나의도서정보</a></li>
								<li><a class="dropdown-item" href="borrowList.do">대출현황</a></li>
								<li><a class="dropdown-item" href="return_borrowList.do">대출/반납이력</a></li>
								<li><a class="dropdown-item" href="MyPage_Folder.do?cust_no=${cust_no }&group=50">내서재</a></li>
								<li><a class="dropdown-item" href="MyPage_Info.do?cust_no=${cust_no }">개인정보수정</a></li>
							</ul>
					</li>
				</ul>
				<ul id="app" class="navbar-nav ml-auto">
					<c:if test="${cust_no == 1}">
						<li class="nav-item" v-bind:title="mamagerpage">
							<a href="ManagerPage.do" class="nav-link"><i class="fas fa-crown" style="color: #107637;"></i></a><p class="sr-only">관리자페이지</p>
						</li>
					</c:if>
					<c:if test="${cust_no != 1 && cust_no != null }">
						 <li class="nav-item p-1"><small class="text-dark">${cust_name} 님</small></li>
					</c:if>
					<c:if test="${cust_no == null}">
						<li class="nav-item" v-bind:title="login">
							<a href="LoginPage.do" class="nav-link"><i class="fas fa-sign-in-alt"></i></a><p class="sr-only">로그인</p>
						</li>
						<li class="nav-item" v-bind:title="signup">
							<a href="insertCustomer.do" class="nav-link"><i class="fas fa-user-plus"></i></a><p class="sr-only">회원가입</p>
						</li>
					</c:if>
					<c:if test="${cust_no != null}">
						<li class="nav-item" v-bind:title="logout">
							<a href="logout.do" class="nav-link"><i class="fas fa-sign-out-alt"></i></a><p class="sr-only">로그아웃</p>
						</li>
					</c:if>
					<li class="nav-item" v-bind:title="bookcart">
						<a href="BookCart.do" class="nav-link"><i class="fas fa-book"></i></a><p class="sr-only">북카트</p>
					</li>
					<li class="nav-item" v-bind:title="sitemap">
						<a href="siteMap.do" class="nav-link"><i class="fas fa-map"></i></a><p class="sr-only">사이트맵</p>
					</li>
					<script>
						var app = new Vue({
							el: '#app',	
							data: {
								login: '로그인',
								signup: '회원가입',
								bookcart: '북카트',
								sitemap: '사이트맵',
								logout: '로그아웃',
								mamagerpage: '관리자페이지'
							}});
					</script>
				</ul>
			</div>
		</div>
	</nav>
	
	<!-- PAGE HEADER -->
	<header id="page-header" class="noto-serif">
		<div class="page-header-overlay">
			<div class="container pt-5">
			  <div class="row">
				<div class="col-md-6 m-auto text-center">
				  <h2>내서재</h2>
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
			<div class="col-md-3 noto-serif">
			  <div class="sidebar">
					<div class="side-head">
						<h4 class="text-light">나의도서</h4>
					</div>
					<ul class="list-group list-group-flush mb-5">
						<li class="list-group-item"><a href="mypage_main.do?cust_no=${cust_no }">나의도서정보</a></li>
						<li class="list-group-item"><a href="borrowList.do">대출현황</a></li>
						<li class="list-group-item"><a href="return_borrowList.do">대출/반납이력</a></li>
						<li class="list-group-item active"><a href="MyPage_Folder.do?cust_no=${cust_no }&group=50">내서재</a></li>						
						<li class="list-group-item"><a href="MyPage_Info.do?cust_no=${cust_no }">개인정보수정</a></li>
					</ul>
					
			  </div>
      </div>

      <!-- 메인내용 -->
        <div class="col-md-9 fol_div">
       		<input type="hidden" name="cust_no" value="${c.cust_no }">
         	<div class="card noto-serif">
         		<div class="card-body" id="fol_card">
					<p id="fol_card_name">${c.name } 님의 서재</p>
         		</div>
			</div>
			
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-6" id="fol_list_title">
					<form action="MyPage_Folder.do" method="post">
		   				<font style="font-size: x-large; font-weight: bold; font-family: 'Noto Serif KR', serif;" >내서재</font>
						<input type="hidden" value="${c.cust_no }" name="cust_no">
						<input type="hidden" value=50 name="group">
						
					</form>
		        </div>
			        
			        <div class="col-sm-6">
					<!-- Search -->  	
			    	<form action="MyPage_Folder_search.do" method="post">
						<div class="menu-search">
				          
				          <div class="catalog-search">
				          <input type="hidden" value="${c.cust_no}" name="cust_no">
				          <input type="hidden" value=50 name="group">
				            <label class="input_label" for="input-search">
				              <span class="input_label-content"></span>
				              <span class="input_label-search"></span>
				            </label>
				          </div>
				        </div>
			        </form>
		       	</div>	
	       	</div>
       	</div>
	        <hr>
	        <div style="text-align: left;">
	        <div class="col-lg-9">

											<div
												class="items-header directory-header d-flex justify-content-lg-between align-items-baseline">
												<h4 class="selected-dir-name">전체</h4>
												<div class="item-count">
													<span class="number">${favorite.length}</span>건
												</div>
											</div>
											<!-- .items-header -->

											<div class="e-items list">

												<div class="e-item item-headings" style="width:20%;">
													<div class="item-index">번호</div>
													<div class="item-data">ISBN</div>
													<div class="item-data">제목</div>
													<div class="item-data">저자</div>
													<div class="item-data">출판사</div>
													<div class="item-functions">작업</div>
												</div>
												<!-- .item-headings -->
												<c:if test="${favoriteList.size() == 0}">			
													<div class="content">등록된 서재목록이 없습니다. 내서재에 등록해주세요 🙂</div>								
												</c:if>
												<c:forEach var="favorite" items="${favoriteList}">
													<div class="e-item d-md-flex align-items-center">
													<div class="item-no">${favorite.favorite_no}</div>
													<div class="item item-data d-flex">
														<div class="item-cover">
															<a href="/detail/?cid=CAT000000949038&ctype=m"></a>
														</div>
														<div class="item-meta">
															<div class="item-isbn">${favorite.book.isbn}</div>
															<div class="item-title">
																<h4>
																	<a href="/detail/?cid=CAT000000949038&ctype=m">${favorite.book.book_title}</a>
																</h4>
															</div>
															<div class="item-author">${favorite.book.book_author}</div>
															<div class="item-pub">${favorite.book.book_publisher}</div>
														</div>
													</div>
													<div class="item-functions">
														<a role="button"
															class="btn btn-sm btn-primary favorite_item-del-trigger"
															item-val="234279">삭제</a>
													</div>
												</div>
												<!-- item : 1 -->
												</c:forEach>
												

											</div>
											<!-- .e-items.list -->
										<div class="favorite_delete">
											<div class="back-to-main">
												<c:if test="${favoriteList.size()!=0}">
													<a href="#" class="btn btn-primary favorite_item_del_btn">전체삭제</a>
												</c:if>
											</div>
										</div>
										
										</div>
			<button id="manage_btn">관리</button>
	       		<div class="btn">
	       		
				  <div class="btn-back">
				    <p>정말 삭제 하시겠습니까?</p>
				    <button class="yes">Yes</button>
				    <button class="no">No</button>
				  </div>
				  <div class="btn-front">삭제</div>
				</div>
	       	  
			</div>
        </div>
      </div>
    </div>
  </section>
</div>

  <!-- FOOTER -->
  <footer id="main-footer" class="text-center p-4 noto-serif">
    <div class="container">
      <div class="row">
      	<div class="col-md-12 pb-2">
	      	<!--  책 관련된 명언 랜덤으로 보여주기 -->
      		<p id="footer-display"></p>
    		</div>
        <div class="col-md-12">
          <p>Copyright &copy;
            <span id="year"></span> Delibrary</p>
        </div>
      </div>
    </div>
  </footer>
  
  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>

	<script type="text/javascript">
		// Get the current year for the copyright
		$('#year').text(new Date().getFullYear());

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