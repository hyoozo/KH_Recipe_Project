<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<link href="/resources/include/css/member.css" rel="stylesheet">
<script src="/resources/include/js/member.js"></script>

<script type="text/javascript">
	$(function() {
		let loginError = "${loginError}";
		if (loginError == "로그인실패") {
			alert("아이디와 비밀번호를 확인해주세요");
			loginError = "";
		};
	})
</script>

<body>
	
	<form id="loginForm">
	<div class="login-container">
		<div class="login-inner">
			<div class="login-top center">
				<h3 class="h3">로그인</h3>
			</div>

			<div class="login-middle">
				<div><input type="text" id="m_id" name="m_id" class="login-input bor-rad3" placeholder="아이디를 입력해주세요"></div>
				<div><input type="password" id="m_pwd" name="m_pwd" class="login-input m_pwd bor-rad3" placeholder="비밀번호를 입력해주세요"></div>
				<button type="button" id="login" class="login bor-rad3 btnGreen">로그인</button>
				<input type="button" id="login_join" class="login_join bor-rad3" value="회원가입" />
			</div>
		</div>
	</div>
	</form>
	
</body>
</html>