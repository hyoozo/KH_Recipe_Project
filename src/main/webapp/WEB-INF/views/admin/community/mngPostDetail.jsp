<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
					"method":"get",
					"action":"/admin/community/mngPostDelete"
				})
			$("#detailSubmit").submit();
			} else {
				return;
			}
		});
		
		$("#postUpdate").click(function() {
			if(confirm("게시물을 수정하시겠습니까? ?") == true){
				$("#detailSubmit").attr({
					"method":"get",
					"action":"/admin/community/mngUpdateForm"
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
	<div>
		<form id="detailSubmit" class="detail-container">
			<input type="hidden" id="cm_no" name="cm_no"
				value="${mngPostDetail.cm_no}" /> <input type="hidden"
				name="cm_img" value="${mngPostDetail.cm_img}" />
		</form>

		<div class="detail-bth">
			<input type="button" id="postUpdate" value="게시물 수정"> <input
				type="button" id="postDelete" value="게시물 삭제"> <input
				type="button" id="detail-list" value="목록">
		</div>
		<div class="detail-container">
			<div class="detail-header">
				<div class="detail-title">제목 : ${mngPostDetail.cm_title}</div>
				<div class="detail-writer">작성자 : ${mngPostDetail.cm_writer}</div>
				<div class="detail-date" class="detail-date">
					<span>등록일자 : ${mngPostDetail.cm_reg_date}</span> <span>조회수 :
						${mngPostDetail.cm_readcnt}</span>
				</div>
			</div>

			<div class="detail-content">
				<div class="contentImg">
					<img src="/uploadStorage/board/${mngPostDetail.cm_img}" />
				</div>
				<div class="content-comment">
					<p>${mngPostDetail.cm_comment}
						<!-- 내용은 오른쪽 정렬. -->
					</p>
				</div>
			</div>

		</div>
	</div>
</html>