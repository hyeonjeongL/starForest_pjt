<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//String u_id = (String)session.getAttribute("sUserId");
	


%>
   <nav
      class="navbar sticky-top navbar-expand-sm navbar-light bg-light p-0">
      <div class="container container-fluid">
         <a href="Home" class="navbar-brand"><img alt="별숲도서관"
            src="img/color.png" height="30" width="50" class="pl-3 mb-1"></a>
         <button class="navbar-toggler" data-toggle="collapse"
            data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse noto-serif" id="navbarCollapse">
            <ul class="navbar-nav ml-0" id="home-nav">
               <li class="nav-item dropdown"><a href="howtoInfo"
                  class="nav-link dropdown-toggle" data-toggle="dropdown">도서관소개</a>
                  <ul class="dropdown-menu dropdown-menu-left fade-down">
                     <li><a class="dropdown-item" href="howtoInfo">
                           대출/반납/연장</a></li>
                     <li><a class="dropdown-item" href="postList?group=10">
                           공지사항 </a></li>
                     <li><a class="dropdown-item" href="faqViewpage">
                           자주묻는질문</a></li>
                     <li><a class="dropdown-item" href="QnaList"> 묻고답하기 </a></li>
                     <li><a class="dropdown-item" href="addrViewpageAPI">
                           오시는길 </a></li>
                  </ul></li>
               <li class="nav-item dropdown"><a href="SearchResult"
                  class="nav-link dropdown-toggle" data-toggle="dropdown">도서정보</a>
                  <ul class="dropdown-menu dropdown-menu-left fade-down">
                     <li><a class="dropdown-item" href="SearchResult">도서
                           검색</a></li>
                     <li><a class="dropdown-item" href="recommendedBooks">사서추천도서</a></li>
                     <li><a class="dropdown-item" href="Newbooks">신착도서</a></li>
                     <li><a class="dropdown-item" href="popularBook">이달의
                           인기도서</a></li>
                  </ul></li>
               <li class="nav-item dropdown"><a href="postList?group=20"
                  class="nav-link dropdown-toggle" data-toggle="dropdown">커뮤니티</a>
                  <ul class="dropdown-menu dropdown-menu-left fade-down">
                     <li><a class="dropdown-item"
                        href="postList?option=p_title&search=&group=20">창작물게시판</a></li>
                     <li><a class="dropdown-item"
                        href="postList?option=p_title&search=&group=30">중고장터</a></li>
                     <li><a class="dropdown-item"
                        href="postList?option=p_title&search=&group=60">자유게시판</a></li>
                  </ul></li>
               <li class="nav-item dropdown"><a
                  href="mypage_main?cust_no=${cust_no }"
                  class="nav-link dropdown-toggle mypage" data-toggle="dropdown">나의도서</a>
                  <ul class="dropdown-menu dropdown-menu-left fade-down">
                     <li><a class="dropdown-item mypage"
                        href="mypage_main"> 나의도서정보</a></li>
                     <li><a class="dropdown-item mypage" href="borrowList">대출현황</a></li>
                     <li><a class="dropdown-item mypage"
                        href="return_borrowList">대출/반납이력</a></li>
                     <li><a class="dropdown-item mypage"
                        href="MyPage_Folder?cust_no=${cust_no }&group=50">내서재</a></li>
                     <li><a class="dropdown-item mypage"
                        href="MyPage_Info?cust_no=${cust_no }">개인정보수정</a></li>
                  </ul></li>
                   <li class="nav-item dropdown"><a href="SearchResult"
                  class="nav-link dropdown-toggle" data-toggle="dropdown">열람실</a>
                  <ul class="dropdown-menu dropdown-menu-left fade-down">
                     <li><a class="dropdown-item" href="seatReservation">열람실예약</a></li>
                     <li><a class="dropdown-item" href="seatReservation">예약확인</a></li>
            	  </ul>
            
            <ul id="app" class="navbar-nav ml-auto">
               <c:if test="${cust_no == 1}">
                  <li class="nav-item" v-bind:title="mamagerpage"><a
                     href="ManagerPage" class="nav-link"><i
                        class="fas fa-crown" style="color: #107637;"></i></a>
                  <p class="sr-only">관리자페이지</p></li>
               </c:if>
               <c:if test="${cust_no != 1 && cust_no != null }">
                  <li class="nav-item p-1"><small class="text-dark">${cust_name}
                        님</small></li>
               </c:if>
               <c:if test="${cust_no == null}">
                  <li class="nav-item" v-bind:title="login"><a
                     href="LoginPage" class="nav-link"><i
                        class="fas fa-sign-in-alt"></i></a>
                  <p class="sr-only">로그인</p></li>
                  <li class="nav-item" v-bind:title="signup"><a
                     href="insertCustomer" class="nav-link"><i
                        class="fas fa-user-plus"></i></a>
                  <p class="sr-only">회원가입</p></li>
               </c:if>
               <c:if test="${cust_no != null}">
                  <li class="nav-item" v-bind:title="logout"><a
                     href="logout" class="nav-link"><i
                        class="fas fa-sign-out-alt"></i></a>
                  <p class="sr-only">로그아웃</p></li>
               </c:if>
               <li class="nav-item " v-bind:title="bookcart"><a
                  href="BookCart" class="nav-link mypage"><i class="fas fa-book"></i></a>
               <p class="sr-only">북카트</p></li>
               <li class="nav-item" v-bind:title="sitemap"><a
                  href="siteMap" class="nav-link"><i class="fas fa-map"></i></a>
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