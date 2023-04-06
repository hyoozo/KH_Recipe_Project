<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery-3.6.3.min.js"></script>
	<style type="text/css">
		table{
			width:610px;
		}
		.inputInfo{
			width:400px;
		}
	</style>
	
	<script type="text/javascript">
		$(function(){
			let idCheck = false;
			
			$("#checkId").click(function(){
				let mngId=$("#mng_id").val();
				if($("#mng_id").val()==""){
					alert("아이디를 입력해주세요.")
				} else{
					$.ajax({
						url:"/admin/admin/idCheck",
						type:"POST",
						data:{
							mng_id:mngId
						},
						success: function(data){
							if(data == "중복"){
								alert("중복되는 아이디가 있습니다.");
								$("#mng_id").val("");
								$("#mng_id").focus();
								idCheck = false;
							} else {
								alert("사용가능한 아이디 입니다.");
								idCheck = true;
							}
						}
					})
				}
			});
			
			$("#insertBtn").click(function(){
				if(idCheck==false){
					alert("아이디 중복체크를 해주세요.")
					return;
				} else{
					if(!chkData("#mng_pwd", "비밀번호를")) return;
					else if(!chkData("#mng_name", "이름을")) return;
					else if(!chkData("#mng_email", "이메일을")) return;
					else if(!chkData("#mng_phone", "전화번호를")) return;
					else {
						$("#m_insertForm").attr({
							"method" : "post",
							"action" : "/admin/admin/adminInsert"
						});
						$("#m_insertForm").submit();
					}
				}
			});
			
			$("#cancelBtn").click(function(){
				location.href="/admin/admin/adminList";
			})
		}); // $ 종료
	</script>
	</head>
	<body>
		<div class="contentTB">
			<h3>관리자 추가</h3>
			<div class="tableWrapper">
				<form id="m_insertForm" name="m_inserForm">
					<table border="1">
						<colgroup>
								<col width="20%" />
								<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<td>아이디</td>
								<td><input type="text" id="mng_id" name="mng_id" class="inputInfo"/><input type="button" value="중복확인" id="checkId" />
								</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input type="password" id="mng_pwd" name="mng_pwd" class="inputInfo"/></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input type="text" id="mng_name" name="mng_name" class="inputInfo"/></td>
							</tr>
							<tr>
								<td>등급</td>
								<td>
									<select id="mng_lev" name="mng_lev">
										<option value="마스터">마스터</option>
										<option value="관리자">관리자</option>	
									</select>
								</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" id="mng_email" name="mng_email" class="inputInfo"/></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td><input type="text" id="mng_phone" name="mng_phone" class="inputInfo"/></td>
						</tbody>
					</table>
					<div>
							<input type="button" value="관리자 등록" id="insertBtn"/>
							<input type="button" value="취소" id="cancelBtn"/>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>