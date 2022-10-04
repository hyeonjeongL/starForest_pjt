<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap" rel="stylesheet">
	<!-- 구글폰트 전체 기본적용 END -->
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/post.css">
	<script src="https://cdn.jsdelivr.net/npm/vue"></script>
  <title>도서관소개 - 딜리브러리</title>
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
  
	<!-- 도서관소개 PAGE HEADER -->
		<header id="page-header" class="noto-serif">
			<div class="page-header-overlay">
				<div class="container pt-5">
				  <div class="row">
					<div class="col-md-6 m-auto text-center">
					  <h2>묻고답하기</h2>
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
			<div class="col-md-3">
			  <div class="sidebar noto-serif">
					<div class="side-head">
						<h4 class="text-light text-center">도서관소개</h4>
					</div>
					<ul class="list-group list-group-flush mb-5">
						<li class="list-group-item"><a href="howtoInfo.do">대출/반납/연장</a></li>
						<li class="list-group-item"><a href="postList.do?group=10">공지사항</a></li>
						<li class="list-group-item"><a href="faqViewpage.do">자주묻는질문</a></li>
						<li class="list-group-item active"><a href="QnaList.do?option=p_title&search=">묻고답하기</a></li>
						<li class="list-group-item"><a href="addrViewpageAPI.do">오시는길</a></li>
					</ul>
			  </div>
			</div>
			
<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->	
			<!-- 메인내용 -->
			<div class="col-md-9 pb-4">
        <!-- ACTIONS -->
       <form action="QnaInsert.do" method="post" enctype="multipart/form-data">
        <section id="actions" class="py-4">
          <div class="container">
            <div class="row noto-serif">
              <div class="col-md-2">
	                <a href="QnaList.do" class="btn btn-outline-secondary">
	                  <i class="fas fa-arrow-left"></i> 취소
	                </a>
			  </div>
			  <div class="col-md-8">
				 	<span>&nbsp;</span>
			  </div>
              <div class="col-md-2">
              		<button class="btn btn-success btn-block" onclick="btnInsert()"><i class="fas fa-check"></i> 등록</button>
              </div>
            </div>
          </div>
        </section>

        <!-- DETAILS -->
        <section id="details">
          <div class="container">
            <div class="row">
              <div class="col">
<!-- <!-- 비밀글 체크박스 -->
<!-- <div class="form-group form-check text-right"> -->
<!-- 	<input type="checkbox" class="form-check-input" id="secretQNA"> -->
<!-- 	<label class="form-check-label small" for="secretQNA">비밀글로 문의하기 <label class="text-muted">(관리자와 작성자만 확인할 수 있습니다.)</label></label> -->
<!-- </div> -->
                <div class="card">
                  <div class="card-header">
                    <h4 class="noto-serif">새글 쓰기</h4>
                  </div>
                  <div class="card-body">
						<div class="form-group">
							<label for="title" class="noto-serif">제목</label>
							<input id="title_test" type="text" class="form-control" name="p_title" value="${p_title }" placeholder="제목을 입력하세요.">
						</div>
                      <div class="form-group">
                        <label for="image" class="noto-serif">파일첨부 [문의할 내용의 필요한 사진을 등록해주세요.]</label>
                        <div>
                          <input type="file" value="" name="uploadFile" class="input-file">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="body" class="noto-serif">글내용</label>
                        <textarea name="p_content" value="${p_content }" class="form-control" rows="10" placeholder="내용을 입력하세요"></textarea>
                      </div>

	                      		<!-- controller로 넘길 값들 -->
	                      		<div>
									<input type="hidden" name="p_id" value="${p_id }">
									<input type="hidden" name="p_no" value="${p_no }">
									<input type="hidden" name="cust_no" value="${c.cust_no}">
								</div>
                 	 </div>
	                </div>
	              </div>
	            </div>
          	</div>
        	</section>
         </form>
      	</div>
    	</div>
  	</div>
  </section>
</div>


  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
    crossorigin="anonymous"></script>

  <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());

    window.onload=function(){
			//푸터 명언
			const footer_display = document.getElementById('footer-display');
			const footer_quotes = ['좋은 책은 인류에게 불멸의 정신이다. — J. 밀턴', '내가 인생을 알게 된 것은 사람과 접촉해서가 아니라 책과 접하였기 때문이다. — A. 프 랜스', '목적이 없는 독서는 산보일 뿐이다. — B. 리튼', '사람은 책을 만들고, 책은 사람을 만든다. — 신용호','기회를 기다리는 것은 바보짓이다. 독서의 시간이라는 것은 지금 이 시간이지 결코 이제부터가 아니다. 오늘 읽을 수 있는 책을 내일로 넘기지 말라. — H. 잭슨','책은 한 권 한 권이 하나의 세계다. — W. 워즈워스', '책을 한 권 읽으면 한 권의 이익이 있고, 책을 하루 읽으면 하루의 이익이 있다. — 괴문절'];
			const footer_getQuote = Math.floor(Math.random() * footer_quotes.length);
			footer_display.textContent =footer_quotes[footer_getQuote];
		}
    <!-- 제목과내용이 null값이면 글등록이 안되도록.. -->    
    function btnInsert(){
          const p_title = document.getElementById('title_test').value
		  if(p_title == null){
		  	alert("제목을 입력하세요.")
		  }else{
		      window.location="QnaInsert.do?cust_no="+${cust_no};
		  }
    }
  </script>
</body>

</html>