function UserHtmlContents() {
}
UserHtmlContents.user_login_content = function(sUser) {
	return `
			<li>
				<a href=""></a>
				<p class="user_name">${sUserId}님</p>
			</li>
	<li class="nav-item" v-bind:title="logout">
				<a href="" class="nav-link" id="a_user_logout_action">
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
	<!-- MAIN SECTION -->
		<section id="insertCustomer">
			<!-- 폼 시작 -->
			<form action="insertCustomer" method="post" enctype="multipart/form-data">
				<!-- 이메일 INPUT START -->
				<label class="mt-4" for="m_phone">아이디</label> 
				<span class="signup_required">*</span>
				<div class="input-group mb-3">
					<input value="${}" class="form-control" type="text"  id="user_id" name="user_id" placeholder="아이디 입력" required>
					&nbsp;&nbsp;<font color="red">${}</font>
				</div>
				<!-- 이메일 INPUT END -->
				<!-- 비번 INPUT START -->
				<div class="form-group mt-2">
					<label for="pw">비밀번호</label> 
					<span class="signup_required">*</span>
					<input value="${}"  class="form-control" type="password"  id="user_password" name="user_password" placeholder="비밀번호 4자리 입력" >
				</div>
				<!-- 비번 INPUT END -->
				<!-- 비번확인 INPUT START -->
				<div class="form-group mt-3">
					<label for="pw_check">비밀번호 확인</label> 
					<span class="signup_required">*</span>
					<input  value="${}" class="form-control" type="password"   id="user_password2" name="user_password2" placeholder="비밀번호 다시 입력" required>
				</div>
				<!-- 비번확인 INPUT END -->
				<!-- 이름 INPUT START -->
				<div class="form-group mt-2">
					<label for="name">이름</label> 
					<span class="signup_required">*</span>
					<input  value="${}" class="form-control" type="text"  id="user_name" name="user_name" placeholder="이름 입력" required>
					<small class="form-text text-muted">반드시 <span class="signup_required">한글 실명</span>으로 기입해주세요.<br> 실명이 아닐 경우, 서비스 이용에 제약이 생길 수 있습니다.<br> - 띄어쓰기, 특수 문자 사용 불가
					</small>
				</div>
				<!-- 이름 INPUT END -->
				<!-- 이름 INPUT START -->
				<div class="form-group mt-2">
					<label for="birth">생년월일</label> 
					<span class="signup_required">*</span>
					<input  value="${}" class="form-control" type="text"  id="user_birth" name="user_birth" placeholder="ex) 1999-01-01" required>
				</div>
				<!-- 이름 INPUT END -->
				<div class="form-group mt-2">
					<label for="gender">성별</label>
					<span class="signup_required">*</span>
					<input  value="${}" class="form-control" type="text"  id="user_gender" name="user_gender" placeholder="ex) M (남성) / F (여성)" required>
				</div>
				<!-- 이메일 INPUT START -->
				<label class="mt-4" for="m_phone">이메일</label> 
				<span class="signup_required">*</span>
				<div class="input-group mb-3">
					<input  value="${}" class="form-control" type="text"  id="user_email" name="user_email" placeholder="ex) hello@delibrary.com" required>
				</div>
				<!-- 이메일 INPUT END -->
				<!-- 이메일 INPUT START -->
				<label class="mt-4" for="m_phone">전화번호</label> 
				<span class="signup_required">*</span>
				<div class="input-group mb-3">
					<input  value="${}" class="form-control" type="tel"  id="user_phone" name="user_phone" placeholder="ex) 010-1234-5678" required>
				</div>
				<!-- 이메일 INPUT END -->
				<!-- 주소 INPUT START -->
				<label for="m_phone mt-4">주소</label> 
				<span class="signup_required">*</span>
				<!-- 상세주소 INPUT START -->
				<div class="form-group mt-1">
					<input  value="${}" class="form-control"type="text"  id="user_address" name="user_address" placeholder="주소 입력 ex) 서울시 강남구 역삼동" required>
				</div>
				<!-- 주소 INPUT END -->
					<!-- 관심장르 CHECKBOX START -->
				<label for="m_phone mt-4">도서 관심 분야</label> 
				<span class="signup_required">*</span>
				<div class="form-group mt-1">
				<small class="form-text text-muted mb-2">
				<span class="signup_required">100</span><span> - 건강/취미/레저</span>&nbsp;&nbsp;&nbsp;//&nbsp;&nbsp;&nbsp;<span class="signup_required">200</span><span> - 경제경영</span>&nbsp;&nbsp;&nbsp;//&nbsp;&nbsp;&nbsp;<span class="signup_required">300</span><span> - 고전</span></small> 
				<small class="form-text text-muted mb-2">
				<span class="signup_required">400</span><span> - 과학</span>&nbsp;&nbsp;&nbsp;//&nbsp;&nbsp;&nbsp;<span class="signup_required">500</span> <span> - 만화</span>&nbsp;&nbsp;&nbsp;//&nbsp;&nbsp;&nbsp;
				<span class="signup_required">600</span><span> - 사회과학</span>&nbsp;&nbsp;&nbsp;//&nbsp;&nbsp;&nbsp;<span class="signup_required">700</span><span> - 소설/시/희곡</span></small> 
					<input  value="${}" class="form-control"type="text"  id="category_no" name="category_no" placeholder="관심 분야 입력 ex) 100" required>
							<!-- 관심장르 CHECKBOX 1st ROW -->
					</div>
	<!-- 관심장르 CHECKBOX 3rd ROW END -->
	<!-- 관심장르 CHECKBOX END -->
	<!-- 가입버튼 -->
		<div class="form-group mt-2">
			<button class="btn btn-dark btn-block mb-1 btn-Customer" type="submit" onclick="userCreate();" id="btn_user_write_action" name="btn_user_write_action">가입하기</button>
			<small class="form-text text-muted text-center mb-4">회원가입 진행 시 별숲도서관의 <span class="signup_required">개인정보처리방침</span>에 동의하신 것으로 간주됩니다.
			</small>
		</div>
		
		</form>
	</section>
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