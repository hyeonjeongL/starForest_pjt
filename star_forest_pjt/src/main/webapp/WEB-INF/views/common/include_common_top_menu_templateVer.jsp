<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.itwill.domain.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//String u_id = (String)session.getAttribute("sUserId");
%>
<link rel="stylesheet" href="static/css/style.css">
<nav
	class="navbar sticky-top navbar-expand-sm navbar-light bg-light p-0">
	<div class="container container-fluid">
		<a href="Home" class="navbar-brand"><img alt="별숲도서관"
			src="static/img/starForestLogo.png" height="50" width="90" class="pl-3 mb-1"></a>
		<button class="navbar-toggler" data-toggle="collapse"
			data-target="#navbarCollapse">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse noto-serif" id="navbarCollapse">
			<ul class="navbar-nav ml-0" id="home-nav">
				<li class="nav-item dropdown"><a href="howtoInfo"
					class="nav-link dropdown-toggle" data-toggle="dropdown">도서관소개</a>
					<ul class="dropdown-menu dropdown-menu-left fade-down">
						<li><a class="dropdown-item" href="howtoInfo"> 대출/반납/연장</a></li>
						<li><a class="dropdown-item" href="postList?group=10">
								공지사항 </a></li>
						<li><a class="dropdown-item" href="faqViewpage"> 자주묻는질문</a></li>
						<li><a class="dropdown-item" href="QnaList"> 묻고답하기 </a></li>
						<li><a class="dropdown-item" href="addrViewpageAPI"> 오시는길
						</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a href="SearchResult"
					class="nav-link dropdown-toggle" data-toggle="dropdown">도서정보</a>
					<ul class="dropdown-menu dropdown-menu-left fade-down">
						<li><a class="dropdown-item" href="SearchResult">도서 검색</a></li>
						<li><a class="dropdown-item" href="recommendedBooks">사서추천도서</a></li>
						<li><a class="dropdown-item" href="Newbooks">신착도서</a></li>
						<li><a class="dropdown-item" href="popularBook">이달의 인기도서</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a href="postList?group=20"
					class="nav-link dropdown-toggle" data-toggle="dropdown">커뮤니티</a>
					<ul class="dropdown-menu dropdown-menu-left fade-down">
						<li><a class="dropdown-item"
							href="bookclub">도서동아리</a></li>
						<li><a class="dropdown-item"
							href="postList?option=p_title&search=&group=20">창작물게시판</a></li>
						<li><a class="dropdown-item"
							href="postList?option=p_title&search=&group=30">중고장터</a></li>
						<li><a class="dropdown-item"
							href="postList?option=p_title&search=&group=60">자유게시판</a></li>
							<li><a class="dropdown-item" href="requestBoard"
							id="menu_RequestBoard">도서신청게시판</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a href="myLibrary"
					class="nav-link dropdown-toggle mypage"
					data-toggle="dropdown">나의도서</a>
					<ul class="dropdown-menu dropdown-menu-left fade-down">
						<li><a id="mypage" class="dropdown-item mypage" href="#">
								마이페이지</a></li>
						<li><a id="user_rental_list" class="dropdown-item mypage"
							href="#"> 나의도서정보</a></li>
						<li><a id="user_rental_status" class="dropdown-item mypage"
							href="#">대출현황</a></li>
						<li><a id="user_res_status" class="dropdown-item mpage"
							href="#">예약현황</a></li>
						<li><a id="user_club_list" class="dropdown-item mpage"
							href="#">동아리신청내역</a></li>
						<li><a id="user_request_list" class="dropdown-item mypage"
							href="#">희망도서신청내역</a></li>
						<li><a id="#" class="dropdown-item mypage"
							href="myLibrary">내서재</a></li>
					</ul></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown">열람실</a>
					<ul class="dropdown-menu dropdown-menu-left fade-down">
						<li><a class="dropdown-item" href="seatReservation"
							id="menu_seatReservation">열람실예약</a></li>
						<li><a class="dropdown-item" href="seatReservation_my">예약확인</a></li>
					</ul></li>
			</ul>


			<ul id="app" class="navbar-nav ml-auto">
				<c:if test="${user_id == admin}">
					<li class="nav-item" v-bind:title="managerpage"><a
						href="ManagerPage" class="nav-link"><i class="fas fa-crown"
							style="color: #107637;"></i></a>
						<p class="sr-only">관리자페이지</p></li>
				</c:if>
				<c:if test="${user_id != admin && user_id != null }">
					<li class="nav-item p-1"><small class="text-dark">${user_id}
							님</small></li>
				</c:if>
				<c:if test="${user_id == null}">
					<li class="nav-item" v-bind:title="login">
					<a href="user" class="nav-link"><i class="fas fa-sign-in-alt"></i></a>
						<p class="sr-only">로그인</p></li>
					<li class="nav-item" v-bind:title="signup">
					<a href="insertCustomer" class="nav-link"><i class="fas fa-user-plus"></i></a>
						<p class="sr-only">회원가입</p></li>
				</c:if>
				<c:if test="${user_id != null}">
					<li class="nav-item" v-bind:title="logout">
					<a href="Home" class="nav-link"><i class="fas fa-sign-out-alt"></i></a>
						<p class="sr-only">로그아웃</p></li>
				</c:if>
				
				
			</ul>
		</div>
	</div>
</nav>