<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>

<script src="/resources/include/js/community.js"></script>
<link href="/resources/include/css/community.css" rel="stylesheet">

<script type="text/javascript">
	$(function() {
		
		//디테일 페이지 이동
		$(".goDetail").click(function() {
			let c_no = $(this).parents("tr").attr("data-num");
			console.log("c_no1 : " + c_no);
			$("#c_no").val(c_no);
			console.log("c_no2 : " + c_no);
			
			$("#detailForm").attr({
				"method":"get",
				"action":"/community/postDetail"
			})
			$("#detailForm").submit();
		})
		
		$(".paginateBtn a").click(function(e) {
			e.preventDefault();
			$("#c_search")
		})
		
		$("#postList-insert").click(function() {
			location.href="/community/insertForm";
		})
		
		
		//글쓰기 버튼 클릭 (로그인 유무 확인)
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
		
		//검색
		let word = "<c:out value='${communityVO.keyword}' />";
		let value = "";
		if(word!="") {
			$("#keyword").val("<c:out value='${communityVO.keyword}' />");
			$("#search").val("<c:out value='${communityVO.keyword}' />");
			
			if($("#search").val() != 'c_comment') {
				if($("#search").val == 'c_title') value = "#list tr td.goDetail";
				else if($("#search").val() == 'c_writer') value = "#list tr td.listWriter";
				
	
				$(value+":contains('" + word + "')").each(function() {
					let regex = new RegExp(word,'gi');
					$(this).html($(this).html().replace(regex,"<span class='required'>" + word + "</span>"));
				});
			}
		}
		
		//enter 제거
		$("#keyword").bind("keydown",function(event) {
			if(event.keyCode == 13) {
				event.preventDefault();
			}
		});
		
		//검색 대상 변경 시
		$("#search").change(function() {
			if($("#search").val() == "all") {
				$("#keyword").val("전체 데이터 조회합니다.");
			} else if($("#search").val() != "all") {
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
		
		//검색 버튼 클릭 이벤트
		$("#comSearchBtn").click(function() {
			if($("#search").val() != "all"){
				if(!chkSearch("#keyword","검색어를")) return;
			}
			goPage();
		})
		
		
		//검색 처리 함수
		function goPage() {
			if($("#search").val() == "all") {
				$("#keyword").val("");
			}
			
			$("#c_search").attr({
				"method":"get",
				"action":"/community/postList"
			});
			$("#c_search").submit();
		}
		
		$(".paginateBtn a").click(function(e) {
			e.preventDefault();
			$("#c_search").find("input[name='pageNum']").val($(this).attr("href"));
			goPage();
		})
		
		
		//검색어 확인 
		function chkSearch(item, msg) {
			if($(item).val().replace(/\s/g,"")=="") {
				alert(msg + " 입력해주세요 ");
				$(item).val("");
				$(item).focus();
				return false;
			} else {
				return true;
			}
		}
		
		console.log("야호!:" + ${pageMaker.prev} );
		console.log("pageNum:" + ${pageMaker.cvo.pageNum} );
		console.log("amount:" + ${pageMaker.cvo.amount} );
		console.log("endPage:" + ${pageMaker.endPage} );
	});
</script>

<body>
	커뮤니티게시판

	<form id="detailForm">
		<input type="hidden" id="c_no" name="c_no">
	</form>

	<div>
		<div>
			<iframe width="280" height="157.5"
				src="https://www.youtube.com/embed/87zznFb0-us?autoplay=1&mute=1"
				title="YouTube video player"></iframe>
			<iframe width="280" height="157.5"
				src="https://www.youtube.com/embed/t4Es8mwdYlE"
				title="YouTube video player"></iframe>
			<iframe width="280" height="157.5"
				src="https://www.youtube.com/embed/pTvMsM2v1tg"
				title="YouTube video player"></iframe>
		</div>
	</div>

	<div>
		<table>
			<thead>
				<tr>
					<th>글 번호</th>
					<th>이미지</th>
					<th>제 목</th>
					<th>작성자</th>
					<th>카테고리</th>
					<th>등록일</th>
					<th>조회수</th>
					<th>추천</th>
				</tr>
			</thead>

			<tbody id="list">
				<c:choose>
					<c:when test="${not empty postList}">
						<c:forEach var="postList" items="${postList}" varStatus="status">
							<tr data-num="${postList.c_no}">
								<td>${postList.c_no}</td>
								<td>${postList.c_img}</td>
								<td class="goDetail">${postList.c_title}</td>
								<td class="listWriter">${postList.c_writer}</td>
								<td>${postList.c_category}</td>
								<td>${postList.c_reg_date}</td>
								<td>${postList.c_readcnt}</td>
								<td>추천</td>
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
		<ul>
			<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인 -->
			<c:if test="${pageMaker.prev}">
				<li class="paginateBtn">
					<a href="${pageMaker.startPage-1}">Previous</a>
				</li>
			</c:if>

			<!-- 바로가기 번호 출력 -->
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li class="paginateBtn ${pageMaker.cvo.pageNum == num ?'active':''}">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>

			<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인 -->
			<c:if test="${pageMaker.next}">
				<li class="paginateBtn">
					<a href="${pageMaker.endPage+1}">Next</a>
				</li>
			</c:if>
		</ul>
	</div>

	<div>
		<form id="c_search">
			<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
			<div>
				<select name="search" id="search">
					<option value="all">전체</option>
					<option value="c_title">제목</option>
					<option value="c_writer">작성자</option>
					<option value="c_comment">내용</option>
				</select> <input type="text" name="keyword" id="keyword"
					placeholder="검색어를 입력하세요" />
				<button type="button" id="comSearchBtn">검색</button>
			</div>
		</form>
	</div>

	<div>
		<input type="button" id="postList-insert" value="글쓰기">
	</div>

</body>
</html>