<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- fontawesome -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/resources/include/js/jquery-3.6.3.min.js"></script>
<link href="/resources/include/css/community.css" rel="stylesheet">
<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" >

<script type="text/javascript">
	$(function() {
		$("#detail-list").click(function() {
			location.href="/admin/community/postList";
		});
		
		$("#postDelete").click(function() {
			if(confirm("게시물을 삭제하시겠습니까? ?") == true){
				$("#detailSubmit").attr({
					"medtho":"get",
					"action":"/admin/community/postDelete"
				})
			$("#detailSubmit").submit();
			} else {
				return;
			}
		});
	})
</script>
</head>
<body>
	<form id="detailSubmit"  class="detail-container">
		<input type="hidden" id="c_no" name="c_no" value="${postDetail.c_no}" />
		<input type="hidden" name="c_img" value="${postDetail.c_img}" />
	</form>
	
	<div class="detail-bth">
		<input type="button" id="postDelete" value="게시물 삭제">
		<input type="button" id="detail-list" value="목록">
	</div>
	<div class="detail-container">
		<div class="detail-header">
			<div class="category">
				카테고리 : ${postDetail.c_category}
			</div>
			<div class="detail-title">
				제목 : ${postDetail.c_title}
			</div>
			<div class="detail-writer">
				작성자 : ${postDetail.c_writer}
			</div>
			<div class="detail-date">
				<span>등록일자 : ${postDetail.c_reg_date}</span>
				<span>조회수 : ${postDetail.c_reg_date}</span>
			</div>
			<div>
				좋아요
			</div>
		</div>
		
		<div class="detail-content">
			<div class="contentImg">
			<img src="/uploadStorage/board/${postDetail.c_img}" />
			</div>
			<div class="content-comment">
				<p>${postDetail.c_comment}
				<!-- 내용은 오른쪽 정렬. -->
				</p>
			</div>
		</div>
	
		<jsp:include page="reply.jsp" />
	</div>
	
	
</body>
</html>