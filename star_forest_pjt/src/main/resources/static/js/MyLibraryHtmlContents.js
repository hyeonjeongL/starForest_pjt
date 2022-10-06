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
	return `<div class="p-4">
						<div class="mypage">
							<ul class="nav nav-tabs mypage-tabs">

								<li class="nav-item"><a class="nav-link active" href="#" id="user_view">내정보</a>
								</li>
								<li class="nav-item"><a class="nav-link active" href="#" id="user_update">개인정보수정</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#" id="user_updatePW">비밀번호변경</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#" id"user_remove">탈퇴</a></li>

							</ul>
						</div>
					</div>
	`;
}
MyLibraryHtmlContents.favorite_item_content=function(favorite){
	return `<tr id="favorite_item">
								<td id="favoriteNo">${favorite_no}
								<td class="bookTitle">${favorite.book.book_title}</td>
								<td class="bookAuthor">${favorite.book.book_author}</td>
								<td class="bookPubl">${favorite.book.book_publisher}</td>
								<td>
									<button id="btn_delete" class="w-btn w-btn-delete" type="button">삭제</button>
								</td>
							</tr>`;
}
MyLibraryHtmlContents.favorite_list_content = function(favoriteArray) {
	return `<div class="col-md-9 fol_div">
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-6" id="fol_list_title">
								<form action="MyPage_Folder.do" method="post"></form>
							</div>

							<div class="col-sm-6">
								
							</div>
						</div>
					</div>
					<hr>

					<div class="container">
						<table id="favoriteList" class="table table-hover">
							<tr>
								<th scope="row">No.</th>
								<th scope="row">제목</th>
								<th scope="row">저자</th>
								<th scope="row">출판사</th>
								<th scope="row">작업</th>
							</tr>
							<!--favorite start -->
							 ${
								favoriteArray.map(favorite_item_content).join('')
								}
							<!--favorite end -->

						</table>
					</div>
					<div class="favorite_delete" style="float: right;">
						<button id="btn_all_delete" class="w-btn w-btn-delete" type="button">전체삭제</button>
					</div>

				</div>`;
	
}
function getUserName() {
    let userList = document.getElementById('userList');

    for (let i = 1; i < userList.rows.length; i++) {
       userList.rows[i].cells[2].onclick = function () {
          let userName = userList.rows[i].cells[1].innerText;
          alert(userName+"을 선택하셨습니다.");
       }
    }
}