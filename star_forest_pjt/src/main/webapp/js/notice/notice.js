/*
게시물 리스트 변경
*/
function changeQnaList(pageno){
	console.log(pageno);
	$.ajax({
		url: "notice_list_rest",
		method: "post",
		data: {"pageno" :pageno},
		dataType: "json",
		success:function(resultObj){
			console.log(resultObj);
			if(resultObj.errorCode > 0){
				let data = resultObj.data;
				let htmlBuffer = ``;
				data.itemList.forEach(function(notice, i){
					
	                if(notice.setting == 1){
						htmlBuffer += `<tr><td>&nbsp;&nbsp;<img src="img/notice.png" width="20" height="20"></td>`
					}
	                if(notice.setting == 0){
						htmlBuffer += `<tr><td>&nbsp;&nbsp;<span class="badge badge-normal"></td>`
					}
	                               
					htmlBuffer += `
	                               
	                                <td><a href="notice_view?notice_no=${notice.notice_no}&pageno=${data.pageMaker.curPage}">${notice.notice_title}</a>`;
	                
                    htmlBuffer += `</td>
	                                    <td>${notice.notice_date}</td>
	                                    <td>${notice.notice_readcount}</td>
	                                </tr>`;
				});
				$("#notice_list_tbody").html(htmlBuffer);
				let paginationBuffer = ``;
				if(data.pageMaker.prevPage > 0){
					paginationBuffer += `<li class="page-item">
		                                    <button class="page-link" onclick="changeQnaList(${data.pageMaker.prevPage});"><i class="fa fa-angle-left" aria-hidden="true"></i></button>
		                               	 </li>`;
				}
				for(let no = data.pageMaker.blockBegin; no <= data.pageMaker.blockEnd; no++){
					if(data.pageMaker.curPage == no){
						paginationBuffer += `<li class="page-item active"><button class="page-link" href="#">${no}</button></li>`;
					}
					if(data.pageMaker.curPage != no){
						paginationBuffer += `<li class="page-item"><button class="page-link" onclick="changeQnaList(${no});">${no}</button></li>`;
					}
				}
				if(data.pageMaker.curPage < data.pageMaker.totPage){
					paginationBuffer += `<li class="page-item">
					                        <button class="page-link" onclick="changeQnaList(${data.pageMaker.nextPage});"><i class="fa fa-angle-right" aria-hidden="true"></i></button>
				                    	 </li>`;
				}
				$(".pagination.pagination-sm.justify-content-center").html(paginationBuffer);
			}else{
				Toast.fire({ icon: 'error', title: resultObj.errorMsg });
			}
		console.log("asdf");
		}
	});
}

/*
게시글 목록 이동
*/

$(".notice_btn.list").on("click", function(){
	let pageno = $(this).attr("pageno");
	location.href = `notice_list?pageno=${pageno}`;
});

/*
게시글 삭제 
*/
$(".notice_btn.delete").on("click", function(){
	let pageno = $(this).attr("pageno");
	let notice_no = $(this).attr("notice_no");
	ToastConfirm.fire({ icon: 'question', 
						title: "게시글을 삭제하시겠습니까?\n 삭제 후 복구가 불가능합니다"}).then((result) => {
						if(result.isConfirmed){
							$.ajax({
								url: "notice_delete_rest",
								method: "post",
								data: {"notice_no":notice_no},
								dataType: "json",
								success:function(resultObj){
									if(resultObj.errorCode > 0){
										Toast.fire({ icon: 'success', title: resultObj.errorMsg }).then((result) => {
												location.href = "notice_list?pageno=" + pageno;
											});
									}else{
										Toast.fire({ icon: 'error', title: resultObj.errorMsg });
									}
								}
							});
						}
	});
});

/*
게시글 수정 폼 
*/
$(".notice_btn.update_form").on("click", function(){
	let notice_no = $(this).attr("notice_no");
	let pageno = $(this).attr("pageno");
	location.href = `notice_update_form?notice_no=${notice_no}&pageno=${pageno}`;
});

/* 
게시글 수정 
*/ 
$(".notice_btn.update").on("click", function(){ 
	if($("#notice_title_txt").val() == "" || CKEDITOR.instances.notice_content_area.getData() == ""){
		Toast.fire({ icon: 'warning', title: "필수 입력값을 입력하지 않았습니다.\n 제목과 내용을 모두 입력해주세요" });
		return;
	}
		ToastConfirm.fire({ icon: 'question', 
							title: "게시글을 수정하시겠습니까?"}).then((result) => {
							if(result.isConfirmed){
								let notice_no = $(this).attr("notice_no"); 
								$("#qna_update_form").attr("action", "notice_update"); 
								$("#qna_update_form").submit(); // q_no, q_titla, q_content 
							}
					});
});

/*
새글 등록 폼 
*/
$(".notice_btn.write_form").on("click", function(){
	let pageno = $(this).attr("pageno");
	location.href = "notice_write_form?pageno=" + pageno;
});


/*
게시글 등록
*/
$(".notice_btn.new_write").on("click", function(){
	if($("#q_title_txt").val() == "" || CKEDITOR.instances.notice_content_area.getData() == ""){
		Toast.fire({ icon: 'warning', title: "필수 입력값을 입력하지 않았습니다.\n 제목과 내용을 모두 입력해주세요" });
		return;
	}
	$("#notice_write_form").attr("action", "notice_new_write");
	$("#notice_write_form").submit();
});

/*
게시글 등록시 체크에 따라 고정글 설정
*/
/*
if(document.getElementById("notice_fix").checked) {
    document.getElementById("notice_fix_hidden").disabled = true;
}
*/

/*
일반 회원일때 등록, 수정, 삭제 버튼 숨기기
*/
$()

/*
ckeditor
*/

$(() => {
	if($("#notice_content_area").length != 0){
		 CKEDITOR.replace('notice_content_area', {
						height: 500                                                  
                 	});
	}
});






