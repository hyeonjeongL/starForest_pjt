//로그인체크
function check_session(){
	var result=false;
	$.ajax({
		url:"user_session_check",
		method:"post",
		success:function(jsonResult){
			console.log(jsonResult);
			if(jsonResult!=null){
				result=true;
			}
		}
	});
	return result;
}

