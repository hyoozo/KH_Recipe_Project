<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
	<script type="text/javascript" src="/resources/include/js/jquery-3.6.3.min.js"></script>
	<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript" src="/resources/include/dist/js/cookie.js"></script>
	<link href="/resources/include/css/index.css" rel="stylesheet">
	<style type="text/css">
		.recipeList{
			display: inline-block;
			width: 370px;
			height: 500px;
			margin: 2px;
			overflow: hidden;
		}
		
		.image-box{
			width:380px;
			height:370px;
			overflow: hidden;
			margin:0 auto;
		}
		
		.recipeImg{
			display: inline-block;
			width: 368px;
			height: 100%;
			overflow: hidden;
			object-fit: cover;
			border-radius: 5px;
			cursor: pointer;
		}
		
		.from-group{
			margin: 0px 0px 20px 0px;
		}
		
		.recipeText {
			display: flex;
			align-items: center;
		}
		.sl{
			width:30px;
			margin-left: 220px;
		}
		

	</style>
	
	<script type="text/javascript">
		$(function(){
			let rcp_seq_arr = [];
			$(".recipeList").each(function(){
				rcp_seq_arr.push($(this).attr("data-num"));
			}); // 1페이지의 12개 레시피 번호를 배열로 저장.
			
			$.ajax({
				url :"/recipe/likeCnt",
				type : "POST",
				data : JSON.stringify(rcp_seq_arr), // 서버에 전송하는 속성 객체
				contentType: "application/json",	// json형식으로 보냄
				error : function(){
					alert('시스템 오류. 관리자에게 문의하세요.');
				},
				success : function(data){
					//console.log(data);
					for(let i=0; i<data.length; i++){	// 12개의 좋아요 개수를 가져옴
						let rcp_seq = rcp_seq_arr[i];	// 12개의 레시피 번호를 0인덱스부터 11인덱스까지 순차적으로 대입.
						let likeCnt = data[i];			// 12개의 좋아요 개수를 서버로부터 배열로 받아와 0인덱스부터 11인덱스까지 순차적으로 대입.
						$(".recipeList[data-num='" + rcp_seq + "'] .likeCnt").html(likeCnt);	// ex) rcp_seq[0~11]번 레시피 번호를 가진요소중 likeCnt class를 찾아 data[0~11]을 대입.
					}
						
					}
				})
			
			$(".paginate_button a").click(function(e) {
				e.preventDefault();
				$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
				goPage();
			});
			
			let word="<c:out value='${recipeVO.keyword}' />";
			let value="";
			
			if(word!=""){
				$("#keyword").val("<c:out value='${recipeVO.keyword}' />");
				$("#search").val("<c:out value='${recipeVO.search}' />");
			
				if($("#search").val()=='rcp_nm') {
					value = ".recipeList div div h4.name";
				} else if ($("#search").val()=='info_eng') value = ".recipeList div div p.kcal";
				
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
			
			$(".recipeImg").click(function(){
				let rcp_seq = $(this).parents(".recipeList").attr("data-num");
				console.log(rcp_seq);
				$("#rcp_seq").val(rcp_seq);
				
				$("#detailForm").attr({
					"method" : "get",
					"action" : "/recipe/recipeDetail"
				});
				$("#detailForm").submit();
			})
			
		}); // $ 종료
		
		function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			
			$("#f_search").attr({
				"method" : "get",
				"action" : "/recipe/recipeList"
			});
			$("#f_search").submit();
		}
	</script>
	</head>
	<body>
		<h3>냉장고 레시피</h3>
		<div class="contentContainer container">
		
			<form id="detailForm">
				<input type="hidden" id="rcp_seq" name="rcp_seq">
			</form>
			
			<%-- 검색기능 --%>
			<div id="recipeSearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
					<div class="from-group">
						<label>검색조건</label>
						<select id="search" name="search" class="form-control">
								<option value="all">전제</option>
								<option value="rcp_nm">메뉴명</option>
								<option value="info_eng">칼로리</option>
						</select>
						<input type="text" name="keyword" id="keyword" value="전체 레시피를 조회합니다." class="form-control" />
						<button type="button" id="searchData" class="btn btn-success">검색</button>
					</div>
				</form>
			</div>
			
			
			
			<%-- 리스트 --%>
			<c:choose>
				<c:when test="${not empty recipeList}">
					<c:forEach var="recipe" items="${recipeList}" varStatus="status">
						<div class="recipeList" data-num="${recipe.rcp_seq}">
							<div>
								<div class="image-box">
									<img src="${recipe.att_file_no_mk}" class="recipeImg" />
								</div>
								<div>
									<h4 class="recipeText name">${recipe.rcp_nm}</h4>
									<p class="recipeText kcal">${recipe.info_eng} kcal<img src="/resources/image/heart.png" class="sl"/><span class="likeCnt"></span></p>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<p>레시피가 존재하지 않습니다.</p>
				</c:otherwise>
			</c:choose>
			
			<%-- 페이징 처리 --%>
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous">
							<a href="${pageMaker.startPage -1}">Previous</a>
						</li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':''}">
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