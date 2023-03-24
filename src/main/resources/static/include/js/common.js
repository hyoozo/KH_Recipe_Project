function chkData(item, msg) {
	if($(item).val().replace(/\s/g,"")=="") {
		alert(msg + " 입력해주세요 ");
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}

function checkForm(item, msg){
	let message = "";
	if($(item).val().replace(/\s/g,"") == ""){
		message = msg + "입력해 주세요";
		$(item).attr("placeholder", message);
		return false;
	} else {
		return true;
	}
}

function formCheck(main, item, msg){
	if($(main).val().replace(/\s/g,"") == ""){
		$(item).css("color", "#000099").html(msg + " 입력해 주세요");
		$(main).val("");
		
		return false;
	}else{
		return true;
	}
}

function chkSubmit(item, msg) {
	if(item.val().replace(/\s/g,"")=="") {
		alert(msg+" 입력해 주세요.");
		item.val("");
		item.focus();
		return false;
	} else {
		return true;
	}
}


function chkFile(item){
	let ext = item.val().split('.').pop().toLowerCase();
	if(jQuery.inArray(ext, ['gif','png','jpg']) == -1){
		alert('gif, png, jpg 파일만 업로드 할 수 있습니다.');
		item.val("");
		return false;
	} else {
		return true;
	}
}

function getDateFormat(dateValue){
	let year = dateValue.getFullYear();
	
	let month = dateValue.getMonth()+1;
	month = (month<10) ? "0"+month : month;
	
	let day = dateValue.getDate();
	day = (day<10) ? "0"+day : day;
	
	let result = year+"-"+month+"-"+day;
	return result;
}