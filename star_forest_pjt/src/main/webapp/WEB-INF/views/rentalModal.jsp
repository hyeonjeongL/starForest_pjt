<html lang="ko-KR"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>간편대출 신청</title>
<script src="/wp-includes/js/jquery/jquery.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli%3A400%2C500%2C700%7CNoto+Sans+KR%3A400%2C500%2C700&amp;display=swap&amp;ver=5.3.2" type="text/css" media="all">
<link rel="stylesheet" href="/wp-content/themes/kulib/plugins/bootstrap/css/bootstrap.css" type="text/css" media="all">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.9.0/css/all.css?ver=5.9.0" type="text/css" media="all">
<link rel="stylesheet" href="/wp-content/themes/kulib/style.css" type="text/css" media="all">
<script>
	var url = "/loan-request-brief/?cmd=request&apikey=vRV6GK9yO2NthqS8Q5sF&accessno=000111354159&mainno=1008356440";


	jQuery(function($) {
		$(".submit-request").click(function(e) {
			
			var receive_location = '';
			receive_location = $("input:radio[name=receive_location_code]:checked").val();
			if (receive_location == undefined) {
				alert("수령처를 선택하세요.");
				return;
			}
			url += "&receive_location="+receive_location;
			window.location.replace(url);
			return;
		});

	});


</script></head>



<body class="modal-page">
	
	<div class="container">
		
		<div class="entry-content">

			
			<div class="content-d">
				<h4 class="content-h4"><i class="fas fa-arrow-alt-circle-right"></i> 수령처</h4>
				<div class="content-l">
										<div>
						<label class="attr-value-label">
							<input type="radio" name="receive_location_code" class="purchase-type" value="0002"> 중앙도서관(1층)/스마트대출반납기
						</label>
					</div>
										<div>
						<label class="attr-value-label">
							<input type="radio" name="receive_location_code" class="purchase-type" value="0003"> 백주년기념관(지하)/스마트대출반납기
						</label>
					</div>
										<div>
						<label class="attr-value-label">
							<input type="radio" name="receive_location_code" class="purchase-type" value="0005"> 하나스퀘어(지하)/스마트대출반납기
						</label>
					</div>
										<div>
						<label class="attr-value-label">
							<input type="radio" name="receive_location_code" class="purchase-type" value="0006"> 의학도서관(1층)/스마트대출반납기
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
			
			<div class="content-d">
				<h4 class="content-h4"><i class="fas fa-arrow-alt-circle-right"></i> 간편대출 관련 문의</h4>
				<div class="content-l">
					<ul>
						<li>중앙도서관 1F 인포메이션 3290-1486</li>
						<li>과학도서관 2F Sci-info 3290-4225</li>
						<li>의학도서관 3F 자료실 2286-1254</li>
					</ul>
				</div>
			</div>

			
		</div><!-- .entry-content -->
		
	</div><!-- .container -->



</body></html>