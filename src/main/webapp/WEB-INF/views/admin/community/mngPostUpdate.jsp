<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/resources/include/js/jquery-3.6.3.min.js"></script>

<script type="text/javascript">
	$(function() {
		$("#updateCancel").click(function() {
			$("#updateSubmit").attr({
				"method":"get",
				"enctype":"multipart/form-data",
				"action":"/community/mngPostDetail"
			})
			$("#updateSubmit").submit();
		})
		
		$("#mngUpdateBtn").click(function() {
			
			if($("#file").val()!=""){
				if (!chkFile($("#file"))) return; 
			}
			
			$("#updateSubmit").attr({
				"method":"post",
				"enctype":"multipart/form-data",
				"action":"/admin/community/mngPostUpdate"
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
		<input type="hidden" name="cm_no" value="${mngUpdateForm.cm_no}">
		<input type="hidden" name="cm_img" value="${mngUpdateForm.cm_img}" />
	<table>
		<tbody>
			<tr>
				<td>작성자 : </td>
				<td><span>${mngUpdateForm.cm_writer}</span></td>
			</tr>
			<tr>
				<td>제목 : </td>
				<td><input type="text" name="cm_title" value="${mngUpdateForm.cm_title}" /></td>
			</tr>
			<tr>
				<td>이미지 : </td>
				<td><input type="file" name="file" id="file" value="${mngUpdateForm.file}" /></td>
			</tr>
			<tr>
				<td>내용 : </td>
				<td><textarea name="cm_comment">${mngUpdateForm.cm_comment}</textarea></td>
			</tr>
		</tbody>
	</table>
	<input type="button" id="mngUpdateBtn" value="수정하기" />
	<input type="button" id="updateCancel" value="취소" />
	
	</form>
</body>
</html>