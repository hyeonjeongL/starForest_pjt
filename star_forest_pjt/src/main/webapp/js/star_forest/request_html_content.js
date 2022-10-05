
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
