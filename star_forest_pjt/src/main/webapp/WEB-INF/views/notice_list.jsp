<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
  <!-- 구글폰트 전체 기본적용 -->
  <link rel="icon" type="image/png" sizes="16x16"
	href="favicon/star.png">
   <link rel="preconnect" href="https://fonts.gstatic.com">
   <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap" rel="stylesheet">
   <!-- 구글폰트 전체 기본적용 END -->
   <link rel="stylesheet" href="css/style.css">
   <link rel="stylesheet" href="css/faq.css">
   <script src="https://cdn.jsdelivr.net/npm/vue"></script>
   <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
     </script>
  <title>도서관소개 - 별숲도서관</title>
</head>

<body class="d-flex flex-column">
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
                 <h2>공지사항</h2>
               </div>
              </div>
            </div>
         </div>
      </header>
		
   <%-- <!-- 커뮤니티 헤더 -->
   <header id="page-header" class="noto-serif">
   <div class="page-header-overlay">
      <div class="container pt-5">
        <div class="row">
            <div class="col m-auto text-center">
              <c:if test="${group_no eq 10}">
                  <h2>공지사항</h2>
               </c:if>
              <c:if test="${group_no eq 20}">
                  <h2>창작물 게시판</h2>
               </c:if>
               <c:if test="${group_no eq 30}">
                  <h2>중고장터</h2>
               </c:if>
               <c:if test="${group_no eq 40}">
                  <h2>묻고답하기</h2>
               </c:if>
               <c:if test="${group_no eq 60}">
                  <h2>자유게시판</h2>
               </c:if>
            </div>
        </div>
      </div>
   </div>
   </header> --%>
   
   <!-- MAIN SECTION -->
   <div class="shortcodes_area section_padding_100">
        <div class="container">
            <div class="row">
            <!-- 사이드바 -->
	         <div class="col-md-3">
	            <%-- <c:choose>
	               <c:when test="${group_no eq 10 || group_no eq 40 }">
	                  <div class="sidebar">
	                     <div class="side-head">
	                        <h4 class="text-light">도서관소개</h4>
	                     </div>
	                     <ul class="list-group list-group-flush mb-5">
	                        <li class="list-group-item"><a href="howtoInfo">대출/반납/연장</a></li>
	                        <li id="post10" class="list-group-item"><a href="notice_list">공지사항</a></li>
	                        <li class="list-group-item"><a href="faqViewpage">자주묻는질문</a></li>
	                        <li class="list-group-item"><a href="QnaList?option=p_title&search=">묻고답하기</a></li>
	                        <li class="list-group-item"><a href="addrViewpageAPI">오시는길</a></li>
	                     </ul>
	                 </div>      
	               </c:when>
	               <c:otherwise> --%>
	                  <div class="sidebar">
	                     <div class="side-head">
	                        <h4 class="text-light">커뮤니티</h4>
	                     </div>
	                     <ul class="list-group list-group-flush mb-5">
	                        <li id="post20" class="list-group-item"><a href="notice_list?group_no=20" class="returnAll">창작물게시판</a></li>
	                        <li id="post30" class="list-group-item"><a href="notice_list?group_no=30" class="returnAll">중고장터</a></li>
	                        <li id="post60" class="list-group-item"><a href="notice_list?group_no=60" class="returnAll">자유게시판</a></li>
	                     </ul>
	                 </div>
	              <%--  </c:otherwise>
	            </c:choose> --%>
	         </div>
                <div class="col-md-9">
            <div class="row py-4">
            <div class="col pb-4">
               <!-- 공지사항 게시판 글쓰기버튼 관리자만 보임 -->
               <c:if test="${sUserId=='admin'}">
                 <button class="btn btn-outline-success" onclick="postInsert()">글쓰기</button>
                 </c:if>
               <!-- 나머지 게시판은 전부 -->
                 <%-- <c:if test="${group_no==20 ||group_no==30 ||group_no==60 }">
                 <button class="btn btn-outline-success" onclick="postInsert()">글쓰기</button>
                 </c:if> --%>                     
              <!-- 비로그인시 cust_no를 0으로 설정 -->
              <c:if test="${empty sUserId }">
                 <c:set var="cust_no" value="0"></c:set>
              </c:if>
               </div>
               <div class="text-right mb-2">
                  <form action="postList" method="get" class="search form-inline">
                     <div class="form-group">
                        <p class="mr-2 mb-0">총 ${totalCount}건</p>
                     </div>
                     <div class="form-group noto-sans">
                 <select name="option" size="1" class="form-control">
                       <option value="p_title">제목</option>
                       <option value="p_writer">작성자</option>
                       <option value="p_content">내용</option>
                    </select>
                 <input type="search" name="search" class="form-control mr-2">
                 <input type="hidden" name="group" value="${group }">
                     </div>
                     <div class="form-group px-2">
                 <button class="btn btn-outline-secondary"><i class="fas fa-search"></i></button>
                     </div>
              </form>
               </div>
               <table class="table table-hover">
                  <thead class="bg-light text-center">
                     <tr>
                        <th>&nbsp;</th>
                        <th>제목</th>
                        <th>작성일</th>
                        <th>조회수</th>
                        <th>첨부파일</th>
                     </tr>
                  </thead>
                  <tbody id="notice_list_tbody">
                                
                  <!-- board start -->
                  <c:forEach var="notice" items="${noticeList.itemList}">
	              	<tr>
	                                    <!-- 
	                                        <th scope="row">${notice.notice_no}</th>
	                                         -->
	                                         <th>
	                                         	<c:if test="${notice.setting eq '1'}">
	                                        			&nbsp;&nbsp;<img src="img/notice.png" width="20" height="20">
	                                        		</c:if>
	                                        		<c:if test="${notice.setting eq '0'}">
	                                        			&nbsp;&nbsp;<span class="badge badge-normal"></span>
	                                        		</c:if>
	                                         </th>
	                                        <td>
	                                       
	                                       
	                                        	<a href="notice_detail?notice_no=${notice.notice_no}&pageno=${noticeList.pageMaker.curPage}">
	                                        		${notice.notice_title}
	                                        		
	                                        		
	                                        		 
	                                        	</a>
	                                        	
	                                        
	                                        </td>
	                                        <td>${notice.notice_date}</td>
	                                        <td>${notice.notice_readcount}</td>
		                                    <td><c:if test="${notice.notice_image eq '1'}">
		                                        &nbsp;&nbsp;
		                                        </c:if>
		                                        <c:if test="${notice.notice_image eq null}">
		                                        &nbsp;&nbsp;<img src="img/notice_file.png" width="20" height="20">
		                                        </c:if></td>
	                                        <%-- <td>${notice.notice_img}</td> --%>
	                                    </tr>
                                    </c:forEach>
                                   <!-- board end -->
                 
                                </tbody>
                            </table>
						
                        </div>
                    </div>
					<%-- <input type="button" class="notice_btn write_form" pageno="${pageno}" value="게시글작성" /> --%>
                </div>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-12 col-lg-9">
                    <!-- Shop Pagination Area -->
                    <div class="shop_pagination_area mt-5">
                        <nav aria-label="Page navigation">
                            <ul class="pagination pagination-sm justify-content-center">

                            	<c:if test="${noticeList.pageMaker.prevPage > 0}">  
	            					<li class="page-item">
	                                    <button class="page-link" onclick="changeQnaList(${data.pageMaker.prevPage});"><i class="fa fa-angle-left" aria-hidden="true"></i></button>
	                               	 </li>
                                </c:if>
                                <c:forEach var="no" begin="${noticeList.pageMaker.blockBegin}" end="${noticeList.pageMaker.blockEnd}">
									<c:if test="${noticeList.pageMaker.curPage == no}">
										<li class="page-item active"><button class="page-link" href="#">${no}</button></li>
									</c:if>
									<c:if test="${noticeList.pageMaker.curPage != no}">
										<li class="page-item"><button class="page-link page" onclick="changeQnaList(${no})">${no}</button></li>
									</c:if>
                                </c:forEach>
                                <c:if test="${noticeList.pageMaker.curPage < noticeList.pageMaker.totPage}">  
	                                <li class="page-item">
				                        <button class="page-link" onclick="changeQnaList(${noticeList.pageMaker.nextPage})"><i class="fa fa-angle-right" aria-hidden="true"></i></button>
			                    	 </li>
                                </c:if>

                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            
            
            
         </div>
    </div> 
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
  <script src="js/notice/notice.js" defer></script>

  <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());

  </script>
  <script type="text/javascript">
      window.onload=function(){
         //푸터 명언
         const footer_display = document.getElementById('footer-display');
         const footer_quotes = ['좋은 책은 인류에게 불멸의 정신이다. — J. 밀턴', '내가 인생을 알게 된 것은 사람과 접촉해서가 아니라 책과 접하였기 때문이다. — A. 프 랜스', '목적이 없는 독서는 산보일 뿐이다. — B. 리튼', '사람은 책을 만들고, 책은 사람을 만든다. — 신용호','기회를 기다리는 것은 바보짓이다. 독서의 시간이라는 것은 지금 이 시간이지 결코 이제부터가 아니다. 오늘 읽을 수 있는 책을 내일로 넘기지 말라. — H. 잭슨','책은 한 권 한 권이 하나의 세계다. — W. 워즈워스', '책을 한 권 읽으면 한 권의 이익이 있고, 책을 하루 읽으면 하루의 이익이 있다. — 괴문절'];
         const footer_getQuote = Math.floor(Math.random() * footer_quotes.length);
         footer_display.textContent =footer_quotes[footer_getQuote];
      }
  </script>
 
  
</body>

</html>