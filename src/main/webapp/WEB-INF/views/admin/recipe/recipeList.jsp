<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<script type="text/javascript" src="/resources/include/js/jquery-3.6.3.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	
	<style type="text/css">
		h2{
			margin: 100px 0px 50px 450px;
			
		}
		.textright{
			text-align: right;
			margin: 0px 0px 10px 0px;
		}
		#keyword{
			width: 250px;
		}
		#insertSpace{
			text-align: right;
			margin: 0px 0px 20px 0px;
		}
		.recipeImg{
			width: 220px;
			height: 220px;
		}
		div.tc{
			margin: 30px 0px 30px 340px;
		}
		.detail{
			background-color: blue;
		}
		ul li a{
			padding: 4px;
			margin-right:3px;
			margin-right:3px;
			width:15px;
			color:#000;
			font:bold 12px tahoma;
			font-size: 18px;
			border:1px solid #eee;
			text-align:center;
			text-decoration:none;
		}
		ul li a:hover, ul li a:focus {
			color:#fff;
			border:1px solid #f40;
			background-color:#f40;
		}
		.detail{
			 border: 1px solid skyblue;
			 color:#000;
			 font:bold 12px tahoma;
			 font-size: 18px;
			 border:1px solid #eee;
			 text-decoration:none;
			 padding: 5px;
			 border-radius: 5px;
		}
		.detail:hover{
			color:white;
			color:#fff;
			border:1px solid #f40;
			background-color:#f40;
		}
		.issc{
			border: 1px solid skyblue;
			color:#000;
			font:bold 12px tahoma;
			font-size: 18px;
			border:1px solid #eee;
			text-decoration:none;
			padding: 5px;
			border-radius: 5px;
		}
		.issc:hover{
			color:white;
			color:#fff;
			border:1px solid #f40;
			background-color:#f40;
		}
	</style>
	
	<script type="text/javascript">
		$(function(){
			$(".paginate_button a").click(function(e) {
				 e.preventDefault();
				 $("#r_search").find("input[name='pageNum']").val($(this).attr("href"));
				 goPage();
			});
			
			let word="<c:out value='${recipeVO.keyword}' />";
			let value="";
			if(word!=""){
				$("#keyword").val("<c:out value='${recipeVO.keyword}' />");
				$("#search").val("<c:out value='${recipeVO.search}' />");
				
				if($("#search").val()=='rcp_nm'){
					value=".table tbody tr td.name"
					console.log($(value+":contains('"+word+"')").html());
					$(value+":contains('"+word+"')").each(function(){
						let regex = new RegExp(word,'gi');
						$(this).html($(this).html().replace(regex, "<span class='required'>"+word+"</span>"));
					});
				}
			}
			
			$("#keyword").bind("keydown", function(event){
				if(event.keyCode == 13) {
					event.preventDefault();
				}
			});
			
			$("#search").change(function(){
				if($("#search").val()=="all") {
					$("#keyword").val("전체 레시피를 조회합니다.");
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
			
			$("#insertRecipe").click(function(){
				location.href="/admin/recipe/InsertForm"
			});
			
			$(".detail").click(function(){
				let rcp_seq = $(this).parents("tr").attr("data-num");
				$("#rcp_seq").val(rcp_seq);
				//console.log("레시피 번호 : " + rcp_seq);
				$("#detailForm").attr({
					"method" : "get",
					"action" : "/admin/recipe/recipeDetail"
				});
				$("#detailForm").submit();
			});
		}) // $종료
	
	
	
		function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			
			$("#r_search").attr({
				"method" : "get",
				"action" : "/admin/recipe/recipeList"
			});
			$("#r_search").submit();
		}
	</script>
	</head>
	<body>
		<div class="contentContainer container">
			<h2>레시피 리스트</h2>
			<form id="detailForm">
				<input type="hidden" id="rcp_seq" name="rcp_seq" />	
			</form>
			<%-- 검색기능 --%>
			<div id="recipeSearch">
				<form id="r_search" name="r_search" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
					<div class="textright">
						<label>검색조건</label>
						<select id="search" name="search">
							<option value="all">전체</option>
							<option value="rcp_nm">메뉴명</option>
						</select>
						<input type="text" name="keyword" id="keyword" value="전체 레시피를 조회합니다."/>
						<button type="button" id="searchData" class="issc">검색</button>
					</div>
				</form>
			</div>
			<div id="insertSpace">
				<button type="button" id="insertRecipe" class="issc">레시피등록</button>
			</div>
			
			<%-- 레시피 리스트 --%>
			<div id="recipeList">
				<table summary="레시피 리스트" class="table">
					<colgroup>
						<col style="width:10%">
						<col style="width:30%">
						<col style="width:20%">
						<col style="width:10%">
						<col style="width:30%">
					</colgroup>
					<thead>
						<tr>
							<th>레시피 번호</th>
							<th>메뉴명</th>
							<th>요리구분</th>
							<th>칼로리</th>
							<th>이미지</th>
						</tr>
					</thead>
					<tbody id="list" class="table">
						<!-- 레시피 출력 -->
						<c:choose>
							<c:when test="${not empty recipeList}">
								<c:forEach var="recipe" items="${recipeList}" varStatus="status">
									<tr data-num="${recipe.rcp_seq}">
										<td>${recipe.rcp_seq}</td>
										<td class="name">${recipe.rcp_nm}</td>
										<td>${recipe.rcp_pat2}</td>
										<td>${recipe.info_eng} kcal</td>
										<td>
											<c:if test="${fn:contains(recipe.att_file_no_mk, 'foodsafetykorea')}">
												<img src="${recipe.att_file_no_mk}" class="recipeImg"/>
												<input type="button" value="상세정보" class="detail" />
											</c:if>
											<c:if test="${not fn:contains(recipe.att_file_no_mk, 'foodsafetykorea')}">
												<img src="/resources/recipe/${recipe.att_file_no_mk}" class="recipeImg"/>
												<input type="button" value="상세정보" class="detail" />
											</c:if>
										</td>
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
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous">
							<a href="${pageMaker.startPage -1}">Previous</a>
						</li>
					</c:if>
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
	</body>
</html>