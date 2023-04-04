<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="/resources/include/js/community.js"></script>
<link href="/resources/include/css/community.css" rel="stylesheet">

<script type="text/javascript">
	$(function() {
		$("#insert-list").click(function() {
			$("#insertSubmit").attr({
				"method":"post",
				"action":"/community/postInsert"
			})
			$("#insertSubmit").submit();
		})
		
		$("#insertCancel").click(function() {
			location.href="/community/postList";
		});
	})
</script>

<body>
	
	<form id="insertSubmit">
		<input type="hidden" name="m_num" value="${login.m_num}" >
	
	<table>
		<tbody>
			<tr>
				<td>제목 : </td>
				<td><input type="text" name="c_title"></td>
			</tr>
			<tr>
				<td>카테고리 : </td>
				<td><input type="text" name="c_category"></td>
			</tr>
			<tr>
				<td>작성자 : </td>
				<td><input type="text" name="c_writer" value="${login.m_name}" readonly/></td>
			</tr>
			<tr>
				<td>내용 : </td>
				<td><textarea name="c_comment"></textarea></td>
			</tr>
			<tr>
				<td>이미지 : </td>
				<td><input type="text" name="c_img"></td>
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