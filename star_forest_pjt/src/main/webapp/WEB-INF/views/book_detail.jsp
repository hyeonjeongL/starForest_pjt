<%@page import="com.itwill.domain.Book"%>
<%@page import="com.itwill.service.BookServiceImpl"%>
<%@page import="com.itwill.service.RentalService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta property="og:description" content="" />
<link rel="stylesheet" href="css/book_detail.css">
<link rel="profile" href="https://gmpg.org/xfn/11" />
<title>도서정보 - 별숲도서관</title>

<!-- 구글폰트 전체 기본적용 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap"
	rel="stylesheet">
<!-- 구글폰트 전체 기본적용 END -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />

<!-- 템플릿 건들 X -->
<link rel='stylesheet' id='kulib-bootstrap-select-css'
	href='https://library.korea.ac.kr/wp-content/themes/kulib/plugins/bootstrap-select/css/bootstrap-select.min.css?ver=20190905'
	type='text/css' media='all' />
<link rel='stylesheet' id='kulib-bootstrap-datetimepicker-css'
	href='https://library.korea.ac.kr/wp-content/themes/kulib/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css?ver=20190927'
	type='text/css' media='all' />

<link rel='stylesheet' id='kulib-bootstrap-css'
	href='https://library.korea.ac.kr/wp-content/themes/kulib/plugins/bootstrap/css/bootstrap.css?ver=20190905'
	type='text/css' media='all' />
<!-- 템플릿 건들 X -->
<link rel='stylesheet' id='kulib-style-css'
	href='https://library.korea.ac.kr/wp-content/themes/kulib/style.css?ver=20210913'
	type='text/css' media='all' />

<!-- <script type='text/javascript'
	src='https://library.korea.ac.kr/wp-includes/js/jquery/jquery.js?ver=1.12.4-wp'
	id='jquery-core-js'></script> -->
<script type='text/javascript'
	id='graphina-charts-for-elementor-public-js-extra'>
	
</script>

<style type="text/css">
.broken_link, a.broken_link {
	text-decoration: line-through;
}
</style>
<link rel="icon"
	href="https://library.korea.ac.kr/wp-content/uploads/2020/02/cropped-favicon-3-32x32.png"
	sizes="32x32" />
<link rel="icon"
	href="https://library.korea.ac.kr/wp-content/uploads/2020/02/cropped-favicon-3-192x192.png"
	sizes="192x192" />
<link rel="apple-touch-icon"
	href="https://library.korea.ac.kr/wp-content/uploads/2020/02/cropped-favicon-3-180x180.png" />
<meta name="msapplication-TileImage"
	content="https://library.korea.ac.kr/wp-content/uploads/2020/02/cropped-favicon-3-270x270.png" />
<!-- <script type='text/javascript'
	src='https://library.korea.ac.kr/wp-includes/js/wp-embed.min.js?ver=5.5.10'
	id='wp-embed-js'></script> -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- MODAL 필수 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<script type="text/javascript">
<!-- MODALMODAL -->
	$(function(){
		$(document).on('show.bs.modal','#item-user-request',function(e){
			var menu=$(e.relatedTarget).attr('title');
			if(menu=="소장정보발송"){
				$.ajax({
					url:'rest_book_detail',
					data:'book_no='+$(e.target).attr("book_no"),
					type:'GET',
					success:function(book){
						
						
						var html1=
									`<body class="modal-page">
									 <div class="container">
										<div class="entry-content">
											<div class="content-d">
												<h4 class="content-h4"><i class="fas fa-arrow-alt-circle-right"></i> 소장정보 모바일(알림톡/SMS) 발송 서비스</h4>
												<div class="content-l">
													<h5>소장정보</h5>
													<ul>
														<li>도서정보: ${book.book_title}</li>
														<li>저자사항: ${book.book_author}}</li>
														<li>출판정보: ${book.book_publisher}</li>						
														<li>I S B N : ${book.isbn}</li>
														<li>소장정보: 별숲도서관</li>
													</ul>
												</div>
											</div>
											<div class="content-d">
												<div class="content-l">
													<h5>수신 이메일 : ${user.user_email}</h5>
													<div class="content-desc">
														※ 수신번호 변경 방법<br>- 도서관 아이디 이용자 : 도서관 홈페이지 로그인 후 [내 정보 변경] 페이지에서 직접 변경
													</div>
												</div>
											</div>
											<div class="content-d d-flex justify-content-center">
												<button type="button" class="btn btn-primary submit-request">신청</button>
											</div>
										</div><!-- .entry-content -->
									</div><!-- .container -->
								</body>`;
						$(e.target).find('#modal-body-user-request').html(html1);
						
					}
				});
			}else if(menu=="간편대출신청"){
				$(e.target).find('#modal-body-user-request').html("");
				$.ajax({
					url:'',
					data:null,
					type:'GET',
					success:function(result){
						console.log(result);
						
						var html1 = `<body class="modal-page">
							
							<div class="container">
								
								<div class="entry-content">

									
									<div class="content-d">
										<h4 class="content-h4"><i class="fas fa-arrow-alt-circle-right"></i> 수령처</h4>
										<div class="content-l">
																
																<div>
												<label class="attr-value-label">
													<input type="radio" name="receive_location_code" class="purchase-type" > 별빛도서관 1층 데스크
												</label>
											</div>
															</div>
									</div>
									
									<div class="content-d d-flex justify-content-center">
										<button type="button" class="btn btn-primary submit-request">신청</button>
									</div>
									
									<div class="content-d">
										<h4 class="content-h4"><i class="fas fa-arrow-alt-circle-right"></i> 간편대출 안내</h4>
										<div class="content-l">
											<ul>
												<li>간편대출 최대 신청 회수 : 3회</li>
												<li>신청된 간편대출 자료는 1일 2회(오전09:00, 오후2:00) 확인 후 통보하여 드립니다.</li>
												<li>오후 2:00 이후 신청된 자료는 익일 오전에 확인하여 통보됩니다.</li>
												<li>E-Mail 및 알림톡/SMS로 도착통보를 받은 후 수령할 수 있으며, 수령처는 자료의 크기, 상태 등에 따라 변경될 수 있습니다.</li>
												<li>간편대출 서비스를 신청하였으나 대출이 불가한 자료의 경우는 별도로 안내해 드립니다.(*서가에 없거나 파손이 심한 경우 등)</li>
												<li>도착 통보 후 3일 이내 반드시 자료를 수령하셔야 합니다. (자료 미수령시 1개월간 간편대출서비스 이용 불가)</li>
											</ul>
										</div>
									</div>
									
								</div><!-- .entry-content -->
								
							</div><!-- .container -->



						</body>`
							$(e.target).find('#modal-body-user-request').html(html1);
						
					}
				});
			}else if(menu=='도서예약신청'){
				$(e.target).find('#modal-body-user-request').html("");
				$.ajax({
					url:'',
					data:null,
					type:'GET',
					success:function(result){
						console.log(result);
						
						var html1 = 
							`<body class="modal-page">
								
								<div class="container">

									<div class="entry-content">

										
										<div class="content-d">
											<h4 class="content-h4"><i class="fas fa-arrow-alt-circle-right"></i> 도서예약 안내</h4>
											<div class="content-l">
												<ol>
													<li>
														<div>예약자료 도착 알림 : 개인공지 / E-mail / 카카오알림톡(또는 SMS)</div>
														<div>&lt;도서관 홈페이지 - 나의공간 - 이용자정보관리&gt;에서 <font color="red">연락처를 확인</font>하여 주시기 바랍니다.</div>
													</li><li>
														<div>예약 정보 확인 및 취소 : &lt;나의공간 - 대출/예약 현황&gt; 메뉴</div>
														<div>단, <font color="red">도착통보 후에는 직접 취소가 불가</font>하오니 1:1 문의 게시판 또는 전화로 취소 요청하시기 바랍니다.</div>
													</li>
												</ol>
											</div>
										</div>
										<div class="content-d d-flex justify-content-center">
											<button type="button" class="btn btn-primary submit-request">신청</button>
										</div>

										
									</div><!-- .entry-content -->

								</div><!-- .container -->



							</body>`;
						$(e.target).find('#modal-body-user-request').html(html1);
							
						
					}
				});
				
			}
		});
		
		
		
	});

	

</script>

</head>


<body
	class="page-template page-template-page-without-title page-template-page-without-title-php page page-id-2053 logged-in wp-custom-logo wp-embed-responsive has-fixed-top singular image-filters-enabled elementor-default elementor-kit-14083">
	<!-- Modal -->

	<div class="modal fade" id="item-user-request" tabindex="-1"
		book_no="${book.book_no}" role="dialog"
		aria-labelledby="item-user-request-title" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="item-user-request-title">신청 제목</h5>
					<button type="button" class="close reset-iframe-content"
						data-dismiss="modal" aria-label="닫기">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body item-overview-info-block-body active"
					id="modal-body-user-request"></div>
				<div class="modal-footer">
					<button type="button"
						class="btn btn-secondary reset-iframe-content"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- <div class="modal fade" id="theModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header"></div>
				<div class="modal-body">... remote content from "data-remote"
					loads here ...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div> -->

	<header id="masthead" class="site-header">

		<script type="text/javascript"
			src="https://library.korea.ac.kr/ezast/service/incscript.n2s?charset=utf-8&acbody=/ezast/service/n2ezast_body_main_result.html"
			charset="UTF-8"></script>


		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="common/include_common_top_menu_templateVer.jsp" />
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
	</header>

	<!-- PAGE HEADER -->
	<header id="page-header" class="noto-serif">
		<div class="page-header-overlay">
			<div class="container pt-5">
				<div class="row">
					<div class="col-md-6 m-auto text-center">
						<h2>책 상세보기</h2>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- #masthead -->

	<div id="content" class="site-content">

		<div id="primary" class="content-area">
			<main id="main" class="site-main">

				<article id="post-2053"
					class="post-2053 page type-page status-publish hentry entry">

					<header class="entry-header">

						<div class="entry-header-bar">

							<div class="entry-nav">
								<!-- Breadcrumb NavXT 6.5.0 -->
								<span property="itemListElement" typeof="ListItem"><a
									property="item" typeof="WebPage" title="Go to 별숲 도서관."
									href="http://localhost/star_forest_pjt/Home" class="home"><span
										property="name">HOME</span></a>
									<meta property="position" content="1"></span> &gt; <span
									class="post post-page current-item">상세정보</span>
							</div>
							<!-- .entry-nav -->

							<h1 class="entry-title">상세정보</h1>
						</div>
						<!-- .entry-header-bar -->
					</header>

					<script>
				

							
					</script>

					<div class="container">

						<div class="item-detail row">

							<div class="item-cover col-lg-2">

								<div>
									<img class="multi-cover" style="display: none;"
										src="${book.book_image_src }" alt="${book.book_image }" />
								</div>
								<script>
									
									/*쓰고싶지만 못쓰겠구나 미리보기*/
								</script>

								<div class="item-cover-slider">
									<a id="preview-link" style="display: none;"
										href="https://www.aladin.co.kr/shop/book/wletslookViewer.aspx?ISBN=9788954699914"
										target="_blank" class="btn btn-lightgrey">미리보기&nbsp;<svg
											class="svg-icon" width="19" height="19" aria-hidden="true"
											role="img" focusable="false"
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path d="M0 0h24v24H0z" fill="none"></path>
														<path
												d="M15.357,4.288c-3.051-3.051-8.017-3.051-11.068,0c-3.052,3.052-3.052,8.016,0,11.069c2.716,2.716,6.949,3.008,9.997,0.885 c0.065,0.306,0.212,0.594,0.448,0.83l4.443,4.441c0.646,0.648,1.693,0.648,2.338,0c0.646-0.646,0.646-1.69,0-2.335l-4.444-4.445 c-0.235-0.234-0.523-0.382-0.826-0.446C18.367,11.237,18.074,7.006,15.357,4.288z M13.954,13.954c-2.279,2.277-5.986,2.277-8.263,0 c-2.276-2.278-2.276-5.984,0-8.263c2.276-2.277,5.984-2.277,8.263,0C16.231,7.97,16.231,11.676,13.954,13.954z"></path></svg></a>
								</div>
								<script>
									jQuery(function($) {
										$(document).ready(function() {
											$(".multi-cover").show();
										});
									});
								</script>

							</div>

							<div class="item-data col-lg-10">

								<div class="item-row d-lg-flex justify-content-between mb-3" style= "height: 50px;">
									<div class="item-title">
										<h2>${book.book_title }
											<span class="item-meta-value"> (<span class="number">${book.book_rental_cnt }</span>회
												대출)
											</span>
										</h2>
									</div>

									<div
										class="item-functions flex-shrink-0 d-flex justify-content-center justify-content-lg-end">
										<span class="item-modal" data-toggle="modal"
											data-target="#item-user-request"> <a href="#theModal"
											role="button" class="item-tooltip" data-toggle="tooltip"
											data-placement="bottom" title="SNS 공유"><svg
													class="svg-icon" width="24" height="24" aria-hidden="true"
													role="img" focusable="false"
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
																<path fill="none" d="M0 0h24v24H0z" />
																<path
														d="M13.12 17.023l-4.199-2.29a4 4 0 1 1 0-5.465l4.2-2.29a4 4 0 1 1 .959 1.755l-4.2 2.29a4.008 4.008 0 0 1 0 1.954l4.199 2.29a4 4 0 1 1-.959 1.755zM6 14a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm11-6a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0 12a2 2 0 1 0 0-4 2 2 0 0 0 0 4z" /></svg></a>
										</span> <span class="item-modal" data-toggle="modal"
											data-target="#directory-select"> <a role="button"
											class="item-tooltip" data-toggle="tooltip"
											data-placement="bottom" title="내 서재에 보관"><svg
													class="svg-icon" width="24" height="24" aria-hidden="true"
													role="img" focusable="false"
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
																<path d="M0 0h24v24H0z" fill="none"></path>
																<path
														d="M21.849,7.689l-5.628-5.627c-0.202-0.203-0.533-0.203-0.736,0l-0.023,0.023 c-0.346,0.346-0.535,0.805-0.535,1.292c0,0.314,0.08,0.616,0.229,0.883l-5.89,5.054C8.814,8.911,8.24,8.69,7.63,8.69 c-0.656,0-1.272,0.256-1.738,0.721L5.857,9.445c-0.203,0.203-0.203,0.533,0,0.737l3.371,3.371l-3.283,3.281 c-0.065,0.069-1.619,1.669-2.641,2.945c-0.972,1.213-1.166,1.435-1.175,1.445c-0.18,0.207-0.171,0.516,0.023,0.711 c0.102,0.102,0.234,0.152,0.368,0.152c0.123,0,0.245-0.042,0.343-0.129c0.01-0.006,0.227-0.196,1.447-1.175 c1.273-1.021,2.875-2.576,2.949-2.646l3.277-3.278l3.19,3.191c0.101,0.101,0.236,0.152,0.369,0.152s0.265-0.052,0.366-0.152 l0.035-0.035c0.465-0.465,0.721-1.082,0.721-1.737c0-0.609-0.221-1.185-0.623-1.635l5.053-5.888 c0.269,0.147,0.569,0.227,0.884,0.227c0.488,0,0.947-0.189,1.292-0.535l0.024-0.022C22.052,8.222,22.052,7.892,21.849,7.689z"></path></svg></a>
										</span>
									</div>
									<!-- .item-functions -->
								</div>

								<div class="item-meta">

									<div class="d-lg-flex">
										<div class="item-meta-key">자료유형</div>
										<div class="item-meta-value">단행본</div>
									</div>

									<div class="d-lg-flex">
										<div class="item-meta-key">개인저자</div>
										<div class="item-meta-value">
											<span> <!-- <a href="/datause/advanced-search/advanced-search-form/advanced-search-result/?verb=detail&target=catalog&st=FRNT&fi1=2&q1=%EA%B9%80%ED%9B%88%2C++%E9%87%91%E8%96%B0%2C++1948-&lmt0[]=TOTAL"> -->
												${book.book_author } <!-- </a> -->
											</span>
										</div>
									</div>


									<div class="d-lg-flex">
										<div class="item-meta-key">서명 / 저자사항</div>
										<div class="item-meta-value">${book.book_title}:
											${book.book_author }</div>
									</div>



									<div class="d-lg-flex">
										<div class="item-meta-key">발행사항</div>
										<div class="item-meta-value">${book.book_publisher },
											&nbsp; ${book.book_publish_date } &nbsp;</div>
									</div>

									<div class="d-lg-flex">
										<div class="item-meta-key">형태사항</div>
										<div class="item-meta-value">${book.book_page }p</div>
									</div>

									<!-- Notes: 아래와 같이 2021.04.05 수정 당시 본 line으로 주석처리 상태이였음.
																																																																																																																																-->
									<div class="d-lg-flex">
										<div class="item-meta-key">ISBN</div>
										<div class="item-meta-value">
											<!-- 2019.10.25 주석후 아래로 보완 - 9788954699914 -->
											<span>${book.isbn } </span>
										</div>
									</div>


								</div>

							</div>
							<!-- .item-data -->

						</div>
						<!-- .item-detail -->

						<hr class="d-none d-lg-block" />

						<div id="er_finder-result"></div>
						<script>
							
						</script>



						<div class="item-location item-additional-info">

							<div
								class="item-location-header d-md-flex justify-content-start align-items-center mb-3">

								<h3>소장정보</h3>


							</div>
							<!-- .item-location-header -->
							<script>
								
							</script>

							<div class="item-location-content tab-content">
								<div class="tab-pane fade show active" id="locs-1"
									role="tabpanel" aria-labelledby="locs-1-tab">
									<div class="table-container table-locations">
										<table class="table table-sm table-hover text-center">
											<thead>
												<tr>
													<th scope="col">No.</th>
													<th scope="col">소장처</th>
													<th scope="col">ISBN</th>
													<th scope="col">대출가능권수</th>
													<th scope="col">도서상태</th>
													<th scope="col">반납예정일</th>
													<th scope="col">예약</th>
													<th scope="col">서비스</th>
												</tr>
											</thead>
											<tbody>

												<tr>
													<td><span class="th-item">No.</span> 1</td>
													<td><span class="th-item">소장처</span> 별숲도서관</td>
													<td><span class="th-item">ISBN</span> ${book.isbn }</td>
													<td><span class="th-item">대출가능권수</span>
														${book.book_qty}/3</td>
													<td><span class="th-item">도서상태</span> ${rental_status}</td>
													<td><span class="th-item">반납예정일</span>
														${rental_duedate.substring(0,10)}</td>
													<td><span class="th-item">예약</span> ${res_status} ${reservation1}<!-- <span
														class="item-modal"> <a data-toggle="modal"
															data-target="#item-user-request" class="item-loc-service"
															title="도서예약신청" href=""> <span class="char-icon">R</span>
														</a> -->
													</span></td>
													</td>
													<!-- 2020.03.08 서비스 아이콘 셀 왼쪽 정렬 -->
													<td><span class="th-item">서비스</span>${rentalPos } <!-- <span
														class="item-modal"> <a data-toggle="modal"
															data-target="#item-user-request" class="item-loc-service"
															title="간편대출신청" href=""><span
																class="char-icon char-icon-magenta">B</span></a> -->
													</span> <span class="item-modal"> <a
															class="item-loc-service" data-toggle="modal"
															data-target="#item-user-request" title="소장정보발송" href="">
																<span class="char-icon char-icon-blue">M</span>
														</a>
													</span></td>
													<!-- 모달 테스트 -->
													<!-- <td>
													<a href="/WEB-INF/views/rentalModal.jsp" class="nav-link" 
																data-toggle="modal" data-target="#theModal">Modal</a>
													</td> -->
												</tr>
											</tbody>
										</table>
									</div>
									<!-- .table-container.table-locations -->
								</div>
								<!-- .tab-pane -->


							</div>
							<!-- .item-location-content -->

							<!-- R=도서예약, B=간편대출, M=소장정보 -->
							<div class="item-location-footer">
								<div class="item-services text-right">
									<span><span class="char-icon char-icon">R</span> 도서예약</span> <span><span
										class="char-icon char-icon-magenta">B</span> 간편대출</span> <span><span
										class="char-icon char-icon-blue">M</span> 소장정보</span>
								</div>
							</div>
							<!-- .item-location-footer -->

						</div>
						<!-- .item-location.item-additional-info -->

						<div class="item-additional-info item-overview-info">

							<h3 class="mb-3">컨텐츠정보</h3>
							<!-- <h3 class="mb-3">도서 개요</h3> -->

							<div class="item-overview-info-block mb-5">
								<!-- 책소개 -->
								<h4>책소개</h4>
								<div class="item-overview-info-block-body">
									<div class="inner-area">
										<p>${book.book_summary }</p>
										<br /> <span>정보제공 : <a
											href="http://www.aladin.co.kr/shop/wproduct.aspx?ItemId=298570092&partner=openAPI&start=api"
											target="_blank"><img src="img/aladin.png" alt="Aladin"></a></span>
									</div>
									<!-- .inner-area -->
								</div>

							</div>
						</div>




						<!-- 2020.02.29 추가 - 관련분야 인기자료 출력 -->
						<div class="item-popular-books item-additional-info">
							<h3 class="mb-3">관련분야 인기자료</h3>
							<div class="item-popular-books-content">
								<div class="item-popular-book-slider"
									data-slick='{"slidesToScroll": 1}'>
									<div class="item item-popular-book">
										<div class="item-cover">
											<a href="/detail/?cid=CAT000045341864&ctype=m">
												<div class="item-cover-image"
													style="background-image: url(/n2app/public/coverimage.php?type=book&amp;field=isbn&amp;value=9788973377947&amp;control_no=000045341864&amp;sysd=CAT)"></div>
											</a>
										</div>
										<div class="item-meta">
											<!-- <div class="item-marc">897.36 조정래 태g</div> -->
											<div class="item-title">
												<h4>
													<a href="/detail/?cid=CAT000045341864&ctype=m">太白山脈 :
														趙廷來 大河小說 / 제4판</a>
												</h4>
											</div>
											<div class="item-author">조정래 (2007)</div>
										</div>
									</div>
									<!-- .item -->
									<div class="item item-popular-book">
										<div class="item-cover">
											<a href="/detail/?cid=CAT000000691603&ctype=m">
												<div class="item-cover-image"
													style="background-image: url(/n2app/public/coverimage.php?type=book&amp;field=isbn&amp;value=898447164X&amp;control_no=000000691603&amp;sysd=CAT)"></div>
											</a>
										</div>
										<div class="item-meta">
											<!-- <div class="item-marc">897.36 하주완 검</div> -->
											<div class="item-title">
												<h4>
													<a href="/detail/?cid=CAT000000691603&ctype=m">검마전 .
														1-8</a>
												</h4>
											</div>
											<div class="item-author">하주완 (2000)</div>
										</div>
									</div>
									<!-- .item -->


								</div>
								<!-- .item-popular-book-slider -->
								<a class="item-popular-books-prev"><svg class="svg-icon"
										width="48" height="48" aria-hidden="true" role="img"
										focusable="false" viewBox="0 0 24 24" version="1.1"
										xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink">
										<path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"></path>
										<path d="M0 0h24v24H0z" fill="none"></path></svg></a> <a
									class="item-popular-books-next"><svg class="svg-icon"
										width="48" height="48" aria-hidden="true" role="img"
										focusable="false" xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 24 24">
										<path d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path>
										<path d="M0 0h24v24H0z" fill="none"></path></svg></a>

							</div>
							<!-- .item-popular-books-content -->
						</div>
						<!-- .item-popular-books.item-additional-info -->


						<!-- 2020.03.06 추가 - 관련분야 신착자료 출력 -->
						<div class="item-newarrival-books item-additional-info">
							<h3 class="mb-3">관련분야 신착자료</h3>
							<div class="item-newarrival-books-content">
								<div class="item-newarrival-book-slider"
									data-slick='{"slidesToScroll": 1}'>
									<div class="item item-newarrival-book">
										<div class="item-cover">
											<a href="/detail/?cid=CAT000046128977&ctype=m">
												<div class="item-cover-image"
													style="background-image: url(/n2app/public/coverimage.php?type=book&amp;field=isbn&amp;value=9791196934217&amp;control_no=000046128977&amp;sysd=CAT)"></div>
											</a>
										</div>
										<div class="item-meta">
											<!-- <div class="item-marc">897.1708 2020 2</div> -->
											<div class="item-title">
												<h4>
													<a href="/detail/?cid=CAT000046128977&ctype=m">은빛에 물든
														포토시집 : 2021 부산문협 시분과 무크지</a>
												</h4>
											</div>
											<div class="item-author">박혜숙 (2022)</div>
										</div>
									</div>
									<!-- .item -->
									<div class="item item-newarrival-book">
										<div class="item-cover">
											<a href="/detail/?cid=CAT000046128962&ctype=m">
												<div class="item-cover-image"
													style="background-image: url(https://image.aladin.co.kr/product/28409/75/cover/k832835010_1.jpg)"></div>
											</a>
										</div>
										<div class="item-meta"></div>
										<!-- .item-newarrival-book-slider -->
										<a class="item-newarrival-books-prev"><svg
												class="svg-icon" width="48" height="48" aria-hidden="true"
												role="img" focusable="false" viewBox="0 0 24 24"
												version="1.1" xmlns="http://www.w3.org/2000/svg"
												xmlns:xlink="http://www.w3.org/1999/xlink">
										<path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"></path>
										<path d="M0 0h24v24H0z" fill="none"></path></svg></a> <a
											class="item-newarrival-books-next"><svg class="svg-icon"
												width="48" height="48" aria-hidden="true" role="img"
												focusable="false" xmlns="http://www.w3.org/2000/svg"
												viewBox="0 0 24 24">
										<path d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path>
										<path d="M0 0h24v24H0z" fill="none"></path></svg></a>

									</div>
									<!-- .item-newarrival-books-content -->
								</div>
								<!-- .item-newarrival-books.item-additional-info -->
							</div>
							<!-- .container -->
							<!-- .item-detail-content -->

						</div>
						<!-- .entry-content -->
				</article>
				<!-- #post-2053 -->


			</main>
			<!-- #main -->
		</div>
		<!-- #primary -->


	</div>
	<!-- #content -->

	<!-- .footer-navigation -->
	<!-- footer start-->
	<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="common/include_common_bottom_templateVer.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
	<!-- footer end-->

	</div>
	<!-- #page -->


</body>
</html>
