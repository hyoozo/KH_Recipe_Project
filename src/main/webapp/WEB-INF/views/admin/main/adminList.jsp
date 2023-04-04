<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery-3.6.3.min.js"></script>
	<link href="/resources/include/css/AdminMemberList.css" rel="stylesheet">

<script type="text/javascript">
	$(function(){
		$(".paginate_button a").click(function(e) {
			 e.preventDefault();
			 $("#m_search").find("input[name='pageNum']").val($(this).attr("href"));
			 goPage();
		});
		
		let word="<c:out value='${managerVO.keyword}' />";
		let value="";
		if(word!=""){
			$("#keyword").val("<c:out value='${managerVO.keyword}' />");
			$("#search").val("<c:out value='${managerVO.search}' />");
			
			if($("#search").val()=='mng_name') {
				value = ".table tbody tr td.name";
			} else if ($("#search").val()=='mng_lev') value = ".table tbody tr td.lev";
			
			$(value+":contains('"+word+"')").each(function(){
				let regex = new RegExp(word, 'gi');
				$(this).html($(this).html().replace(regex, "<span class='required'>"+word+"</span>"));
			});
		}
		
		$("#keyword").bind("keydown", function(event){
			if(event.keyCode == 13) {
				event.preventDefault();
			}
		});
		
		$("#search").change(function(){
			if($("#search").val()=="all") {
				$("#keyword").val("전체 관리자를 조회합니다.");
			} else if($("#search").val()!="all"){
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
		
		$("#searchData").click(function(){
			if($("#search").val() != "all"){
				if(!chkData("#keyword","검색어를")) return;
			}
			goPage();
		});
		
		$("#insertManager").click(function(){
			//console.log("!11")
			location.href="/admin/admin/insertForm";
		});
		
		$(".deleteManager").click(function(){
			if(confirm("관리자를 정말 삭제하시겠습니까?\n삭제한 관리자는 복구할 수 없습니다.")){
			let mng_num = $(this).parents("tr").attr("data-num");
			$("#mng_num").val(mng_num);
			$("#deleteMan").attr({
				"method" : "get",
				"action" : "/admin/admin/adminDelete"
			});
			$("#deleteMan").submit();
			}
		});

	}); // $ 종료
	
	function goPage(){
		if($("#search").val()=="all"){
			$("#keyword").val("");
		}
		
		$("#m_search").attr({
			"method" : "get",
			"action" : "/admin/admin/adminList"
		});
		$("#m_search").submit();
	}
</script>
	</head>
	<body>
		<div class="contentContainer container">
			<h3>관리자 계정 관리</h3>
			<form id="deleteMan">
				<input type=hidden id="mng_num" name="mng_num" />
			</form>
				<%-- 검색기능 --%>
			<div id="wrapper2">
			<div id="recipeSearch">
				<form id="m_search" name="m_search" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
					<div class="textright">
						<label>검색조건</label>
						<select id="search" name="search">
							<option value="all">전체</option>
							<option value="mng_name">관리자명</option>
							<option value="mng_lev">등급</option>
						</select>
						<input type="text" name="keyword" id="keyword" value="전체 관리자를 조회합니다."/>
						<button type="button" id="searchData" class="issc">검색</button>
					</div>
				</form>
			</div>
			<c:if test="${adminLogin.mng_lev eq '마스터'}">
				<div id="insertManager">
					<button type="button" id="insertManager" class="issc">관리자 추가</button>
				</div>
			</c:if>
			
			<%-- 관리자 리스트 --%>
			<div id="managerList">
				<table summary="관리자 리스트" class="table">
					<colgroup>
						<col style="width:10%">
						<col style="width:15%">
						<col style="width:25%">
						<col style="width:15%">
						<col style="width:25%">
						<col style="width:10%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>휴대폰 번호</th>
							<th>등급</th>
							<th>이메일</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody id="list">
						<c:choose>
							<c:when test="${not empty adminList}">
								<c:forEach var="admin" items="${adminList}" varStatus="status">
									<tr data-num="${admin.mng_num}">
										<td>${admin.mng_num}</td>
										<td class="name">${admin.mng_name}</td>
										<td>${admin.mng_phone}
										<td class="lev">${admin.mng_lev}</td>
										<td>${admin.mng_email}</td>
										<c:if test="${adminLogin.mng_lev eq '마스터'}">
										<td><input type="button" class="deleteManager issc" value="삭제"></td>
										</c:if>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>				
					</tbody>
				</table>
			</div>
			<%-- 페이징 처리 --%>
			<div class="tc">
				<ul class="pagination">
				<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인. -->
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous">
						<a href="${pageMaker.startPage -1}">Previous</a>
					</li>
				</c:if>
				
				<!-- 바로가기 번호 출력 -->
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':''}"><!-- 참이면 'active'클래스명 추가 거짓이면 '' -->
					<a href="${num}">${num}</a>
				</li>
				</c:forEach>
				
				
				<c:if test="${pageMaker.next}">
					<li class="paginate_button next">
						<a href="${pageMaker.endPage +1}">Next</a>
					</li>
				</c:if>
			</ul>
			</div>
			</div>
		</div>
	</body>
</html>