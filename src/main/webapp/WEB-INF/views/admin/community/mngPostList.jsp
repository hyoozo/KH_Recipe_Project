<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="/resources/include/css/insertListForm1.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/resources/include/js/jquery-3.6.3.min.js"></script>

<script type="text/javascript">
$(function() {
		
		//검색
		let word = "<c:out value='${CommunityManagerVO.keyword}' />";
		let value = "";
		if(word!="") {
			$("#keyword").val("<c:out value='${CommunityManagerVO.keyword}' />");
			$("#search").val("<c:out value='${CommunityManagerVO.search}' />");
			
			/*if($("#search").val() != 'c_comment') {
				if($("#search").val == 'c_title') value = "#list tr td.goDetail";
				else if($("#search").val() == 'c_writer') value = "#list tr td.listWriter";
				
	
				$(value+":contains('" + word + "')").each(function() {
					let regex = new RegExp(word,'gi');
					$(this).html($(this).html().replace(regex,"<span class='required'>" + word + "</span>"));
				});
			}*/
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
			$("#pageNum").val(1);
			goPage();
		})
		
		//검색 처리 함수
		function goPage() {
			if($("#search").val() == "all") {
				$("#keyword").val("");
			}
			
			$("#c_search").attr({
				"method":"get",
				"action":"/admin/community/postList"
			});
			$("#c_search").submit();
		}
		
		//페이징
		$(".paginateBtn a").click(function(e) {
			e.preventDefault();
			$("#c_search").find("input[name='pageNum']").val($(this).attr("href"));
			//console.log($(this).attr("href"))
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
		
		//디테일 페이지 이동
		$(".goDetail2").click(function() {
			let cm_no = $(this).parents("tr").attr("data-num");
			$("#cm_no").val(cm_no);
	
			$("#mngDetailForm").attr({
				"method":"get",
				"enctype":"multipart/form-data",
				"action":"/admin/community/mngPostDetail"
			})
			$("#mngDetailForm").submit();
		})
		
		
		$(".paginateBtn a").click(function(e) {
			e.preventDefault();
			$("#c_search")
		})
		
		//글쓰기
		$("#postList-insert").click(function() {
			location.href = "/admin/community/mngInsertForm";
		})
})
</script>

<body>

	<form id="mngDetailForm">
		<input type="hidden" id="cm_no" name="cm_no">
	</form>

	<div class="search-box">
		<form id="c_search">
			<input type="hidden" name="pageNum" id="pageNum"
				value="${pageMaker2.cvo.pageNum}"> <input type="hidden"
				name="amount" value="${pageMaker2.cvo.amount}">
			<div class="inline-box">
				<select name="search" id="search">
					<option value="all">전체</option>
					<option value="cm_title">제목</option>
					<option value="cm_writer">작성자</option>
					<option value="cm_comment">내용</option>
				</select> <input type="text" name="keyword" id="keyword"
					placeholder="검색어를 입력하세요" />
				<button type="button" id="comSearchBtn">검색</button>
			</div>
		</form>
	</div>

	<table class="table table-striped">
		<thead>
			<tr>
				<th id="cm_no">글 번호</th>
				<th id="cm_title">제 목</th>
				<th id="cm_writer">작성자</th>
				<th><span></span></th>
				<th id="cm_reg_date">등록일</th>
				<th id="cm_readcnt">조회수</th>
			</tr>
		</thead>

		<tbody>
			<tr>
				<c:choose>
					<c:when test="${not empty MngList}">
						<c:forEach var="MngList" items="${MngList}" varStatus="status">
							<tr data-num="${MngList.cm_no}">
								<td>${MngList.cm_no}</td>
								<td class="goDetail2">${MngList.cm_title}</td>
								<td class="listWriter">${MngList.cm_writer}</td>
								<td><span></span></td>
								<td>${MngList.cm_reg_date}</td>
								<td>${MngList.cm_readcnt}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td>더 이상 게시물이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tr>
		</tbody>
	</table>


	<div id="pageBox">
		<ul class="pageUl">
			<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인 -->
			<c:if test="${pageMaker2.prev}">
				<li class="paginateBtn"><a href="${pageMaker2.startPage-1}">Previous</a>
				</li>
			</c:if>

			<!-- 바로가기 번호 출력 -->
			<c:forEach var="num" begin="${pageMaker2.startPage}"
				end="${pageMaker2.endPage}">
				<li class="paginateBtn ${pageMaker2.cvo.pageNum == num ?'active':''}">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>

			<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인 -->
			<c:if test="${pageMaker2.next}">
				<li class="paginateBtn"><a href="${pageMaker2.endPage+1}">Next</a>
				</li>
			</c:if>
		</ul>
	</div>
	<div class="writh-box">
		<input type="button" id="postList-insert" value="글쓰기">
	</div>

</body>
</html>