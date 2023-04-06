<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="/resources/include/css/insertListForm1.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/resources/include/js/jquery-3.6.3.min.js"></script>


<script type="text/javascript">
	$(function() {
		
		
		$("#insert-list").click(function() {
			if(!chkRemain($("#cm_title"),"제목을")) return;
			else if(!chkRemain($("#cm_comment"),"내용을")) return;
			else if(!chkRemain($("#file"),"이미지를")) return;
			else if($("#file").val()!=""){ 
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
		
		function chkRemain(item3,msg) {
			if(item3.val() != "") {
				return true;
			} else {
				alert(msg + " 입력해주세요.");
				$(item3).val("");
				$(item3).focus()
				return false;
			}
		}
	})
</script>

<body>
	<div class="container block-form">
		<form id="insertSubmit" class="form-horizontal insertForm">
			<input type="hidden" name="mng_num" value="${adminLogin.mng_num}">
			<input type="hidden" name="cm_img" id="cm_img">

			<table class="table">
				<tbody>
					<tr>
						<td class="td1">제목 :</td>
						<td class="td3"><input type="text" name="cm_title" id="cm_title" class="form-control"></td>
					</tr>
					<tr>
						<td class="td1">작성자 :</td>
						<td><input type="text" name="cm_writer"
							value="${adminLogin.mng_id}"  class="form-control" readonly /></td>
					</tr>
					<tr>
						<td class="td1">내용 :</td>
						<td class="td3"><textarea name="cm_comment" class="form-control" id="cm_comment" style="height: 200px;"></textarea></td>
					</tr>
					<tr>
						<td class="td1">이미지 :</td>
						<td><input type="file" name="file" id="file" /></td>
					</tr>
				</tbody>
			</table>

			<div>
				<input type="button" id="insert-list" value="입력하기"> <input
					type="button" id="insertCancel" value="취소">
			</div>

		</form>
	</div>
</body>
</html>