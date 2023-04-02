<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- fontawesome -->
<script src="https://kit.fontawesome.com/ccd4ff9cee.js" crossorigin="anonymous"></script>
<link href="/resources/include/css/postDetail-1.css" rel="stylesheet">
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
</head>
<body>
	<form id="detailSubmit">
		<input type="hidden" id="c_no" name="c_no" value="${postDetail.c_no}" />
		<input type="hidden" name="m_num" value="${login.m_num}" />
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
				<span>조회수 : ${postDetail.c_reg_date}</span>
			</div>
			<div>
				좋아요
			</div>
		</div>
		
		<div class="detail-content">
			<div class="contentImg">
				${postDetail.c_img}
				<!--현재 이미지가 보이지 않아서 사이즈 조절 못함. 
				     추후 이미지 등록 가능시 사이즈 조절하기. 
				     이미지는 가운데 정렬.-->
			</div>
			<div class="content-comment">
				<p>${postDetail.c_comment}
				<!-- 내용은 오른쪽 정렬. -->
				너의 그 한 마디 말도 그 웃음도 나에겐 커다란 의미 너의 그 작은 눈빛도 쓸쓸한 뒷모습도 나에겐 힘겨운 약속 너의 모든 것은 내게로 와 풀리지 않는 수수께끼가 되네 슬픔은 간이역의 코스모스로 피고 스쳐 불어온 넌 향긋한 바람 나 이제 뭉게구름 위에 성을 짓고 널 향해 창을 내리 바람 ...
				So are you happy now
				
				Finally happy now are you
				
				뭐 그대로야 난
				
				다 잃어버린 것 같아
				
				모든 게 맘대로 왔다가 인사도 없이 떠나
				
				이대로는 무엇도 사랑하고 싶지 않아
				
				다 해질 대로 해져버린
				
				기억 속을 여행해
				
				우리는 오렌지 태양 아래
				
				그림자 없이 함께 춤을 춰
				
				정해진 이별 따위는 없어
				
				아름다웠던 그 기억에서 만나
				
				Forever young
				
				우우우 우우우우 우우우 우우우우
				
				Forever we young
				
				우우우 우우우우
				
				이런 악몽이라면 영영 깨지 않을게
				
				섬 그래 여긴 섬 서로가 만든 작은 섬
				
				예 음 forever young 영원이란 말은 모래성
				
				작별은 마치 재난문자 같지
				
				그리움과 같이 맞이하는 아침
				
				서로가 이 영겁을 지나
				
				꼭 이 섬에서 다시 만나
				
				지나듯 날 위로하던 누구의 말대로 고작
				
				한 뼘짜리 추억을 잊는 게 참 쉽지 않아
				
				시간이 지나도 여전히
				
				날 붙드는 그곳에
				
				우리는 오렌지 태양 아래
				
				그림자 없이 함께 춤을 춰
				
				정해진 안녕 따위는 없어
				
				아름다웠던 그 기억에서 만나
				
				우리는 서로를 베고 누워
				
				슬프지 않은 이야기를 나눠
				
				우울한 결말 따위는 없어
				
				난 영원히 널 이 기억에서 만나
				
				Forever young
				
				우우우 우우우우 우우우 우우우우
				
				Forever we young
				
				우우우 우우우우
				
				이런 악몽이라면 영영 깨지 않을게
				</p>
			</div>
		</div>
		
		<jsp:include page="reply.jsp" />
	</div>
	
	
</body>
</html>