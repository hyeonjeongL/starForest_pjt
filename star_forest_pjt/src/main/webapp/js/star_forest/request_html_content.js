
function request_item_content(requestBoard){
	return `<tr id="table2">
		<td width=5% align=center class=t1><font size=2 color=#000000>${requestBoard.board_no}</td>
		<td width=15% align=center class=t1><font size=2 color=#000000>${requestBoard.board_title}</td>
		<td width=15% align=center class=t1><font size=2 color=#000000>${requestBoard.user_id}</font></td>
		<td width=15% align=center class=t1><font size=2 color=#000000>${requestBoard.board_date.substring(0,10)}</font></td>
		</tr>`;
}

function request_list_content(requestArray) {
	return `<table>
	
		<thead>
		<tr id="table1" align=center style="background-color:pink;">
		<td width=5% align=center class=t1><font size=2 color=#000000>번호</td>
		<td width=15% align=center class=t1><font size=2 color=#000000>제목</td>
		<td width=15% align=center class=t1><font size=2 color=#000000>작성자</td>
		<td width=15% align=center class=t1><font size=2 color=#000000>날짜</td>
		</tr>
		</thead>
		
		<tbody>
			<!--requestBoard start-->
				${
					requestArray.map(request_item_content).join('')
				}
			<!--requestBoard end-->
		</tbody>

		
		</table>`;
}
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