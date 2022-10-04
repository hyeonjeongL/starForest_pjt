<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//String u_id = (String)session.getAttribute("sUserId");
	


%>
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
   integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
   integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.css" />
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css" />
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
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"
   integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
   crossorigin="anonymous"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
   integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
   crossorigin="anonymous"></script>
   <nav
      class="navbar sticky-top navbar-expand-sm navbar-light bg-light p-0">
      <div class="container container-fluid">
         <a href="Home.do" class="navbar-brand"><img alt="별숲도서관"
            src="img/color.png" height="30" width="50" class="pl-3 mb-1"></a>
         <button class="navbar-toggler" data-toggle="collapse"
            data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse noto-serif" id="navbarCollapse">
            <ul class="navbar-nav ml-0" id="home-nav">
               <li class="nav-item dropdown"><a href="howtoInfo.do"
                  class="nav-link dropdown-toggle" data-toggle="dropdown">도서관소개</a>
                  <ul class="dropdown-menu dropdown-menu-left fade-down">
                     <li><a class="dropdown-item" href="howtoInfo.do">
                           대출/반납/연장</a></li>
                     <li><a class="dropdown-item" href="postList.do?group=10">
                           공지사항 </a></li>
                     <li><a class="dropdown-item" href="faqViewpage.do">
                           자주묻는질문</a></li>
                     <li><a class="dropdown-item" href="QnaList.do"> 묻고답하기 </a></li>
                     <li><a class="dropdown-item" href="addrViewpageAPI.do">
                           오시는길 </a></li>
                  </ul></li>
               <li class="nav-item dropdown"><a href="SearchResult.do"
                  class="nav-link dropdown-toggle" data-toggle="dropdown">도서정보</a>
                  <ul class="dropdown-menu dropdown-menu-left fade-down">
                     <li><a class="dropdown-item" href="SearchResult.do">도서
                           검색</a></li>
                     <li><a class="dropdown-item" href="recommendedBooks.do">사서추천도서</a></li>
                     <li><a class="dropdown-item" href="Newbooks.do">신착도서</a></li>
                     <li><a class="dropdown-item" href="popularBook.do">이달의
                           인기도서</a></li>
                  </ul></li>
               <li class="nav-item dropdown"><a href="postList.do?group=20"
                  class="nav-link dropdown-toggle" data-toggle="dropdown">커뮤니티</a>
                  <ul class="dropdown-menu dropdown-menu-left fade-down">
                     <li><a class="dropdown-item"
                        href="postList.do?option=p_title&search=&group=20">창작물게시판</a></li>
                     <li><a class="dropdown-item"
                        href="postList.do?option=p_title&search=&group=30">중고장터</a></li>
                     <li><a class="dropdown-item"
                        href="postList.do?option=p_title&search=&group=60">자유게시판</a></li>
                  </ul></li>
               <li class="nav-item dropdown"><a
                  href="mypage_main.do?cust_no=${cust_no }"
                  class="nav-link dropdown-toggle mypage" data-toggle="dropdown">나의도서</a>
                  <ul class="dropdown-menu dropdown-menu-left fade-down">
                     <li><a class="dropdown-item mypage"
                        href="mypage_main.do?cust_no=${cust_no }"> 나의도서정보</a></li>
                     <li><a class="dropdown-item mypage" href="borrowList.do">대출현황</a></li>
                     <li><a class="dropdown-item mypage"
                        href="return_borrowList.do">대출/반납이력</a></li>
                     <li><a class="dropdown-item mypage"
                        href="MyPage_Folder.do?cust_no=${cust_no }&group=50">내서재</a></li>
                     <li><a class="dropdown-item mypage"
                        href="MyPage_Info.do?cust_no=${cust_no }">개인정보수정</a></li>
                  </ul></li>
                 <li class="nav-item dropdown"><a
                  href="seatReservation_list.do"
                  class="nav-link dropdown-toggle mypage" >열람실예약</a>
            </ul>
            <ul id="app" class="navbar-nav ml-auto">
               <c:if test="${cust_no == 1}">
                  <li class="nav-item" v-bind:title="mamagerpage"><a
                     href="ManagerPage.do" class="nav-link"><i
                        class="fas fa-crown" style="color: #107637;"></i></a>
                  <p class="sr-only">관리자페이지</p></li>
               </c:if>
               <c:if test="${cust_no != 1 && cust_no != null }">
                  <li class="nav-item p-1"><small class="text-dark">${cust_name}
                        님</small></li>
               </c:if>
               <c:if test="${cust_no == null}">
                  <li class="nav-item" v-bind:title="login"><a
                     href="LoginPage.do" class="nav-link"><i
                        class="fas fa-sign-in-alt"></i></a>
                  <p class="sr-only">로그인</p></li>
                  <li class="nav-item" v-bind:title="signup"><a
                     href="insertCustomer.do" class="nav-link"><i
                        class="fas fa-user-plus"></i></a>
                  <p class="sr-only">회원가입</p></li>
               </c:if>
               <c:if test="${cust_no != null}">
                  <li class="nav-item" v-bind:title="logout"><a
                     href="logout.do" class="nav-link"><i
                        class="fas fa-sign-out-alt"></i></a>
                  <p class="sr-only">로그아웃</p></li>
               </c:if>
               <li class="nav-item " v-bind:title="bookcart"><a
                  href="BookCart.do" class="nav-link mypage"><i class="fas fa-book"></i></a>
               <p class="sr-only">북카트</p></li>
               <li class="nav-item" v-bind:title="sitemap"><a
                  href="siteMap.do" class="nav-link"><i class="fas fa-map"></i></a>
               <p class="sr-only">사이트맵</p></li>
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