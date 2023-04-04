<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="/resources/include/js/community.js"></script>
<link href="/resources/include/css/community.css" rel="stylesheet">

<script type="text/javascript">
	$(function() {
		$("#updateCancel").click(function() {
			$("#updateSubmit").attr({
				"method":"get",
				"enctype":"multipart/form-data",
				"action":"/community/postDetail"
			})
			$("#updateSubmit").submit();
		})
		
		$("#updateBtn").click(function() {
			
			if($("#file").val()!=""){
				if (!chkFile($("#file"))) return; 
			}
			
			$("#updateSubmit").attr({
				"method":"post",
				"enctype":"multipart/form-data",
				"action":"/community/postUpdate"
			})
			$("#updateSubmit").submit();
		})
		
		function chkFile(item){
			let ext = item.val().split('.').pop().toLowerCase();
			if(jQuery.inArray(ext, ['gif','png','jpg']) == -1) {
				alert('gif, png, jpg 파일만 업로드 할 수 있습니다.');
				item.val("");
				return false;
			}else {
				return true;
			}
		}	
		
	})
</script>

<body>
	<form id="updateSubmit">
		<input type="hidden" name="m_num" value="${login.m_num}">
		<input type="hidden" name="c_no" value="${updateForm.c_no}">
		<input type="hidden" name="c_img" value="${postDetail.c_img}" />
	<table>
		<tbody>
			<tr>
				<td>작성자 : </td>
				<td>${updateForm.c_writer}</td>
			</tr>
			<tr>
				<td>카테고리 : </td>
				<td><input type="text" name="c_category" value="${updateForm.c_category}"></td>
			</tr>
			<tr>
				<td>제목 : </td>
				<td><input type="text" name="c_title" value="${updateForm.c_title}" /></td>
			</tr>
			<tr>
				<td>이미지 : </td>
				<td><input type="file" name="file" id="file" value="${updateForm.file}" /></td>
			</tr>
			<tr>
				<td>내용 : </td>
				<td><textarea name="c_comment">${updateForm.c_comment}</textarea></td>
			</tr>
		</tbody>
	</table>
	<input type="button" id="updateBtn" value="수정하기" />
	<input type="button" id="updateCancel" value="취소" />
	
	</form>
</body>
</html>