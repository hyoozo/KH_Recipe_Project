<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/resources/include/js/jquery-3.6.3.min.js"></script>

<script type="text/javascript">
	$(function() {
		
		
		$("#insert-list").click(function() {
			
			if($("#file").val()!=""){ 
				if (!chkFile($("#file"))) return;
			}
		
			$("#insertSubmit").attr({
				"method":"post",
				"enctype":"multipart/form-data",
				"action":"/admin/community/mngPostInsert"
			})
			$("#insertSubmit").submit();
		})
		
		
		$("#insertCancel").click(function() {
			location.href="/admin/community/postList";
		});
		
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
	
	<form id="insertSubmit">
		<input type="hidden" name="mng_num" value="${adminLogin.mng_num}" >
		<input type="hidden" name="cm_img" id="cm_img" >
	
	<table>
		<tbody>
			<tr>
				<td>제목 : </td>
				<td><input type="text" name="cm_title"></td>
			</tr>
			<tr>
				<td>작성자 : </td>
				<td><input type="text" name="cm_writer" value="${adminLogin.mng_id}" readonly/></td>
			</tr>
			<tr>
				<td>내용 : </td>
				<td><textarea name="cm_comment"></textarea></td>
			</tr>
			<tr>
				<td>이미지 : </td>
				<td><input type="file" name="file" id="file" /></td>
			</tr>
		</tbody>
	</table>
	
	<div>
		<input type="button" id="insert-list" value="입력하기">
		<input type="button" id="insertCancel" value="취소">
	</div>
	
	</form>
</body>
</html>