<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://kit.fontawesome.com/ccd4ff9cee.js" crossorigin="anonymous"></script>
<link href="/resources/include/css/postDetail-1.css" rel="stylesheet">
<link href="/resources/include/css/community.css" rel="stylesheet">
<script src="/resources/include/js/member.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
	$(function() {
		$("#detail-list").click(function() {
			location.href="/community/postList";
		});
	})
</script>
		
		
		
<body>
	<form id="detailSubmit">
		<input type="hidden" id="cm_no" name="cm_no" value="${mngPostDetail.cm_no}" />
		<input type="hidden" name="cm_img" value="${mngPostDetail.cm_img}" />
	</form>
	
	<div class="detail-bth">
		<input type="button" id="detail-list" value="목록">
	</div>
	<div class="detail-container">
		<div class="detail-header">
			<div class="detail-title">
				제목 : ${mngPostDetail.cm_title}
			</div>
			<div class="detail-writer">
				작성자 : ${mngPostDetail.cm_writer}
			</div>
			<div class="detail-date">
				<span>등록일자 : ${mngPostDetail.cm_reg_date}</span>
				<span>조회수 : ${mngPostDetail.cm_readcnt}</span>
			</div>
		</div>
		
		<div class="detail-content">
			<div class="contentImg">
				<img src="/uploadStorage/board/${mngPostDetail.cm_img}" onerror="this.onerror=null; this.src='${mngPostDetail.cm_img}';">
			</div>
			<div class="content-comment">
				<p>${mngPostDetail.cm_comment}
				<!-- 내용은 오른쪽 정렬. -->
				</p>
			</div>
		</div>
	
	</div>
</body>
</html>