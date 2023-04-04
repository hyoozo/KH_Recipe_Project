<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery-3.6.3.min.js"></script>
	<link href="/resources/include/css/AdminMemberList.css" rel="stylesheet">

<script type="text/javascript">
	$(function(){
		
		let word="<c:out value='${memberVO.keyword}' />";
		let value="";
		if(word!=""){
			$("#keyword").val("<c:out value='${memberVO.keyword}' />");
			$("#search").val("<c:out value='${memberVO.search}' />");
			
			if($("#search").val()=='m_name') {
				value = ".table tbody tr td.name";
			} else if ($("#search").val()=='m_id') {
				value = ".table tbody tr td.id";
			} else if ($("#search").val()=='m_email') value = ".table tbody tr td.email";
			
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
				$("#keyword").val("전체 회원을 조회합니다.");
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
		
		$(".deleteBtn").click(function(){
			if(confirm("해당 회원을 삭제하시겠습니까?\n삭제한 회원은 복구할 수 없습니다.")){
				let m_num = $(this).parents("tr").attr("data-num");
				$("#m_num").val(m_num);
				$("#deleteMember").attr({
					"method" : "get",
					"action" : "/admin/user/userDelete"
				});
				$("#deleteMember").submit();
			}
		})
		
	}); // $ 종료
	
	function goPage(){
		if($("#search").val()=="all"){
			$("#keyword").val("");
		}
		
		$("#m_search").attr({
			"method" : "get",
			"action" : "/admin/user/userList"
		});
		$("#m_search").submit();
	}
</script>
	</head>
	<body>
		<div class="contentContainer container">
			<h3>회원 계정 관리</h3>
			<form id="deleteMember">
				<input type="hidden" id="m_num" name="m_num" />
			</form>
			<div id="wrapper2">
			<div id="recipeSearch">
				<form id="m_search" name="m_search" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
					<div class="textright">
						<label>검색조건</label>
						<select id="search" name="search">
							<option value="all">전체</option>
							<option value="m_name">회원명</option>
							<option value="m_id">아이디</option>
							<option value="m_email">이메일</option>
						</select>
						<input type="text" name="keyword" id="keyword" value="전체 회원을 조회합니다."/>
						<button type="button" id="searchData" class="issc">검색</button>
					</div>
				</form>
			</div>
			
			<%-- 회원 리스트 --%>
			<div id="memberList">
				<table summary="회원 리스트" class="table">
					<colgroup>
						<col style="width:8%">
						<col style="width:12%">
						<col style="width:15%">
						<col style="width:35%">
						<col style="width:15%">
						<col style="width:15%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>아이디</th>
							<th>이메일</th>
							<th>등록일</th>
							<th>회원삭제</th>
						</tr>
					</thead>
					<tbody id="list">
						<c:choose>
							<c:when test="${not empty memberList}" >
								<c:forEach var="member" items="${memberList}" varStatus="status">
									<tr data-num="${member.m_num}">
										<td>${member.m_num}</td>
										<td class="name">${member.m_name}</td>
										<td class="id">${member.m_id}</td>
										<td class="email">${member.m_email}</td>
										<td>${member.m_reg_day}</td>
										<td><input type="button" class="deleteBtn issc" value="삭제"/></td>
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