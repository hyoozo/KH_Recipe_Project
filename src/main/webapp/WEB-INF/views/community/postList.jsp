<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>

<script src="/resources/include/js/community.js"></script>
<link href="/resources/include/css/community.css" rel="stylesheet">

<script type="text/javascript">
	$(function() {
		$(".goDetail").click(function() {
			let c_no = $(this).parents("tr").attr("data-num");
			console.log("c_no1 : " + c_no);
			$("#c_no").val(c_no);
			console.log("c_no2 : " + c_no);
			
			$("#detailForm").attr({
				"medtho":"get",
				"action":"/community/postDetail"
			})
			$("#detailForm").submit();
		})
		
		$("#postList-insert").click(function() {
			location.href="/community/insertForm";
		})
		
				
 		let useAfter = "${useAfter}";
		console.log("useAfter:" + useAfter);
		if (useAfter == "error") {
			useAfter = "";
			if(confirm("로그인 후에 이용가능합니다. 로그인 하시겠습니까?") == true) {
				result = location.href="/member/loginForm";
			} else {
				return;
			}
		} 
	});
</script>

<body>
	커뮤니티게시판

		<form id="detailForm">
			<input type="hidden" id="c_no" name="c_no">
		</form>
		
		<div>
			<div>
				<iframe width="280" height="157.5" src="https://www.youtube.com/embed/87zznFb0-us?autoplay=1&mute=1" title="YouTube video player"
				></iframe>
				<iframe width="280" height="157.5" src="https://www.youtube.com/embed/t4Es8mwdYlE" title="YouTube video player"
				></iframe>
				<iframe width="280" height="157.5" src="https://www.youtube.com/embed/pTvMsM2v1tg" title="YouTube video player"
				></iframe>
			</div>
		</div>
		
		<div>
			<table>
				<thead>
					<tr>
						<td>글 번호</td>
						<td>이미지</td>
						<td>제 목</td>
						<td>작성자</td>
						<td>카테고리</td>
						<td>등록일</td>
						<td>조회수</td>
						<td>추천</td>
					</tr>
				</thead>
				
				<tbody>
					<c:choose>
						<c:when test="${not empty postList}">
							<c:forEach var="postList"  items="${postList}" varStatus="status">
								<tr data-num="${postList.c_no}">
									<th>${postList.c_no}</th>
									<th>${postList.c_img}</th>
									<th class="goDetail">${postList.c_title}</th>
									<th>${postList.c_writer}</th>
									<th>${postList.c_category}</th>
									<th>${postList.c_reg_date}</th>
									<th>${postList.c_readcnt}</th>
									<th>추천</th>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td>더 이상 게시물이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>

				</tbody>
			</table>
		</div>
		
		<div>
			<input type="button" id="postList-insert" value="글쓰기">
		</div>

</body>
</html>