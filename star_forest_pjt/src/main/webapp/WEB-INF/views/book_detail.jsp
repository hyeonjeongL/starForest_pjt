<%@page import="com.itwill.domain.Book"%>
<%@page import="com.itwill.service.BookServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko-KR">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta property="og:type" content="website" />
<meta property="og:title" content="고려대학교 도서관" />
<meta property="og:url" content="https://library.korea.ac.kr" />
<meta property="og:description" content="" />
<meta property="og:image"
	content="https://library.korea.ac.kr/wp-content/uploads/2021/11/kulib_logo.png" />
<link rel="profile" href="https://gmpg.org/xfn/11" />
<title>별숲도서관</title>
<link rel="alternate" hreflang="ko"
	href="https://library.korea.ac.kr/detail/" />
<link rel="alternate" hreflang="en"
	href="https://library.korea.ac.kr/detail/?lang=en" />

<!-- WordPress KBoard plugin 5.8 - https://www.cosmosfarm.com/products/kboard -->
<link rel="alternate"
	href="https://library.korea.ac.kr/wp-content/plugins/kboard/rss.php"
	type="application/rss+xml" title="고려대학교 도서관 &raquo; KBoard 통합 피드">
<!-- WordPress KBoard plugin 5.8 - https://www.cosmosfarm.com/products/kboard -->

<link rel='dns-prefetch' href='//cdnjs.cloudflare.com' />
<link rel='dns-prefetch' href='//use.fontawesome.com' />
<link rel='dns-prefetch' href='//fonts.googleapis.com' />
<link rel='dns-prefetch' href='//s.w.org' />
<link rel="alternate" type="application/rss+xml"
	title="고려대학교 도서관 &raquo; 피드" href="https://library.korea.ac.kr/feed/" />
<link rel="alternate" type="application/rss+xml"
	title="고려대학교 도서관 &raquo; 댓글 피드"
	href="https://library.korea.ac.kr/comments/feed/" />
<script type="text/javascript">
			window._wpemojiSettings = {"baseUrl":"https:\/\/s.w.org\/images\/core\/emoji\/13.0.0\/72x72\/","ext":".png","svgUrl":"https:\/\/s.w.org\/images\/core\/emoji\/13.0.0\/svg\/","svgExt":".svg","source":{"concatemoji":"https:\/\/library.korea.ac.kr\/wp-includes\/js\/wp-emoji-release.min.js?ver=5.5.10"}};
			!function(e,a,t){var n,r,o,i=a.createElement("canvas"),p=i.getContext&&i.getContext("2d");function s(e,t){var a=String.fromCharCode;p.clearRect(0,0,i.width,i.height),p.fillText(a.apply(this,e),0,0);e=i.toDataURL();return p.clearRect(0,0,i.width,i.height),p.fillText(a.apply(this,t),0,0),e===i.toDataURL()}function c(e){var t=a.createElement("script");t.src=e,t.defer=t.type="text/javascript",a.getElementsByTagName("head")[0].appendChild(t)}for(o=Array("flag","emoji"),t.supports={everything:!0,everythingExceptFlag:!0},r=0;r<o.length;r++)t.supports[o[r]]=function(e){if(!p||!p.fillText)return!1;switch(p.textBaseline="top",p.font="600 32px Arial",e){case"flag":return s([127987,65039,8205,9895,65039],[127987,65039,8203,9895,65039])?!1:!s([55356,56826,55356,56819],[55356,56826,8203,55356,56819])&&!s([55356,57332,56128,56423,56128,56418,56128,56421,56128,56430,56128,56423,56128,56447],[55356,57332,8203,56128,56423,8203,56128,56418,8203,56128,56421,8203,56128,56430,8203,56128,56423,8203,56128,56447]);case"emoji":return!s([55357,56424,8205,55356,57212],[55357,56424,8203,55356,57212])}return!1}(o[r]),t.supports.everything=t.supports.everything&&t.supports[o[r]],"flag"!==o[r]&&(t.supports.everythingExceptFlag=t.supports.everythingExceptFlag&&t.supports[o[r]]);t.supports.everythingExceptFlag=t.supports.everythingExceptFlag&&!t.supports.flag,t.DOMReady=!1,t.readyCallback=function(){t.DOMReady=!0},t.supports.everything||(n=function(){t.readyCallback()},a.addEventListener?(a.addEventListener("DOMContentLoaded",n,!1),e.addEventListener("load",n,!1)):(e.attachEvent("onload",n),a.attachEvent("onreadystatechange",function(){"complete"===a.readyState&&t.readyCallback()})),(n=t.source||{}).concatemoji?c(n.concatemoji):n.wpemoji&&n.twemoji&&(c(n.twemoji),c(n.wpemoji)))}(window,document,window._wpemojiSettings);
		</script>
<style type="text/css">
img.wp-smiley, img.emoji {
	display: inline !important;
	border: none !important;
	box-shadow: none !important;
	height: 1em !important;
	width: 1em !important;
	margin: 0 .07em !important;
	vertical-align: -0.1em !important;
	background: none !important;
	padding: 0 !important;
}
</style>
<link rel='stylesheet' id='font-awesome-5-css'
	href='https://use.fontawesome.com/releases/v5.9.0/css/all.css?ver=5.9.0'
	type='text/css' media='all' />
<link rel='stylesheet' id='wp-block-library-css'
	href='https://library.korea.ac.kr/wp-includes/css/dist/block-library/style.min.css?ver=5.5.10'
	type='text/css' media='all' />
<link rel='stylesheet' id='wp-block-library-theme-css'
	href='https://library.korea.ac.kr/wp-includes/css/dist/block-library/theme.min.css?ver=5.5.10'
	type='text/css' media='all' />
<link rel='stylesheet' id='graphina-charts-for-elementor-public-css'
	href='https://library.korea.ac.kr/wp-content/plugins/graphina-elementor-charts-and-graphs/elementor/css/graphina-charts-for-elementor-public.css?ver=1.5.4'
	type='text/css' media='all' />
<link rel='stylesheet' id='wpml-legacy-horizontal-list-0-css'
	href='//library.korea.ac.kr/wp-content/plugins/sitepress-multilingual-cms/templates/language-switchers/legacy-list-horizontal/style.css?ver=1'
	type='text/css' media='all' />
<link rel='stylesheet' id='wpml-tm-admin-bar-css'
	href='https://library.korea.ac.kr/wp-content/plugins/wpml-translation-management/res/css/admin-bar-style.css?ver=2.9.5'
	type='text/css' media='all' />
<link rel='stylesheet' id='kulib-bootstrap-css'
	href='https://library.korea.ac.kr/wp-content/themes/kulib/plugins/bootstrap/css/bootstrap.css?ver=20190905'
	type='text/css' media='all' />
<link rel='stylesheet' id='kulib-bootstrap-select-css'
	href='https://library.korea.ac.kr/wp-content/themes/kulib/plugins/bootstrap-select/css/bootstrap-select.min.css?ver=20190905'
	type='text/css' media='all' />
<link rel='stylesheet' id='kulib-bootstrap-datetimepicker-css'
	href='https://library.korea.ac.kr/wp-content/themes/kulib/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css?ver=20190927'
	type='text/css' media='all' />
<link rel='stylesheet' id='kulib-style-css'
	href='https://library.korea.ac.kr/wp-content/themes/kulib/style.css?ver=20210913'
	type='text/css' media='all' />
<link rel='stylesheet' id='kulib-font-css'
	href='https://fonts.googleapis.com/css?family=Muli%3A400%2C500%2C700%7CNoto+Sans+KR%3A400%2C500%2C700&#038;display=swap&#038;ver=5.5.10'
	type='text/css' media='all' />
<link rel='stylesheet' id='kulib-material-icons-css'
	href='https://fonts.googleapis.com/icon?family=Material+Icons&#038;ver=5.5.10'
	type='text/css' media='all' />
<link rel='stylesheet' id='kulib-print-style-css'
	href='https://library.korea.ac.kr/wp-content/themes/kulib/print.css?ver=2.0'
	type='text/css' media='print' />
<link rel='stylesheet' id='kulib-slick-slider-css'
	href='https://library.korea.ac.kr/wp-content/themes/kulib/plugins/slick-slider/slick.css?ver=20190905'
	type='text/css' media='all' />
<link rel='stylesheet' id='kulib-no-ui-slider-css'
	href='https://library.korea.ac.kr/wp-content/themes/kulib/plugins/no-ui-slider/nouislider.min.css?ver=20191003'
	type='text/css' media='all' />
<link rel='stylesheet' id='kulib-style-custom-css'
	href='https://library.korea.ac.kr/wp-content/themes/kulib/style-custom.css?ver=5.5.10'
	type='text/css' media='all' />
<link rel='stylesheet' id='jquery-flick-style-css'
	href='https://library.korea.ac.kr/wp-content/plugins/kboard/template/css/jquery-ui.css?ver=1.12.1'
	type='text/css' media='all' />
<link rel='stylesheet' id='jquery-timepicker-css'
	href='https://library.korea.ac.kr/wp-content/plugins/kboard/template/css/jquery.timepicker.css?ver=5.8'
	type='text/css' media='all' />
<link rel='stylesheet' id='kboard-comments-skin-default-css'
	href='https://library.korea.ac.kr/wp-content/plugins/kboard-comments/skin/default/style.css?ver=4.9'
	type='text/css' media='all' />
<link rel='stylesheet' id='kboard-editor-media-css'
	href='https://library.korea.ac.kr/wp-content/plugins/kboard/template/css/editor_media.css?ver=5.8'
	type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-kulib-entertain-css'
	href='https://library.korea.ac.kr/wp-content/plugins/kboard/skin/kulib-entertain/style.css?ver=5.8'
	type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-kulib-request-otherlib-css'
	href='https://library.korea.ac.kr/wp-content/plugins/kboard/skin/kulib-request-otherlib/style.css?ver=5.8'
	type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-kulib-request-oldbook-css'
	href='https://library.korea.ac.kr/wp-content/plugins/kboard/skin/kulib-request-oldbook/style.css?ver=5.8'
	type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-kulib-education-css'
	href='https://library.korea.ac.kr/wp-content/plugins/kboard/skin/kulib-education/style.css?ver=5.8'
	type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-kulib-default-css'
	href='https://library.korea.ac.kr/wp-content/plugins/kboard/skin/kulib-default/style.css?ver=5.8'
	type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-kulib-request-mediamaker-css'
	href='https://library.korea.ac.kr/wp-content/plugins/kboard/skin/kulib-request-mediamaker/style.css?ver=5.8'
	type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-kulib-faq-css'
	href='https://library.korea.ac.kr/wp-content/plugins/kboard/skin/kulib-faq/style.css?ver=5.8'
	type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-kulib-events-css'
	href='https://library.korea.ac.kr/wp-content/plugins/kboard/skin/kulib-events/style.css?ver=5.8'
	type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-kulib-request-yeonsei-css'
	href='https://library.korea.ac.kr/wp-content/plugins/kboard/skin/kulib-request-yeonsei/style.css?ver=5.8'
	type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-kulib-gallery-css'
	href='https://library.korea.ac.kr/wp-content/plugins/kboard/skin/kulib-gallery/style.css?ver=5.8'
	type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-kulib-gallery2-css'
	href='https://library.korea.ac.kr/wp-content/plugins/kboard/skin/kulib-gallery2/style.css?ver=5.8'
	type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-kulib-gallery-oldbook-css'
	href='https://library.korea.ac.kr/wp-content/plugins/kboard/skin/kulib-gallery-oldbook/style.css?ver=5.8'
	type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-kulib-gallery-ancientbook-css'
	href='https://library.korea.ac.kr/wp-content/plugins/kboard/skin/kulib-gallery-ancientbook/style.css?ver=5.8'
	type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-kulib-gallery-slider-css'
	href='https://library.korea.ac.kr/wp-content/plugins/kboard/skin/kulib-gallery-slider/style.css?ver=5.8'
	type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-kulib-edu-video-css'
	href='https://library.korea.ac.kr/wp-content/plugins/kboard/skin/kulib-edu-video/style.css?ver=5.8'
	type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-kulib-request-customedu-css'
	href='https://library.korea.ac.kr/wp-content/plugins/kboard/skin/kulib-request-customedu/style.css?ver=5.8'
	type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-kulib-calendar-regedu-css'
	href='https://library.korea.ac.kr/wp-content/plugins/kboard/skin/kulib-calendar-regedu/style.css?ver=5.8'
	type='text/css' media='all' />
<script type='text/javascript'
	src='https://library.korea.ac.kr/wp-includes/js/jquery/jquery.js?ver=1.12.4-wp'
	id='jquery-core-js'></script>
<script type='text/javascript'
	id='graphina-charts-for-elementor-public-js-extra'>
/* <![CDATA[ */
var graphina_localize = {"ajaxurl":"https:\/\/library.korea.ac.kr\/wp-admin\/admin-ajax.php","nonce":"674164e011","graphinaAllGraphs":[],"graphinaAllGraphsOptions":[],"graphinaBlockCharts":[]};
/* ]]> */
</script>
<script type='text/javascript'
	src='https://library.korea.ac.kr/wp-content/plugins/graphina-elementor-charts-and-graphs/elementor/js/graphina-charts-for-elementor-public.js?ver=1.5.4'
	id='graphina-charts-for-elementor-public-js'></script>
<script type='text/javascript'
	src='https://library.korea.ac.kr/wp-content/themes/kulib/plugins/chartjs/Chart.min.js?ver=5.5.10'
	id='kulib-chartjs-js'></script>
<script type='text/javascript'
	src='https://library.korea.ac.kr/wp-content/plugins/kboard/template/js/jquery.timepicker.js?ver=5.8'
	id='jquery-timepicker-js'></script>
<link rel="https://api.w.org/"
	href="https://library.korea.ac.kr/wp-json/" />
<link rel="alternate" type="application/json"
	href="https://library.korea.ac.kr/wp-json/wp/v2/pages/2053" />
<link rel="EditURI" type="application/rsd+xml" title="RSD"
	href="https://library.korea.ac.kr/xmlrpc.php?rsd" />
<link rel="wlwmanifest" type="application/wlwmanifest+xml"
	href="https://library.korea.ac.kr/wp-includes/wlwmanifest.xml" />
<meta name="generator" content="WordPress 5.5.10" />
<link rel="canonical" href="https://library.korea.ac.kr/detail/" />
<link rel='shortlink' href='https://library.korea.ac.kr/?p=2053' />
<link rel="alternate" type="application/json+oembed"
	href="https://library.korea.ac.kr/wp-json/oembed/1.0/embed?url=https%3A%2F%2Flibrary.korea.ac.kr%2Fdetail%2F" />
<link rel="alternate" type="text/xml+oembed"
	href="https://library.korea.ac.kr/wp-json/oembed/1.0/embed?url=https%3A%2F%2Flibrary.korea.ac.kr%2Fdetail%2F&#038;format=xml" />
<!-- Analytics by WP-Statistics v12.6.13 - https://wp-statistics.com/ -->
<meta name="generator" content="WPML ver:4.3.10 stt:1,29;" />

<!-- GA Google Analytics @ https://m0n.co/ga -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-161598556-1"></script>
<script>
			window.dataLayer = window.dataLayer || [];
			function gtag(){dataLayer.push(arguments);}
			gtag('js', new Date());
			gtag('config', 'UA-161598556-1');
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
<script type='text/javascript'
	src='https://library.korea.ac.kr/wp-includes/js/wp-embed.min.js?ver=5.5.10'
	id='wp-embed-js'></script>
</head>


<body
	class="page-template page-template-page-without-title page-template-page-without-title-php page page-id-2053 logged-in wp-custom-logo wp-embed-responsive has-fixed-top singular image-filters-enabled elementor-default elementor-kit-14083">

	<div id="page" class="site">
		<a class="skip-link screen-reader-text" href="#content">내용으로 건너뛰기</a>

		<header id="masthead" class="site-header">

			<script type="text/javascript"
				src="https://library.korea.ac.kr/ezast/service/incscript.n2s?charset=utf-8&acbody=/ezast/service/n2ezast_body_main_result.html"
				charset="UTF-8"></script>

			<script>
	jQuery(function($) {		// 2020.03.27 추가 - 검색어 입력여부 체크기능

		$(".input-tot-search-terms").keydown(function(e) {			// 상단 통합검색 검색어 입력박스 엔터-키 처리
			if (e.keyCode == 13) {
				$( ".submit-tot-search-button" ).trigger( "click" );
			}
		});
		$(".submit-tot-search-button").click(function(e) {			// 상단 통합검색 검색어 입력여부 체크
			var q = $(".input-tot-search-terms").val().trim();
			if (q == '') {
				alert("검색어를 입력하세요.");
				return false;
			}
		});

		$(".input-site-search-terms").keydown(function(e) {			// 우측상단 사이트내 검색어 입력박스 엔터-키 처리
			if (e.keyCode == 13) {
				$( ".submit-site-search-button" ).trigger( "click" );
			}
		});
		$(".submit-site-search-button").click(function(e) {			// 우측상단 사이트내 검색어 입력여부 체크
			var q = $(".input-site-search-terms").val().trim();
			if (q == '') {
				alert("검색어를 입력하세요.");
				return false;
			}
		});

	});
</script>

			<!-- navigation start-->
			<div id="navigation">
				<!-- include_common_left.jsp start-->
				<jsp:include page="common/include_common_top_menu_templateVer.jsp" />
				<!-- include_common_left.jsp end-->
			</div>
			<!-- navigation end-->
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
										property="item" typeof="WebPage" title="Go to 고려대학교 도서관."
										href="https://library.korea.ac.kr" class="home"><span
											property="name">HOME</span></a>
										<meta property="position" content="1"></span> &gt; <span
										class="post post-page current-item">상세정보</span>
								</div>
								<!-- .entry-nav -->

								<h1 class="entry-title">상세정보</h1>
							</div>
							<!-- .entry-header-bar -->


						</header>
						<!-- .entry-header -->
						<div class="entry-content">


							<div class="item-detail-header">
								<div class="container">

									<div
										class="item-detail-header-bar d-flex justify-content-between">
										<div>
											<a id="searchresult" href="/datause/collection/best/total/"><svg
													class="svg-icon" width="21" height="21" aria-hidden="true"
													role="img" focusable="false" viewBox="0 0 24 24"
													version="1.1" xmlns="http://www.w3.org/2000/svg"
													xmlns:xlink="http://www.w3.org/1999/xlink">
													<path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"></path>
													<path d="M0 0h24v24H0z" fill="none"></path></svg>이전 결과로 돌아가기</a> <a
												href="/datause/advanced-search/advanced-search-form/"><svg
													class="svg-icon" width="16" height="16" aria-hidden="true"
													role="img" focusable="false"
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
													<path d="M0 0h24v24H0z" fill="none"></path>
													<path
														d="M15.357,4.288c-3.051-3.051-8.017-3.051-11.068,0c-3.052,3.052-3.052,8.016,0,11.069c2.716,2.716,6.949,3.008,9.997,0.885 c0.065,0.306,0.212,0.594,0.448,0.83l4.443,4.441c0.646,0.648,1.693,0.648,2.338,0c0.646-0.646,0.646-1.69,0-2.335l-4.444-4.445 c-0.235-0.234-0.523-0.382-0.826-0.446C18.367,11.237,18.074,7.006,15.357,4.288z M13.954,13.954c-2.279,2.277-5.986,2.277-8.263,0 c-2.276-2.278-2.276-5.984,0-8.263c2.276-2.277,5.984-2.277,8.263,0C16.231,7.97,16.231,11.676,13.954,13.954z"></path></svg>&nbsp;검색화면</a>
										</div>

									</div>

								</div>
								<!-- .container -->
							</div>
							<!-- .item-detail-header -->

							<div class="item-detail-content">





								<script>

	
	var loadLocationMap = function(loc, sub_loc, bookshelf) {		// 2019.11.15 추가 - '소장처위치' 링크 클릭 - getElementById 'modal-body-location' HTML 내용변경
		var url = "/n2app/las/locationMap.php?loc="+loc+"&sub_loc="+sub_loc+"&bookshelf="+bookshelf;
    modal_body_location_iframe.location.href = url;		// layer로 출력
	}

	var userRequest = function(cmd, accessno, mainno, location) {		// 2020.03.04 추가 - 각종 이용자 신청 처리		// 2020.05.29 함수 수신부에 분관코드(location) 파라미터 추가
		var url = '';
		if (cmd=="brief") {
			url = "/loan-request-brief/?accessno="+accessno+"&mainno="+mainno+"&location="+location;				// 2020.05.29 요청시 분관코드(location) 파라미터 추가
			var title = "간편대출 신청";
			document.getElementById("item-user-request-title").innerHTML = title;
		}
		else if (cmd=="branch") {
			url = "/loan-request-branch/?accessno="+accessno+"&mainno="+mainno;
			var title = "분관대출 신청";
			document.getElementById("item-user-request-title").innerHTML = title;
		}
		else if (cmd=="reserve") {
			url = "/book-reserve/?accessno="+accessno+"&mainno="+mainno;
			var title = "도서예약 신청";
			document.getElementById("item-user-request-title").innerHTML = title;
		}
		else if (cmd=="sendsms") {
			url = "/send-sms/?accessno="+accessno+"&mainno="+mainno;
			var title = "소장정보 발송 서비스";
			document.getElementById("item-user-request-title").innerHTML = title;
		}
		else if (cmd=="sns") {		// 2020.04.06 추가 - SNS 공유처리 : accessno, mainno 값에 cid, ctype 값이 들어온다.
			url = "/n2app/public/exportsns.php?cid="+accessno+"&ctype="+mainno;
			var title = "SNS 공유";
			document.getElementById("item-user-request-title").innerHTML = title;
		}
		else {
			var message = "잘못된 요청입니다.";
			alert(message);
			return false;
		}
				
		modal_user_request_iframe.location.href = url;		// layer로 출력
	}

	var oldbookRequest = function(accessno, callno, cid) {		// 2020.03.07 추가 - 고서열람 신청 처리
		var url = "/oldbook-request/?accessno="+accessno+"&callno="+encodeURIComponent(callno)+"&cid="+cid;
		var settings ='toolbar=0,directories=0,status=no,menubar=0,scrollbars=yes,resizable=yes,height=940,width=1220,left=0,top=0',
		windowObj = window.open( url, 'child', settings );
		return;
	}

	var getDetailInfo = function(byid, fld, cid, item) {		// 2021.05.03 기능추가 - 전자자료 섹션의 디콜렉션을 통해 학위논문, 고서, 귀중서 등의 원문 서비스 파일을 구축한 경우, PDF 원문정보 외에 초록/목차 정보가 있을때 PDF 아이콘 우측에 [초록], [목차] 아이콘을 추가로 표시
		/* byid	; 변경할 HTML의 ID 태그 */
		var url = "/n2app/las/get_bookdetail.php?df=fulltext&cid="+cid+"&item="+item+"&fld="+fld+"&type=html";
		var getdata = getajax(url);
		if (getdata['success']) {
			document.getElementById(byid).innerHTML = getdata['html'];
		}
		else {
			return false;
		}
	}

	jQuery(function($){
		$(".reset-iframe-content").click(function(e) {		// 2020.03.09 추가 - 각종 서비스 신청 페이지 리셋
			modal_user_request_iframe.location.href = "/n2app/public/layer_blank.html";
		});

		$(".item-add-trigger").click(function(e) {		// 2020.03.23 추가 - 내 서재에 아이템 추가 기능
			var execUrl = "/apitools/?cmd=mylib&section=MYI&directive=II" + "&folder_id=" + $(this).attr('folder-val') + "&sysd=" + $(this).attr('sysd-val') + "&ctrl=" + $(this).attr('ctrl-val')+"&accessKey=tD3BOn8l7Ao2IbLceYzu";
			var getdata = getajax(execUrl);
			if (getdata['success'] === true) {
				alert(getdata['message']);
				location.reload();
			}
			else {
				alert(getdata['message']);
			}
		});

		$(".get-book-abstract").click(function(e) {		// 2021.05.03 추가 - 전자정보 목록에서 '초록' 버튼 클릭 - getElementById 'modal-body-abstract' HTML 내용변경
			var cid = "CAT000046124897";
			var item = $(this).attr('data-item');
			getDetailInfo('modal-body-abstract', 'abs', cid, item);
		});
		$(".get-book-toc").click(function(e) {				// 2021.05.03 추가 - 전자정보 목록에서 '목차' 버튼 클릭 - getElementById 'modal-body-toc' HTML 내용변경
			var cid = "CAT000046124897";
			var item = $(this).attr('data-item');
			getDetailInfo('modal-body-toc', 'toc', cid, item);
		});

	});


</script>

								<div class="container">

									<div class="item-detail row">

										<div class="item-cover col-lg-2">

											<div class="item-cover-slider">
												<div>
													<img class="multi-cover" style="display: none;"
														src="${book.book_image_src }" alt="하얼빈 : 김훈 장편소설" />
												</div>
											</div>
											<script>									
							jQuery(function($) {
								$(document).ready(function(){
									$(".multi-cover").show();
								});
							});
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
								$(document).ready(function(){
									$("#preview-link").show();
								});
							});
							
						</script>

										</div>

										<div class="item-data col-lg-10">

											<div class="item-row d-lg-flex justify-content-between mb-3">
												<div class="item-title pr-lg-5 flex-grow-0">
													<h2>${book.book_title }
														<span class="item-meta-value"> (<span
															class="number">${book.book_rental_cnt }</span>회 대출)
														</span>
													</h2>
												</div>

												<div
													class="item-functions flex-shrink-0 d-flex justify-content-center justify-content-lg-end">
													<a
														href="/n2app/public/export.php?fmt=endnote&cid=CAT000046124897&ctype=m"
														role="button" class="item-tooltip" data-toggle="tooltip"
														data-placement="bottom" title="EndNote"><svg
															class="svg-icon" width="24" height="24"
															aria-hidden="true" role="img" focusable="false"
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
															<path d="M0 0h24v24H0z" fill="none"></path>
															<path
																d="M21.354,17.021l-0.705-0.119c-0.073-0.236-0.168-0.467-0.283-0.686l0.416-0.58 c0.176-0.248,0.15-0.586-0.067-0.799l-0.625-0.627c-0.118-0.117-0.272-0.182-0.439-0.182c-0.13,0-0.255,0.04-0.359,0.115 l-0.582,0.415c-0.228-0.12-0.465-0.218-0.71-0.292l-0.119-0.697c-0.049-0.299-0.309-0.518-0.613-0.518h-0.883 c-0.305,0-0.561,0.219-0.611,0.518l-0.123,0.715c-0.235,0.072-0.463,0.17-0.683,0.287l-0.577-0.414 c-0.104-0.076-0.23-0.117-0.36-0.117c-0.166,0-0.322,0.064-0.438,0.183l-0.628,0.626c-0.212,0.214-0.243,0.551-0.067,0.801 l0.42,0.588c-0.115,0.221-0.209,0.449-0.279,0.688l-0.697,0.117c-0.3,0.051-0.518,0.309-0.518,0.613v0.883 c0,0.305,0.218,0.562,0.518,0.613l0.715,0.121c0.073,0.236,0.171,0.465,0.288,0.684l-0.414,0.574 c-0.176,0.248-0.15,0.586,0.066,0.801l0.626,0.625c0.118,0.117,0.273,0.182,0.439,0.182c0.129,0,0.253-0.039,0.357-0.115l0.591-0.42 c0.212,0.112,0.433,0.201,0.664,0.273l0.117,0.706c0.05,0.301,0.309,0.52,0.611,0.52h0.887c0.305,0,0.562-0.219,0.613-0.52 l0.119-0.706c0.237-0.072,0.468-0.168,0.685-0.283l0.582,0.415c0.104,0.076,0.229,0.116,0.359,0.116l0,0 c0.165,0,0.32-0.066,0.438-0.184l0.627-0.625c0.215-0.213,0.244-0.553,0.066-0.8l-0.415-0.585c0.114-0.219,0.212-0.448,0.285-0.683 l0.704-0.118c0.3-0.051,0.518-0.309,0.518-0.613v-0.883C21.872,17.33,21.653,17.072,21.354,17.021z M16.845,20.005 c-1.063,0-1.93-0.864-1.93-1.929c0-1.066,0.866-1.931,1.93-1.931c1.066,0,1.931,0.864,1.931,1.931 C18.775,19.141,17.911,20.005,16.845,20.005z M16.308,11.246H7.328c-0.481,0-0.872-0.391-0.872-0.872s0.391-0.871,0.872-0.871h8.979 c0.481,0,0.872,0.39,0.872,0.871S16.789,11.246,16.308,11.246z M10.582,12.989c0.482,0,0.872,0.391,0.872,0.872 s-0.39,0.871-0.872,0.871H7.328c-0.481,0-0.872-0.39-0.872-0.871s0.391-0.872,0.872-0.872H10.582z M10.95,22.23 c0,0.481-0.39,0.872-0.871,0.872H6.461c-1.922,0-3.487-1.565-3.487-3.488V4.272c0-1.922,1.565-3.486,3.487-3.486H17.18 c1.922,0,3.486,1.564,3.486,3.486v6.362c0,0.48-0.391,0.871-0.872,0.871s-0.871-0.391-0.871-0.871V4.272 c0-0.962-0.782-1.743-1.743-1.743H6.461c-0.961,0-1.743,0.781-1.743,1.743v15.342c0,0.961,0.782,1.743,1.743,1.743h3.618 C10.561,21.357,10.95,21.748,10.95,22.23z M17.18,6.888c0,0.48-0.391,0.871-0.872,0.871H7.328c-0.481,0-0.872-0.391-0.872-0.871 c0-0.482,0.391-0.873,0.872-0.873h8.979C16.789,6.015,17.18,6.406,17.18,6.888z"></path></svg></a>
													<span class="item-modal" data-toggle="modal"
														data-target="#item-user-request"> <a
														href="javascript:userRequest('sns','CAT000046124897','m','');"
														role="button" class="item-tooltip" data-toggle="tooltip"
														data-placement="bottom" title="SNS 공유"><svg
																class="svg-icon" width="24" height="24"
																aria-hidden="true" role="img" focusable="false"
																xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
																<path fill="none" d="M0 0h24v24H0z" />
																<path
																	d="M13.12 17.023l-4.199-2.29a4 4 0 1 1 0-5.465l4.2-2.29a4 4 0 1 1 .959 1.755l-4.2 2.29a4.008 4.008 0 0 1 0 1.954l4.199 2.29a4 4 0 1 1-.959 1.755zM6 14a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm11-6a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0 12a2 2 0 1 0 0-4 2 2 0 0 0 0 4z" /></svg></a>
													</span> <span class="item-modal" data-toggle="modal"
														data-target="#directory-select"> <a role="button"
														class="item-tooltip" data-toggle="tooltip"
														data-placement="bottom" title="내 서재에 보관"><svg
																class="svg-icon" width="24" height="24"
																aria-hidden="true" role="img" focusable="false"
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
													<div class="item-meta-value">파주 : &nbsp;
														${book.book_publisher }, &nbsp; ${book.book_publish_date }
														&nbsp;</div>
												</div>

												<div class="d-lg-flex">
													<div class="item-meta-key">형태사항</div>
													<div class="item-meta-value">${book.book_page } p. :
														삽화 ; 20 cm</div>
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

									<!-- <pre># DEBUG: ctype=m | ISBN_ALL=SimpleXMLElement Object
(
    [0] => 9788954699914  
)
1 | ISBN="9788954699914"</pre> -->
									<div id="er_finder-result">
										<!-- e-Book Resources -->
									</div>
									<script>
				
					var get_er_finder = function(byid) {
						var ajaxurl = "/n2app/eds/er_finder.php?isbn=9788954699914";
						jQuery(function($) {
							$.ajax({
								cache: false,
								async: true,
								type: 'get',
								dataType: 'jsonp',
								url: ajaxurl,
								success: function(data) {
									document.getElementById(byid).innerHTML = data['html'];
								}
							});
						});
					}
				
				get_er_finder('er_finder-result');
				</script>



									<div class="item-location item-additional-info">

										<div
											class="item-location-header d-md-flex justify-content-start align-items-center mb-3">

											<h3>소장정보</h3>


										</div>
										<!-- .item-location-header -->

										<div class="item-location-content tab-content">
											<div class="tab-pane fade show active" id="locs-1"
												role="tabpanel" aria-labelledby="locs-1-tab">
												<div class="table-container table-locations">
													<table class="table table-sm table-hover text-center">
														<thead>
															<tr>
																<th scope="col">No.</th>
																<th scope="col">소장처</th>
																<th scope="col">청구기호</th>
																<th scope="col">등록번호</th>
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
																<td><span class="th-item">등록번호</span> 111867906</td>
																<td><span class="th-item">도서상태</span> 펑션넣어야하냐 if</td>
																<td><span class="th-item">반납예정일</span> 2022-10-15</td>
																<td><span class="th-item">예약</span> 예약한도초과</td>
																</td>
																<!-- 2020.03.08 서비스 아이콘 셀 왼쪽 정렬 -->
																<td><span class="th-item">서비스</span> <span
																	class="item-modal" data-toggle="modal"
																	data-target="#item-user-request"> <a
																		class="item-loc-service" title="소장정보발송"
																		href="javascript:userRequest('sendsms','000151361197','1018413246','000AC4JL');"><span
																			class="char-icon char-icon-blue">M</span></a>
																</span></td>
															</tr>
														</tbody>
													</table>
												</div>
												<!-- .table-container.table-locations -->
											</div>
											<!-- .tab-pane -->


										</div>
										<!-- .item-location-content -->

										<!-- R=도서예약, B=간편대출, C=분관대출,  O=고서열람,  M=소장정보 -->
										<div class="item-location-footer">
											<div class="item-services text-right">
												<span><span class="char-icon char-icon">R</span> 도서예약</span>
												<span><span class="char-icon char-icon-magenta">B</span>
													간편대출</span> <span><span class="char-icon char-icon-green">C</span>
													분관대출</span> <span><span class="char-icon char-icon-orange">O</span>
													고서열람</span> <span><span class="char-icon char-icon-blue">M</span>
													소장정보</span>
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
														target="_blank"><img src="/n2app/images/aladin.png"
															alt="Aladin"></a></span>
												</div>
												<!-- .inner-area -->
											</div>

											<div class="item-expand-buttons">
												<a class="btn btn-primary btn-sm btn-sub btn-expand">
													펼치기<svg class="svg-icon" width="13" height="13"
														aria-hidden="true" role="img" focusable="false"
														viewBox="0 0 24 24" version="1.1"
														xmlns="http://www.w3.org/2000/svg"
														xmlns:xlink="http://www.w3.org/1999/xlink">
														<path d="M20,6l-8,12L4,6H20z"></path>
														<path d="M0 0h24v24H0z" fill="none"></path></svg>
												</a> <a
													class="btn btn-primary btn-sm btn-sub btn-collapse d-none invisible">
													접기<svg class="svg-icon" width="13" height="13"
														aria-hidden="true" role="img" focusable="false"
														viewBox="0 0 24 24" version="1.1"
														xmlns="http://www.w3.org/2000/svg"
														xmlns:xlink="http://www.w3.org/1999/xlink">
														<path d="M4,18l8-12l8,12H4z"></path>
														<path d="M0 0h24v24H0z" fill="none"></path></svg>
												</a>
											</div>
										</div>


										<!-- 청구기호 브라우징 출력 -->
										<div class="item-related-books item-additional-info">
											<h3 class="mb-3">청구기호 브라우징</h3>
											<div class="item-related-books-content">
												<div class="item-related-book-slider"
													data-slick='{"slidesToScroll": 1}'>
													<div class="item item-related-book">
														<div class="item-cover">
															<a href="/detail/?cid=CAT000000712681&ctype=m">
																<div class="item-cover-image"
																	style="background-image: url(https://image.aladin.co.kr/product/27/73/cover/8984980358_1.gif)"></div>
															</a>
														</div>
														<div class="item-meta">
															<div class="item-marc">897.36 김훈 칼 2</div>
															<div class="item-title">
																<h4>
																	<a href="/detail/?cid=CAT000000712681&ctype=m">(小說
																		이순신) 칼의 노래. 2</a>
																</h4>
															</div>
															<div class="item-author">
																김훈
																<!-- #slide inx=0 / curindex=0 -->
															</div>
														</div>
													</div>
													<!-- .item -->
													<div class="item item-related-book">
														<div class="item-cover">
															<a href="/detail/?cid=CAT000000832877&ctype=m">
																<div class="item-cover-image"
																	style="background-image: url(https://image.aladin.co.kr/product/30/22/cover/8984980692_1.gif)"></div>
															</a>
														</div>
														<div class="item-meta">
															<div class="item-marc">897.36 김훈 칼a</div>
															<div class="item-title">
																<h4>
																	<a href="/detail/?cid=CAT000000832877&ctype=m">칼의
																		노래</a>
																</h4>
															</div>
															<div class="item-author">
																김훈
																<!-- #slide inx=1 / curindex=0 -->
															</div>
														</div>
													</div>
													<!-- .item -->

													김훈
													<!-- #slide inx=11 / curindex=10 -->
												</div>
											</div>
										</div>
										<!-- .item -->

									</div>
									<!-- .item-related-book-slider -->

									<script>
							var curindex = 10;
							// 2019.10.15 현재 상세정보 도서로 청구기호 브라우징 슬라이드 위치 이동
							
							jQuery(function($) {

								$(document).ready(function(){

									// 현재 도서로 정확인 위치이동 하기위한 인덱스 조정. 초기값: 5개씩 출력시 0, 3개 출력시 2 - 적용안됨
									var SlideDivWidth = $('.item-related-books').width();		// 반응형 웹에 따른 width 값 구하기
									//alert("# SlideDivWidth="+SlideDivWidth);
									if (SlideDivWidth <= 510) {		// 510 이하이면 스마트폰(2개) 화면
										curindex = curindex;		// 2열 출력 - 스마트폰 화면
									}
									else if (SlideDivWidth <= 920) {		// 920 이하이면 태블릿(3개) 화면
										// curindex = curindex - 1;		// 3열 출력 - 태블릿 화면
										// 2019.10.29 3열 출력 시 청구기호 브라우징 좌,우 건수가 10이 아닌경우 3개중 가운데로 안 오고 틀어진다.(2, 5열 출력은 정상)
										if (curindex >= 15) {
											curindex = curindex + 1;
										}
										else {
											curindex = curindex - 1;
										}
									} else {
										curindex = curindex - 2;		// 5열 출력 - PC화면
									}
									//alert("# curindex="+curindex+" # SlideDivWidth="+SlideDivWidth);
									$('.item-related-book-slider').slick('slickGoTo', curindex);

									if (SlideDivWidth <= 510) {		// 510 이하이면 스마트폰(2개) 화면
										$('.item-related-book-slider').slick('slickSetOption', 'slidesToScroll', 2);
									}
									else if (SlideDivWidth <= 920) {		// 920 이하이면 태블릿(3개) 화면
										$('.item-related-book-slider').slick('slickSetOption', 'slidesToScroll', 3);
									}
									else {	// 920 보다크면... 즉, PC 화면일때 slidesToScroll 값을 5로 복원
										$('.item-related-book-slider').slick('slickSetOption', 'slidesToScroll', 5);
									}

								});
							});
							
						</script>

								</div>
								<!-- .item-related-books-content -->
							</div>
							<!-- .item-related-books.item-additional-info -->


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

									<script>
							
							jQuery(function($) {

								$(document).ready(function(){
									var SlideDivWidth = $('.item-popular-books').width();		// 반응형 웹에 따른 width 값 구하기
									if (SlideDivWidth <= 510) {		// 510 이하이면 스마트폰(2개) 화면
										$('.item-popular-book-slider').slick('slickSetOption', 'slidesToScroll', 2);
									}
									else if (SlideDivWidth <= 920) {		// 920 이하이면 태블릿(3개) 화면
										$('.item-popular-book-slider').slick('slickSetOption', 'slidesToScroll', 3);
									}
									else {	// 920 보다크면... 즉, PC 화면일때 slidesToScroll 값을 5로 복원
										$('.item-popular-book-slider').slick('slickSetOption', 'slidesToScroll', 5);
									}
								});
							});
							
						</script>

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
											<div class="item-meta">
												<!-- <div class="item-marc">897.17 한연순 분</div> -->
												<div class="item-title">
													<h4>
														<a href="/detail/?cid=CAT000046128962&ctype=m">분홍 눈사람
															: 한연순 시집</a>
													</h4>
												</div>
												<div class="item-author">한연순 (2021)</div>
											</div>
										</div>
										<!-- .item -->


									</div>
									<!-- .item-newarrival-book-slider -->
									<a class="item-newarrival-books-prev"><svg class="svg-icon"
											width="48" height="48" aria-hidden="true" role="img"
											focusable="false" viewBox="0 0 24 24" version="1.1"
											xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink">
										<path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"></path>
										<path d="M0 0h24v24H0z" fill="none"></path></svg></a> <a
										class="item-newarrival-books-next"><svg class="svg-icon"
											width="48" height="48" aria-hidden="true" role="img"
											focusable="false" xmlns="http://www.w3.org/2000/svg"
											viewBox="0 0 24 24">
										<path d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path>
										<path d="M0 0h24v24H0z" fill="none"></path></svg></a>

									<script>
							
							jQuery(function($) {

								$(document).ready(function(){
									var SlideDivWidth = $('.item-newarrival-books').width();		// 반응형 웹에 따른 width 값 구하기
									if (SlideDivWidth <= 510) {		// 510 이하이면 스마트폰(2개) 화면
										$('.item-newarrival-book-slider').slick('slickSetOption', 'slidesToScroll', 2);
									}
									else if (SlideDivWidth <= 920) {		// 920 이하이면 태블릿(3개) 화면
										$('.item-newarrival-book-slider').slick('slickSetOption', 'slidesToScroll', 3);
									}
									else {	// 920 보다크면... 즉, PC 화면일때 slidesToScroll 값을 5로 복원
										$('.item-newarrival-book-slider').slick('slickSetOption', 'slidesToScroll', 5);
									}
								});
							});
							
						</script>

								</div>
								<!-- .item-newarrival-books-content -->
							</div>
							<!-- .item-newarrival-books.item-additional-info -->
						</div>
						<!-- .container -->


						<div class="modal fade" id="item-location-introduction"
							tabindex="-1" role="dialog"
							aria-labelledby="item-location-introduction-title"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content" style="height: 660px;">
									<div class="modal-header">
										<h5 class="modal-title" id="item-location-introduction-title">소장위치
											정보</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="닫기">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body" id="modal-body-location">
										<!-- HTML Dynamic loading... -->
										<iframe title="소장처 위치" src="/n2app/public/layer_blank.html"
											width="100%" height="100%" name="modal_body_location_iframe"
											frameborder="0"></iframe>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>

						<div class="modal fade" id="directory-select" tabindex="-1"
							role="dialog" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">저장할 폴더 선택</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="닫기">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div class="directory-select">
											<a role="button"
												class="btn btn-grey rounded-0 item-add-trigger"
												sysd-val="CAT" ctrl-val="000046124897" folder-val="81013">
												Default Folder (<span class="item-index">0</span>)
											</a>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>

						<div class="modal fade" id="item-user-request" tabindex="-1"
							role="dialog" aria-labelledby="item-user-request-title"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="item-user-request-title">신청
											제목</h5>
										<button type="button" class="close reset-iframe-content"
											data-dismiss="modal" aria-label="닫기">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body item-overview-info-block-body active"
										id="modal-body-user-request">
										<!-- HTML Dynamic loading... -->
										<iframe title="신청기능" src="/n2app/public/layer_blank.html"
											width="100%" height="100%" name="modal_user_request_iframe"
											frameborder="0" id="iframe" onload="iframeLoaded()"></iframe>
									</div>
									<div class="modal-footer">
										<button type="button"
											class="btn btn-secondary reset-iframe-content"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>

						<script>
	function iframeLoaded() {
		var iFrame = document.getElementById('iframe');
		if(iFrame) {
			iFrame.height = iFrame.contentWindow.document.body.scrollHeight + 30 + "px";
		}
	}
</script>

						<div class="modal fade" id="item-book-abstract" tabindex="-1"
							role="dialog" aria-labelledby="item-book-abstract-title"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="item-book-abstract-title">초록</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="닫기">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body item-overview-info-block-body active"
										id="modal-body-abstract">
										<!-- HTML Dynamic loading... -->
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>

						<div class="modal fade" id="item-toc" tabindex="-1" role="dialog"
							aria-labelledby="item-toc-title" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="item-toc-title">목차</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="닫기">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body item-overview-info-block-body active"
										id="modal-body-toc">
										<!-- HTML Dynamic loading... -->
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
			</div>
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
