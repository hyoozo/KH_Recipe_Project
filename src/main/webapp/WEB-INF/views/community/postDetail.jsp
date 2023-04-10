<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- fontawesome -->
<script src="https://kit.fontawesome.com/ccd4ff9cee.js" crossorigin="anonymous"></script>
<link href="/resources/include/css/postDetail-1.css" rel="stylesheet">
<link href="/resources/include/css/community.css" rel="stylesheet">
<script src="/resources/include/js/member.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
	$(function() {
		$("#detail-update").click(function() {
			$("#detailSubmit").attr({
				"medtho":"get",
				"action":"/community/updateForm"
			})
			$("#detailSubmit").submit();
		})
		
		$("#detail-list").click(function() {
			location.href="/community/postList";
		});
		
		$("#postDelete").click(function() {
			if(confirm("게시물을 삭제하시겠습니까? ?") == true){
				$("#detailSubmit").attr({
					"medtho":"get",
					"action":"/community/postDelete"
				})
			$("#detailSubmit").submit();
			} else {
				return;
			}
		});
		
		//게시물 수정,삭제 버튼 숨김
		$("#detail-update").hide();
		$("#postDelete").hide();
		
		let comNum = ${postDetail.m_num};
			
		let memNum = $("input[name=m_num]").val();

		if(comNum == memNum) {
			$("#detail-update").show();
			$("#postDelete").show();
		};  

	})
</script>
</head>
<body>
	<form id="detailSubmit">
		<input type="hidden" id="c_no" name="c_no" value="${postDetail.c_no}" />
		<input type="hidden" name="m_num" value="${login.m_num}" />
		<input type="hidden" name="c_img" value="${postDetail.c_img}" />
	</form>
	
	<div class="detail-bth">
		<input type="button" id="detail-update" value="게시물 수정">
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
				<span>조회수 : ${postDetail.c_readcnt}</span>
			</div>
			<div>
				좋아요
			</div>
		</div>
		
		<div class="detail-content">
			<c:if test="${not empty postDetail.c_img}">
				<div class="contentImg">
					<img src="/uploadStorage/board/${postDetail.c_img}" onerror="this.onerror=null; this.src='${postDetail.c_img}';">
				</div>
			</c:if>
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