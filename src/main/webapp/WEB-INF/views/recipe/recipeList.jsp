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
			updateLikeCount();
			
			// 페이징처리
			/*$(".paginate_button a").click(function(e) {
				e.preventDefault();
				$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
				goPage();
			});*/
			
			// 무한스크롤
			let pageNum=2;
			
			$(window).scroll(function(){
				let scrollTop = $(window).scrollTop();
				let windowHeight = $(window).height();
				let documentHeight = $(document).height();
				let isBottom = scrollTop + windowHeight + 10 >= documentHeight;
				
				if(isBottom) {
					console.log($("#keyword").val());
					$.ajax({
						url : "/recipe/scroll",
						type : "get",
						data : {
							"pageNum" : pageNum,
							"search" : $('#search').val(),
							"keyword" : $('#keyword').val(),
						},
						error : function(){
							alert('시스템 오류. 관리자에게 문의하세요.');
						},
						success : function(data){
							//console.log(data);
							appendRecipeList(data);
							updateLikeCount();
							pageNum++;
							console.log(pageNum);
							
							if (data.length === 0) {
						        $(window).off('scroll'); // 더이상 받아온 데이터가 없으면 스크롤 이벤트 제거.
						        return;
						    }
						 }
					});
				}
			})
			
			// 검색
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
			
			$(document).on("click", ".recipeImg", function() { // 동적 쿼리를 통해 리스트 가져와서 $(".recipeImg").click(function(){}) 에서 변경
				let rcp_seq = $(this).parents(".recipeList").attr("data-num");
				console.log(rcp_seq);
				$("#rcp_seq").val(rcp_seq);

				$("#detailForm").attr({
				  "method" : "get",
				  "action" : "/recipe/recipeDetail"
				});
				$("#detailForm").submit();
			});
			
		}); // $ 종료
		
		var search = "";
		var keyword = "";
		
		
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
		
		function updateLikeCount() {
		    let rcp_seq_arr = [];
		    $(".recipeList").each(function(){
		        rcp_seq_arr.push($(this).attr("data-num"));
		    });
		    
		    $.ajax({
		        url :"/recipe/likeCnt",
		        type : "POST",
		        data : JSON.stringify(rcp_seq_arr),
		        contentType: "application/json",
		        error : function(){
		            alert('시스템 오류. 관리자에게 문의하세요.');
		        },
		        success : function(data){
		            for(let i=0; i<data.length; i++){
		                let rcp_seq = rcp_seq_arr[i];
		                let likeCnt = data[i];
		                $(".recipeList[data-num='" + rcp_seq + "'] .likeCnt").html(likeCnt);
		            }
		        }
		    });
		}

		
		function appendRecipeList(data) {
			  let html = "";
			  $.each(data, function(idx, recipe) {
			    html += '<div class="recipeList" data-num="' + recipe.rcp_seq + '">';
			    html += '<div>';
			    html += '<div class="image-box">';
			    html += '<img src="' + recipe.att_file_no_mk + '" class="recipeImg" />';
			    html += '</div>';
			    html += '<div>';
			    html += '<h4 class="recipeText name">' + recipe.rcp_nm + '</h4>';
			    html += '<p class="recipeText kcal">' + recipe.info_eng + ' kcal<img src="/resources/image/heart.png" class="sl"/><span class="likeCnt"></span></p>';
			    html += '</div>';
			    html += '</div>';
			    html += '</div>';
			  });
			  $(".recipeListContainer").append(html);
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
					<div class="from-group">
						<label>검색조건</label>
						<select id="search" name="search" class="form-control">
								<option value="all">전제</option>
								<option value="rcp_nm">메뉴명</option>
								<option value="info_eng">칼로리</option>
						</select>
						<input type="text" name="keyword" id="keyword" class="form-control" value="전체 레시피를 조회합니다." />
						<button type="button" id="searchData" class="btn btn-success">검색</button>
					</div>
				</form>
			</div>
			
			
			
			<%-- 리스트 --%>
			<div class="recipeListContainer">
			<c:choose>
				<c:when test="${not empty recipeList}">
					<c:forEach var="recipe" items="${recipeList}" varStatus="status">
						<div class="recipeList" data-num="${recipe.rcp_seq}">
							<div>
								<div class="image-box">
									<c:if test="${fn:contains(recipe.att_file_no_mk, 'foodsafetykorea')}">
										<img src="${recipe.att_file_no_mk}" class="recipeImg"/>
									</c:if>
									<c:if test="${not fn:contains(recipe.att_file_no_mk, 'foodsafetykorea')}">
										<img src="/resources/recipe/${recipe.att_file_no_mk}"  class="recipeImg"/>
									</c:if>
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
			</div>
			
			<%--
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
			</div> --%>
			
		</div>
	</body>
</html>