
function request_item_content(requestBoard){
	return `<tr id="table2">
		<td width=5% align=center class=t1><font size=2 color=#000000>${requestBoard.board_no}</td>
		<td width="300" bgcolor="ffffff" style="padding-left: 10">
				<a href="#" class="request_item_a" board_no="${requestBoard.board_no}">
				${requestBoard.board_title}
				</a>
		<td width=15% align=center class=t1><font size=2 color=#000000>${requestBoard.user_id}</font></td>
		<td width=10% align=center class=t1><font size=2 color=#000000>${requestBoard.board_status}</font></td>
		<td width=10% align=center class=t1><font size=2 color=#000000>${requestBoard.board_date.substring(0,10)}</font></td>
		<td width=5% align=center class=t1><font size=2 color=#000000>${requestBoard.board_readcount}</font></td>
		</tr>`;
}

function request_list_content(requestArray) {
	return `<table>
	
		<thead>
		<tr id="table1" align=center style="background-color:pink;">
		<td width=5% align=center class=t1><font size=2 color=#000000>번호</td>
		<td width=30% align=center class=t1><font size=2 color=#000000>제목</td>
		<td width=15% align=center class=t1><font size=2 color=#000000>작성자</td>
		<td width=10% align=center class=t1><font size=2 color=#000000>진행상태</td>
		<td width=10% align=center class=t1><font size=2 color=#000000>날짜</td>
		<td width=5% align=center class=t1><font size=2 color=#000000>조회수</td>
		</tr>
		</thead>
		
		<tbody>
			<!--requestBoard start-->
				${
					requestArray.map(request_item_content).join('')
				}
			<!--requestBoard end-->
		</tbody>
		
		</table>
		<div>
		<input type="button" id="btn_write" value="희망도서 신청하기" onClick="location.href='requestBoard_write_form'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		`;
}
/*
function request_write_form_content() {
	return `<table width="0" border="0" cellpadding="0" cellspacing="0">
			<tbody>
				<tr>
					<td>
						<!--contents--> <br>
						<table style="padding-left: 10px" border="0" cellpadding="0"
							cellspacing="0">
							<tbody>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>방명록 관리 -
											방명록 쓰기</b></td>
								</tr>
							</tbody>
						</table> <!-- guest write Form  -->
						<form id="guest_write_form" name="f" method="post">
							<table border="0" cellpadding="0" cellspacing="1" width="590"
								bgcolor="BBBBBB">
								<tbody>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">이름</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 150" name="guest_name"></td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">이메일</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 150" name="guest_email"></td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">홈페이지</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 150" name="guest_homepage"></td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">타이틀</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 240" name="guest_title"></td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">내용</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px"><textarea wrap="soft"
												style="width: 240px" rows="10" name="guest_content"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</form> <br>
						<table width="590" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td align="center"><input type="button" value="방명록쓰기" id="btn_guest_write_action"> &nbsp; 
									<input type="button" id="btn_guest_list" value="방명록목록"></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>`;
}
*/
function request_view(requestBoard){
	return `
	<form name="f" method="post">
								<input type="hidden" name="board_no" value="3">
								<table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
									<tbody><tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">번호</td>
										<td width="490" bgcolor="ffffff" align="left" style="padding-left: 10px">${requestBoard.board_no}</td>
									</tr>
									<tr>
										<td width="200" align="center" bgcolor="E6ECDE" height="22">작성자</td>
										<td width="490" bgcolor="ffffff" align="left" style="padding-left: 10px">${requestBoard.user_id}</td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">날짜</td>
										<td width="490" bgcolor="ffffff" align="left" style="padding-left: 10px">${requestBoard.board_date.substring(0,10)}</td>
									</tr><tr>
										<td width="150" align="center" bgcolor="E6ECDE" height="22">조회수</td>
										<td width="490" bgcolor="ffffff" align="left" style="padding-left: 10px">${requestBoard.board_readcount}</td>
									</tr>
									<tr>
										<td width="150" align="center" bgcolor="E6ECDE" height="22">진행상태</td>
										<td width="490" bgcolor="ffffff" align="left" style="padding-left: 10px">${requestBoard.board_status}</td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="110">제목</td>
										<td width="490" bgcolor="ffffff" align="left" style="padding-left: 10px">${requestBoard.board_title}</td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="110">내용</td>
										<td width="490" bgcolor="ffffff" align="left" style="padding-left: 10px" id="td_content"><pre style="font-size:12pt;">${requestBoard.board_content}</pre></td>
									</tr>
								</tbody></table>
							</form>
							<div class="btn_mrl">
										<input type="button" value="${(requestBoard.user_id=='admin'?'답글쓰기':'수정')}" id="btn_request_modify_form" board_no="${requestBoard.board_no}"> &nbsp; 
										<input type="button" value="삭제" id="btn_request_remove_action" board_no="${requestBoard.guest_no}"> &nbsp; 
										<input type="button" value="목록" id="btn_request_list">
							</div>
	
	`
}

function request_modify_form(requestBoard){
	return `
	<table width="800">
			<tbody>
					<tr>
					<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>방명록 관리 -
											방명록 쓰기</b></td>
				    </tr>
			</tbody>
			</table> 
			<!-- request write Form  -->
						<form id="request_write_form" name="f" method="post">
							<table border="0" cellpadding="0" cellspacing="1" width="590"
								bgcolor="BBBBBB">
								<tbody>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">작성자</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px">${requestBoard.user_id}</td>
									</tr>
								
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">진행상태</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px">
											<select name="board_status">
												<option value="신청접수" selected>${requestBoard.board_status}</option>
											</select>
										</td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">제목</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 350px" name="board_title" value="${requestBoard.board_title}"></td>
									</tr>
									
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">신청도서 카테고리</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px">
											<select name="category_name">
											<option value="건강/취미/레저" ${(requestBoard.category_name=='건강/취미/레저')?'selected':''}>건강/취미/레저</option>
											<option value="경제경영" ${(requestBoard.category_name=='경제경영')?'selected':''}>경제경영</option>
											<option value="고전" ${(requestBoard.category_name=='고전')?'selected':''}>고전</option>
											<option value="과학" ${(requestBoard.category_name=='과학')?'selected':''}>과학</option>
											<option value="만화" ${(requestBoard.category_name=='만화')?'selected':''}>만화</option>
											<option value="사회과학" ${(requestBoard.category_name=='사회과학')?'selected':''}>사회과학</option>
											<option value="소설/시/희곡" ${(requestBoard.category_name=='소설/시/희곡')?'selected':''}>소설/시/희곡</option>
											<option value="기타" ${(requestBoard.category_name=='기타')?'selected':''}>기타</option>	
											</select>
											</td>
									</tr>
									<tr>
										<td width="100" align="center" bgcolor="E6ECDE" height="22">내용</td>
										<td width="490" align="left" bgcolor="ffffff"
											style="padding-left: 10px">
				
											<textarea wrap="soft"
												style="width: 500px" rows="10" name="board_content">
${requestBoard.board_content}
												</textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</form> <br>
						<input type="button" value="확인" id="btn_request_write_action"> &nbsp; 
						<input type="button" id="btn_request_list" value="목록">
	
	`
}