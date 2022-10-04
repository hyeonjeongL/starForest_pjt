function MyLibraryHtmlContents() {
}
MyLibraryHtmlContents.mylibrary_left_menu_content = function() {
	return `<div class="col-md-3 noto-serif">
					<div class="sidebar">
						<div class="side-head">
							<h4 class="text-light">나의도서</h4>
						</div>
						<ul class="list-group list-group-flush mb-5">
							<li class="list-group-item">
								<a href="#" id="mypage">마이페이지</a>
							</li>
							<li class="list-group-item">
								<a href="#" id="user_rental_list">나의도서정보</a>
							</li>
							<li class="list-group-item">
								<a href="#" id="user_rental_status">대출현황</a>
							</li>
							<li class="list-group-item">
								<a href="#" id="user_res_status">예약현황</a>
							</li>
							<li class="list-group-item">
								<a href="#" id="user_club_list">동아리신청내역</a>
							</li>
							<li class="list-group-item">
								<a href="#" id="user_request_list">희망도서신청내역</a>
							</li>
							<li class="list-group-item active">
								<a href="#" id="user_favorite">내서재</a>
							</li>
							<li class="list-group-item">
								<a href=#" id="user_qr">나의QR</a>
							</li>
						</ul>

					</div>
				</div>
	`;
}
MyLibraryHtmlContents.mylibrary_main_content = function() {
	return `<div class="col-md-9">
					<div class="p-4">
						<div class="mypage">
							<ul class="nav nav-tabs mypage-tabs">

								<li class="nav-item"><a class="nav-link active" href="#">개인정보수정</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">비밀번호변경</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">탈퇴</a></li>

							</ul>
						</div>
					</div>
				</div>
	`;
}