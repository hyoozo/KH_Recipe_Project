<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="/resources/include/css/insertListForm1.css" rel="stylesheet">
<link href="/resources/include/css/admin.css" rel="stylesheet">
<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />

<script type="text/javascript">
	$(function() {
		console.log("error" + $("#file").val());
		$("#updateCancel").click(function() {
			$("#updateSubmit").attr({
				"method":"get",
				"enctype":"multipart/form-data",
				"action":"/community/postDetail"
			})
			$("#updateSubmit").submit();
		})
		
		$("#updateBtn").click(function() {
			
			if(!chkRemain($("#c_title"),"제목을")) return;
			else if(!chkRemain($("#c_comment"),"내용을")) return;
			//else if(!chkRemain($("#file"),"이미지를")) return;
			else if($("#file").val()!=""){
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
	<div class="container block-center">
		<form id="updateSubmit" class="form-horizontal insertForm">
			<input type="hidden" name="m_num" value="${login.m_num}"> <input
				type="hidden" name="c_no" value="${updateForm.c_no}"> <input
				type="hidden" name="c_img" value="${postDetail.c_img}" />
			<table class="table">
				<tbody>
					<tr>
						<td><labeL>작성자</labeL></td>
						<td><input type="text" name="c_writer"
							value="${updateForm.c_writer}" id="c_writer"
							class="form-control c_writer" readonly /></td>
					</tr>
					<tr>
						<td class="td1"><labeL>카테고리</labeL></td>
						<td><select name="c_category" class="form-control"
							style="width: 120px;">
								<option value="잡담">잡담</option>
								<option value="레시피">나의 레시피</option>
								<option value="요리이야기">요리이야기</option>
						</select></td>
					</tr>
					<tr>
						<td class="td1"><labeL>제목</labeL></td>
						<td class="td2"><input type="text" name="c_title" class="form-control" value="${updateForm.c_title}" ></td>
					</tr>
					<tr>
						<td class="td1"><labeL>이미지</labeL></td>
						<td class="td2"><input type="file" name="file" id="file" value="${updateForm.c_img}"></td>
					</tr>
					<tr>
						<td class="td1"><labeL>내용</labeL></td>
						<td class="td2"><textarea name="c_comment" class="form-control"
								style="height: 200px;">${updateForm.c_comment}</textarea></td>
					</tr>
					<tr>
						<td class="td1"></td>
						<td class="td2"><input type="button" id="updateBtn"
							value="수정하기" /> <input type="button" id="updateCancel"
							value="취소" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>