<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="/resources/include/js/jquery-3.6.3.min.js"></script>
<script src="/resources/include/js/member.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<link href="/resources/include/css/member.css" rel="stylesheet">

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
	<form id="joinForm">
	<div class="join-container">
		<div class="join-container-inner">
			<div class="join-container-top">
				<h2>회원가입</h2>
			</div>
			<div>
				<div class="join-div">
					<div class="join-label"><label>아이디</label></div><br/>
					<input type="text" id="join_id" class="join-input bor-rad2" name="m_id"
					placeholder="6자이상 10자이하의 영문과 숫자를 조합해서 입력해주세요." />
				</div>
				<div class="join-div">
					<div class="join-label"><label>이름</label></div><br/>
					<input type="text" id="join_name" class="join-input bor-rad2" name="m_name" placeholder="이름 입력" />
				</div>
				<div class="join-div">
					<div class="join-label"><label>비밀번호</label></div><br/>
					<input type="password" id="join_pwd" class="join-input bor-rad2" name="m_pwd" placeholder="8자이상 13자이하의 영문,숫자,,특수문자를 조합해서 입력해주세요." />
				</div>
				<div class="join-div">
					<div class="join-label"><label>비밀번호 확인</label></div><br/>
					<input type="password" id="join_pwdConfirm" class="join-input bor-rad2" name="m_pwdConfirm" placeholder="비밀번호확인 입력" />
				</div>
				<div class="join-div">
					<div class="join-label"><label>전화번호</label></div><br/>
					<input type="text" id="join_phone" class="join-input bor-rad2" name="m_phone" placeholder="전화번호 입력" />
				</div>
				<div class="join-div">
					<div class="join-label"><label>이메일</label></div><br/>
					<input type="text" id="join_email" class="join-input bor-rad2" name="m_email" placeholder="이메일 입력" />
				</div>
				<div class="join-div">
					<div class="join-label"><label>주소</label></div><br/>			
					<input type="text" name="m_zip" class="zip join-input-zip bor-rad2" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" class="join-input-addBtn bor-rad2" value="우편번호 찾기"><br>
					<input type="text" name="address"  class="address1 join-input-address bor-rad2"  id="sample6_address" placeholder="주소"><br>
					<input type="text" name="address"  class="address2 join-input-deAddress bor-rad2"  id="sample6_detailAddress" placeholder="상세주소">
					<input type="text" name="m_address" class="address3" />
				</div>
				
				<div class="BtnDiv">
					<button type="button" id="join" class="joinBtn bor-rad2">회원가입</button>
					<input type="button" id="join_cancel" class="join_cancelBtn bor-rad2" value="취소" />
				</div>
			</div>
		</div>
	</div>
	</form>
</body>
</html>