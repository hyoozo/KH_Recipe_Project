<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="/resources/include/js/community.js"></script>
<link href="/resources/include/css/community.css" rel="stylesheet">

<script type="text/javascript">
	$(function() {
		$("#detail-update").click(function() {
			console.log("버튼은 눌림");
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
	})
</script>

<body>
	커뮤니티 디테일
	<form id="detailSubmit">
		<input type="hidden" name="c_no" value="${postDetail.c_no}" />
		<input type="hidden" name="m_num" value="${login.m_num}" />
	</form>
	
	<div>
		<div>
			<div>
				제목 : ${postDetail.c_title}
				카테고리 : ${postDetail.c_category}
				작성자 : ${postDetail.c_writer}
				조회수 : ${postDetail.c_reg_date}
				좋아요
				등록일자 : ${postDetail.c_reg_date}
			</div>
			<div>
				<input type="button" id="detail-update" value="게시물 수정">
				<input type="button" id="postDelete" value="게시물 삭제">
			</div>
			<div>
				이미지 : ${postDetail.c_img}
				내용 : ${postDetail.c_comment}
			</div>
		</div>
		<div>
			<input type="button" id="detail-list" value="목록">
		</div>
	</div>
</body>
</html>