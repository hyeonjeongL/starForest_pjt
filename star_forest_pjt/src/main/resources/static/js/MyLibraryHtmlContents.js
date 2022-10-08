function MyLibraryHtmlContents() {
}
MyLibraryHtmlContents.mylibrary_left_menu_content = function() {
	return `<div class="col-md-3 noto-serif">
					<div class="sidebar">
						<div class="side-head">
							<h4 class="text-light">나의도서</h4>
						</div>
						<ul class="list-group list-group-flush mb-5">
							<li class="list-group-item"><a href="mypage" id="mypage">마이페이지</a>
							</li>
							<li class="list-group-item"><a href="userbook_status"
								id="userbook_status">나의도서정보</a></li>
							<li class="list-group-item"><a href="user_club_list"
								id="user_club_list">동아리신청내역</a></li>
							<li class="list-group-item"><a href="user_request_list"
								id="user_request_list">희망도서신청내역</a></li>
							<li class="list-group-item active"><a href="favorite"
								id="favorite">내서재</a></li>
							<li class="list-group-item"><a href="user_qr" id="user_qr">나의QR</a></li>

						</ul>

					</div>
				</div>
	`;
}
MyLibraryHtmlContents.mylibrary_main_content = function() {
	return `<div class="p-4">
						<div class="mypage">
							<ul class="nav nav-tabs mypage-tabs">

								<li class="nav-item"><a class="nav-link active" href="#" id="myInfo">내정보</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#" id="updateUser">개인정보수정</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#" id="updatePW">비밀번호변경</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#" id="Remove">탈퇴</a></li>

							</ul>
						</div>
					</div>
	`;
}

MyLibraryHtmlContents.use_rental_status_content = function(book){
	return `<div class="col-md-9">
						<div class="p-4">
							<!-- CARD WITH NAV -->
							<section id="contact" class="py-3">
								<div class="cards">
									<c:if test="">
						<h2> 대여목록이 없습니다.</h2><br>
						<h4><a href="popularBook.do"> 인기도서 페이지 목록으로 이동</a></h4><br>
					</c:if>
					<c:if test="$}">
					<c:forEach var="b" items=""> 
				  	<div class="card">
					    <div class="card_image-holder">
					      <img class="card_image" src="${b.b_image }" alt="wave" />
				      	<div class="card-text "id="book-title">${b.b_title }</div>
					    </div>
					    <div>
				      	<div class="card-text">${b.b_writer }
					      <p class="m-0">대여일 : ${b.bor_date }</p>
						  <p>반납일 : ${b.return_date }</p>
					    </div>
					    </div>
					    
					  </div>
					</c:forEach>
					</c:if>
									
									
								</div>
							</section>
						</div>
					</div>`;
}