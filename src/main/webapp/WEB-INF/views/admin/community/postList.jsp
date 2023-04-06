<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/resources/include/js/jquery-3.6.3.min.js"></script>

<script type="text/javascript">
	$(function(){
		
		
		//디테일 페이지 이동
		$(".goDetail1").click(function() {
			let c_no = $(this).parents("tr").attr("data-num");
			console.log("c_no1 : " + c_no);
			$("#c_no").val(c_no);
			console.log("c_no2 : " + c_no);
			
			$("#detailForm").attr({
				"method":"get",
				"action":"/admin/community/postDetail"
			})
			$("#detailForm").submit();
		})
		
		$(".paginateBtn a").click(function(e) {
			e.preventDefault();
			$("#c_search")
		})
		
		$("#postList-insert").click(function() {
			location.href="admin/community/insertForm";
		})
		
		//검색
		let word = "<c:out value='${communityVO.keyword}' />";
		let value = "";
		if(word!="") {
			$("#keyword").val("<c:out value='${communityVO.keyword}' />");
			$("#search").val("<c:out value='${communityVO.search}' />");
			
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
	
		let data1 =  $("#mngPostList1");
		let data2 =  $("#mngPostList2");
		
		$(data2).remove();
		
		$("#postList-mngPostList").click(function() {
			$(data1).remove();
			$("#containber").append(data2);
		})
		$("#postList-PostList").click(function() {
			$(data2).remove();
			$("#containber").append(data1);
		})
		

	});
</script>

</head>
<body>
<div>
		
	<div>
		<input type="button" id="postList-mngPostList" value="공지사항">
		<input type="button" id="postList-PostList" value="사용자게시판">
	</div>
	
		<div id="containber">
			<div id="mngPostList1">
				<form id="detailForm">
					<input type="hidden" id="c_no" name="c_no">
				</form>
				<div class="search-box">
					<form id="c_search">
						<input type="hidden" name="pageNum" id="pageNum"
							value="${pageMaker1.cvo.pageNum}"> <input type="hidden"
							name="amount" value="${pageMaker1.cvo.amount}">
						<div class="inline-box">
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

				<table>
					<thead>
						<tr>
							<th id="b_num">글 번호</th>
							<th id="b_title">제 목</th>
							<th id="b_writer">작성자</th>
							<th id="b_categori">카테고리</th>
							<th id="b_date">등록일</th>
							<th id="b_views">조회수</th>
							<th id="b_rek">추천</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<c:choose>
								<c:when test="${not empty postList}">
									<c:forEach var="postList" items="${postList}"
										varStatus="status">
										<tr data-num="${postList.c_no}">
											<td>${postList.c_no}</td>
											<td class="goDetail1">${postList.c_title}</td>
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
						</tr>
					</tbody>
				</table>


				<div>
					<ul>
						<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인 -->
						<c:if test="${pageMaker1.prev}">
							<li class="paginateBtn"><a href="${pageMaker1.startPage-1}">Previous</a>
							</li>
						</c:if>

						<!-- 바로가기 번호 출력 -->
						<c:forEach var="num" begin="${pageMaker1.startPage}"
							end="${pageMaker1.endPage}">
							<li
								class="paginateBtn ${pageMaker1.cvo.pageNum == num ?'active':''}">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인 -->
						<c:if test="${pageMaker1.next}">
							<li class="paginateBtn"><a href="${pageMaker1.endPage+1}">Next</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>


			<div id="mngPostList2">
				<jsp:include page="mngPostList.jsp" />
			</div>
		</div>

	</div>
</body>
</html>