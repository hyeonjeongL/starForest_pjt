function UserHtmlContents() {
}
UserHtmlContents.user_login_content = function(user) {
	return `
			<li>
				<a href=""></a>
				<p class="user_name">${user.user_name}님</p>
			</li>
	<li class="nav-item" v-bind:title="logout">
				<a href="logout" class="nav-link" id="a_user_logout_action">
					<i class="fas fa-sign-out-alt"></i></a>
					<p class="sr-only">로그아웃</p>
			</li>
			
	`;
}
UserHtmlContents.user_logout_content = function() {
	return `<li class="nav-item" v-bind:title="login">
				<a href="LoginPage" class="nav-link" id="a_user_login_form">
					<i class="fas fa-sign-in-alt"></i></a>
					<p class="sr-only">로그인</p>
			</li>
			<li class="nav-item" v-bind:title="signup">
				<a href="insertCustomer" class="nav-link" id="a_user_write_form">
					<i class="fas fa-user-plus"></i></a>
					<p class="sr-only">회원가입</p>
			</li>
	`;
}
UserHtmlContents.user_login_form_content = function() {
	return `<h1 class="heroTitle">
				별숲<span class="heroTitle_dot"> : </span> <span class="heroTitle_kor">로그인</span>
			</h1>
			<hr class="heroLine">
			<!-- 로그인 폼 시작 -->
			<form method="post" id="user_login_form">
				<div class="form-group mt-4">
					<input class="form-control form-control-lg loginForm" type="id" id="id" name="id" placeholder="아이디"> 
					<input class="form-control form-control-lg mt-2 loginForm" type="password" id="pw" name="pw" placeholder="비밀번호"> 
					<button class="btn btn-outline-success btn-lg btn-block mt-2 btn-Customer"
						type="submit" id="btn_login_action">로그인</button>
				</div>
			</form>
			<!-- 회원가입 / 아이디찾기 / 비밀번호찾기 -->
			<div id="loginInfo">
				<p class="text-right m-0 noto-serif">아직 별숲 회원이 아니신가요?</p>
				<p class="text-right m-0">
					<a href="insertCustomer" id="user_write_form">회원가입하기 </a>
				</p>
				<hr class="heroLineSecond">
				<p class="text-muted text-center mb-5">
					<a href="#" id="findId" data-toggle="modal" data-target="#emailModal">아이디 찾기</a> 
					&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<a href="#" id="findPassword" data-toggle="modal" data-target="#pwModal">비밀번호찾기</a>
				</p>
				</form>
			</div>
			<!-- 아이디찾기 MODAL -->
			<div class="modal" id="emailModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">내 아이디 찾기</h5>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<!-- 폼시작 -->
							<!-- <form action="findEmail.do" method="post"> -->
							<div class="form-group">
								<label for="username">이름</label> <input type="text"
									id="findEmail_name" name="name" placeholder="이름을 입력하세요"
									class="form-control" required>
							</div>
							<div class="form-group">
								<label for="password">가입 휴대전화번호</label> <input type="tel"
									id="findEmail_cell" name="m_phone"
									placeholder="예시) 010-1234-5678" class="form-control" required>
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-outline-info btn-Customer"
								id="btn_findId" type="button">내 아이디 찾기</button>
							<!-- </form> -->
							<!--폼 종료 -->
						</div>
					</div>
				</div>
			</div>
			<!-- 비밀번호 찾기 MODAL -->
			<div class="modal" id="pwModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">내 비밀번호 찾기</h5>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label for="userId">아이디 </label> 
									<input type="text" id="findPw_name" placeholder="아이디를 입력하세요" class="form-control">
							</div>
							<div class="form-group">
								<label for="password">가입 이메일</label> 
									<input type="email" id="findPw_email" placeholder="예시)hello@library.com"
									class="form-control">
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" id="btn_findPassword"
								class="btn btn-outline-info btn-Customer" data-dismiss="modal">비밀번호
								찾기</button>
						</div>
					</div>
				</div>
			</div>
	`;
}
UserHtmlContents.user_write_form_content = function() {
	return `
	`;
}
UserHtmlContents.user_main_content=function(){
	return `  
	<section id="home-heading" class="p-4 noto-serif">
      <div class="dark-overlay">
         <div class="row">
            <div class="col">
               <div class="container">
                  <div>
                     <h1 id="home-display"></h1>
                  </div>
               </div>
               <div class="container">
                  <div class="input-group mb-3" id="home-searchbar">
                     <input class="form-control searchbar" id="bookName" type="text"
                        placeholder="검색어를 입력하세요.">
                     <div class="input-group-append">
                        <button class="btn btn-outline-light btn-lg px-5" type="button"
                           id="search">
                           &nbsp;&nbsp;&nbsp;<b>도서검색</b> &nbsp;&nbsp;&nbsp;
                        </button>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <p id="heroDesc">Admont Abbey Library, Admont, Austria</p>
         <p id="heroDescKor">아드몬트 수도원 도서관, 아드몬트, 오스트리아</p>
      </div>

   </section>

   
	`;
}