/**
 * 
 */
 
 function chkData(item, msg){
	if($(item).val().replace(/\s/g, "") == ""){
		alert(msg+" 입력해 주세요.");
		$(item).val("");
		$(item).focus();
		return false;
	} else{
		return true;
	}
}

function delData(data) {
	if(confirm("삭제 하시겠습니까?")){
		location.href="/servletExample/delete?mng_no="+data;
	}
}