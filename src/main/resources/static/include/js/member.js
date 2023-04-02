var regId = /^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{6,10}$/;
var regPwd = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~!@#$%^&*()_+|<>?:{}])[A-Za-z\d~!@#$%^&*()_+|<>?:{}]{8,13}$/;


$(function() {
	
	//로그인
	$("#login").click(function() {

		if($("#m_id").val() == "" || $("#m_pwd").val() == "") return alert("아아디와 비밀번호를 입력해주세요");
		else {
			$("#loginForm").attr({
				"method":"post",
				"action":"/member/loginProcess"
			});
			$("#loginForm").submit();
		};
	});
	
	//회원가입
	$("#login_join").click(function() {
		location.href = "/member/joinForm";
	})
	
	//아이디 중복체크
	
	
	
	//가입 후
	$("#join").click(function() {
		if (!chkId($("#join_id"),"아이디를"))  return;
		else if (!chkPwd($("#join_pwd"),"비밀번호를")) return;
		else if (!chkRemain($("#join_name"),"이름을")) return;
		else if (!chkRemain($("#join_phone"),"전화번호를")) return;
		else if (!chkRemain($("#join_email"),"이메일을")) return;
		else if (!chkRemain($(".zip"),"우편번호를")) return;
		else if($("#join_pwd").val() != $("#join_pwdConfirm").val()) {
				$("#join_pwd").val("");
				$("join_pwdConfirm").val("");
				return alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			}

			add1 = $(".address1").val();
		
			add2 = $(".address2").val();
			
			if(add1 == "") {
				return alert("주소를 확인해주세요.");
			} else if(add2 == "") {
				return alert("상세 주소를 확인해주세요.")
			}

			$(".address3").val(add1 + " " + add2);
				
			$("#joinForm").attr({
				method:"post",
				action:"/member/joinProcess"
			});
			$("#joinForm").submit();
	});
	
		
	//가입취소
	$("#join_cancel").click(function() {
		$("#joinForm").each(function() {
			this.reset();
		});
	});
	
	
	//수정페이지
	$(".myPage-update").click(function() {
		location.href = "/member/updateForm";
	})


	//수정 버튼
	$("#update").click(function() {
		if (!chkId($("#update_id"), "아이디를")) return;
		else if (!chkPwd($("#join_pwd"), "비밀번호를")) return;
		else if (!chkRemain($("#join_name"), "이름을")) return;
		else if (!chkRemain($("#join_phone"), "전화번호를")) return;
		else if (!chkRemain($("#join_email"), "이메일을")) return;
		else if (!chkRemain($(".zip"), "우편번호를")) return;
		if ($("#update_pwd").val() != $("#update_pwdConfirm").val()) {
			$("#update_pwd").val("");
			$("#update_pwdConfirm").val("");
			return alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		}

		var add1 = $(".address1").val();

		var add2 = $(".address2").val();

		$(".address3").val(add1 + " " + add2);

		$("#updateForm").attr({
			"method": "post",
			"action": "/member/memberUpdate"
		}),
			$("#updateForm").submit();
	})


	/*
	$(document).on("click","#join",function() {
		let insertUrl = "/member/joinProcess";
		
		let value = JSON.stringify({
			m_name : $("#join_name").val(),
			m_id : $("#join_id").val(),
			m_pwd : $("#join_pwd").val(),
			m_phone : $("#join_phone").val(),
			m_email : $("#join_email").val(),
			m_address : $("#join_address").val(),
		});
		
		$.ajax({
			url : insertUrl,
			type : "post",
			headers : {
				"Content-Type":"application/json"
			},
			dataType : "text",
			data : value,
			error : function(xhr,textStatus,errorThorwn) {
				alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThorwn + ")");
				
			},
			beforeSend : function() {
				if(!chkId($("#join_id"),"아이디를")) return false;
				else if(!chkPwd($("#join_pwd"),"비밀번호를")) return false;
				
			},
			success : function(result) {
				console.log("result : " + result);
				
				if (result == "SUCCESS") {
					alert("입력이 완료되었습니다");
					dataReset();
				}
			}
			
		})
	});
	*/

	
	function chkId(item1, msg){
		if(regId.test(item1.val())){
			return true;
		} else{
			alert(msg + " 확인해주세요.");
			$(item1).val("");
			$(item1).focus()
			return false;
		}
	}
	
	function chkPwd(item2, msg) {
		if(regPwd.test(item2.val())) {
			return true;
		} else {
			alert(msg + " 확인해주세요.");
			$(item2).val("");
			$(item2).focus()
			return false;
		}
	}
	
	function chkRemain(item3,msg) {
		if(item3.val() != "") {
			return true;
		} else {
			alert(msg + " 확인해주세요.");
			$(item3).val("");
			$(item3).focus()
			return false;
		}
	}
	
	
});


