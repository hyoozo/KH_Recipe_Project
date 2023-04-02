<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<link href="/resources/include/css/member.css" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
	$(function() {
		
		let name = "${login.m_name}";
		let pwd = "${login.m_pwd}";
		let m_phone = "${login.m_phone}";
		let m_email = "${login.m_email}";
		let m_zip = "${login.m_zip}";
		let m_address = "${login.m_address}";
		console.log("name : " + name);
		console.log("pwd : " + pwd);
		console.log("m_phone : " + m_phone);
		console.log("m_email : " + m_email);
		console.log("m_zip : " + m_zip);
		console.log("m_address : " + m_address);
		
		
		
		$("form[name='updateForm']").hide();
		
		$(document).on("click", "#updatePwdBtn", function() {
			
			let m_num = ${login.m_num};
			let passwd = $(".passwd");
			let msg = $(".msg");
			
			if($(".updatePwd-input").val() == "") {
				return alert("비밀번호를 입력해주세요.");
			} else {	
				$.ajax({
					url : "/member/updatePwdConfirm",
					type : "POST", 
					data : "m_num=" + m_num + "&m_pwd=" + passwd.val(),
					dataType : "text",
					error : function(){ 
							alert('시스템 오류 입니다. 관리자에게 문의 하세요');
					}, 
					success : function(resultData){ 
						console.log("resultData : "+resultData);
						if(resultData == 0){
							msg.addClass("msg_error");
							msg.text("비밀번호가 일치하지 않습니다.");
						}else if(resultData == 1){
							$("form[name='updateForm']").show();
							$("form[name='updatePwdChk']").hide();
							

							//주소 나누기
							/* var address = ${login.m_address}.val();
							var address01 = str.split(" ");
							console.log("1 : " + address01[0]);
							console.log("2 : " + address01[1]);
							
							$(".address1").attr('placeholder','address01[0]');
							$(".address2").attr('placeholder','address01[1]'); */
							
						}
					}
				});
			}
		});
		
		$(".updatePwdBtn-cancel").click(function() {
			$(".updatePwd-input").val("");
			location.href = "/member/updateForm";
		})
		
		$("#update").click(function() {
			console.log($("input[name='m_phone']").val().length);
			
			if($("input[name='m_name']").val().length == 0) {		
				
				$("input[name='m_name']").val(name);
				
			}
			if($("input[name='m_pwd']").val().length == 0) {
				
				$("input[name='m_pwd']").val(pwd);
				
			}
			if($("input[name='m_pwdConfirm']").val().length == 0) {
				
				$("input[name='m_pwdConfirm']").val(pwd);
				
			}
			if($("input[name='m_phone']").val().length == 0) {
				
				$("input[name='m_phone']").val(m_phone);
				
			}
			if($("input[name='m_email']").val().length == 0) {
				
				$("input[name='m_email']").val(m_email);
				
			}
			if($("input[name='m_zip']").val().length == 0) {
				
				$("input[name='m_zip']").val(m_zip);
			}
			
			
			if($("#update_pwd").val() != $("#update_pwdConfirm").val()) {
				$("#update_pwd").val("");
				$("#update_pwdConfirm").val("");
				return alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			}
			

			if($(".address1").val().length == 0 || $(".address2").val().length == 0) {
				$("input[name='m_address']").val(m_address);
				
			} else if((".address1").val().length == 0){
				return alert("주소를 입력해주세요.");
			} else if((".address2").val().length == 0) {
				return alert("상세주소를 입력해주세요.");
			}

			
			$("#updateForm").attr({
				"method":"post",
				"action":"/member/memberUpdate"
			}),
			$("#updateForm").submit();
		})
		
		$(".delBtn").click(function() {
			if(confirm("회원 정보가 삭제됩니다. 그래도 하시겠습니까 ?") == true){
				$("#updateForm").attr({
					"method":"get",
					"action":"/member/memberDelete"
				}),
				$("#updateForm").submit();
		    } else {
		    	return;
		    }
		})
		
		
	
		function chkPwd(item2, msg) {
			if(regPwd.test(item2.val())) {
				return true;
			} else {
				alert(msg + " 확인해주세요.");
				$(item2).val("");
				return false;
			}
		}
		
		function chkRemain(item3,msg) {
			if(item3.val() != "") {
				return true;
			} else {
				alert(msg + " 확인해주세요.");
				$(item3).val("");
				return false;
			}
		}
		
		
		var regId = /^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{6,10}$/;
		var regPwd = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~!@#$%^&*()_+|<>?:{}])[A-Za-z\d~!@#$%^&*()_+|<>?:{}]{8,13}$/;
	});
</script>
	
<script>
function sample6_execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}

				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('sample6_postcode').value = data.zonecode;
			document.getElementById("sample6_address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("sample6_detailAddress").focus();
		}
	}).open();
}
</script>


<body>
	<!-- 비밀번호 -->
	<form name="updatePwdChk">
		<div class="updatePwdChk-container">
			<div class="updatePwdChk-top">
				<div class="updatePwdChk-inner">
					<div class="updatePwdChk-id">
						<label>아이디 : </label>
					</div>
					<div>
						<input type="text" class="updatePwd-input bor-rad2"
							value="${login.m_id}" disabled />
					</div>
				</div>
				<div class="updatePwdChk-inner">
					<div class="updatePwdChk-pwd">
						<label for="passwd">비밀번호 : </label>
					</div>
					<div>
						<input type="password" class="updatePwd-input passwd bor-rad2"
							name="passwd" />
					</div>
				</div>
			</div>
			<button type="button" id="updatePwdBtn" class="upPwdBtn bor-rad4">확인</button>
			<button type="button" id="updatePwdBtn-cancel" class="upPwdBtn bor-rad4">취소</button>
			<span class="msg input-font14"></span>
		</div>
	</form>

	
	
	
	<!-- 수정  -->
	<form id="updateForm" name="updateForm">
	<div class="update-container">
		<div class="update-container-inner">
			<div class="update-container-top">
				<h2>개인 정보 수정</h2>
				<button type="button" class="delBtn btnWhite">회원 탈퇴 ></button>
				<a class="float-r">* 빈 칸 입력시 기존 정보로 저장됩니다.</a>
			</div>
			<div>
				<div class="update-div">
					<input type="text" class="update-num" name="m_num" value="${login.m_num}">
					<div class="update-label"><label>아이디</label></div>
					<input type="text" id="update_id" class="update-input input-font14 join-input bor-rad2" name="m_id"
					placeholder="${login.m_id}" disabled/>
				</div>
				<div class="update-div">
					<div class="update-label"><label>이름</label></div>
					<input type="text" id="update_name" class="update-input join-input bor-rad2" name="m_name" value="" placeholder="${login.m_name}" />
				</div>
				<div class="update-div">
					<div class="update-label"><label>새 비밀번호</label></div>
					<input type="password" id="update_pwd" class="update-input join-input bor-rad2" name="m_pwd" placeholder="8자이상 13자이하의 영문,숫자,,특수문자를 조합해서 입력해주세요." />
				</div>
				<div class="update-div">
					<div class="update-label"><label>새 비밀번호 확인</label></div>
					<input type="password" id="update_pwdConfirm" class="update-input join-input bor-rad2" name="m_pwdConfirm" placeholder="비밀번호확인 입력" />
				</div>
				<div class="update-div">
					<div class="update-label"><label>전화번호</label></div>
					<input type="text" id="update_phone" class="update-input join-input bor-rad2" name="m_phone" placeholder="${login.m_phone}" />
				</div>
				<div class="update-div">
					<div class="update-label"><label>이메일</label></div>
					<input type="text" id="update_email" class="update-input join-input bor-rad2" name="m_email" placeholder="${login.m_email}" />
				</div>
				<div class="update-div">
					<div class="update-label"><label>주소</label></div>		
					<input type="text" name="m_zip" class="zip update-input-zip bor-rad2" id="sample6_postcode" placeholder="${login.m_zip}">
					<input type="button" onclick="sample6_execDaumPostcode()" class="update-input-addBtn  bor-rad2"  value="우편번호 찾기">
				</div>
				<div class="update-div">
				<div class="update-label"></div>
					<input type="text" name="address"  class="address1 update-input-address bor-rad2"  id="sample6_address" placeholder="${login.m_address}">
				</div>
				<div class="update-div">
				<div class="update-label"></div>
					<input type="text" name="address"  class="address2 update-input-deAddress bor-rad2"  id="sample6_detailAddress" placeholder="상세주소">
					<input type="text" name="m_address" class="address3" />
				</div>
				
				<div>
					<button type="button" id="update" class="updateBtn btnGreen bor-rad3">수정하기</button>
					<input type="button" id="update_cancel" class="update_cancelBtn btnGreen bor-rad3" value="취소" />
				</div>
			</div>
		</div>
	</div>
</form>
</body>


</html>