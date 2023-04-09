<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<link href="/resources/include/css/index.css" rel="stylesheet">
	<link href="/resources/include/css/clientRecipeList.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/ccd4ff9cee.js" crossorigin="anonymous"></script>
	
	
	
	<script type="text/javascript" src="/resources/include/js/jquery-3.6.3.min.js"></script>
	<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript" src="/resources/include/dist/js/cookie.js"></script>
	
	<script type="text/javascript">
		$(function(){
			/* let rcp_seq_arr = [];
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
				}) */
				updateLikeCount();
			
            let pageNum=2;
			
			$(window).scroll(function(){
				let scrollTop = $(window).scrollTop();
				let windowHeight = $(window).height();
				let documentHeight = $(document).height();
				let isBottom = scrollTop + windowHeight + 10 >= documentHeight;
				
				if(isBottom) {
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
							appendRecipeList(data);
							updateLikeCount();
							pageNum++;
							
							if (data.length === 0) {
						        $(window).off('scroll');
						        return;
						    }
						 }
					});
				}
			})
			
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
			
			$(document).on("click", ".recipeImg", function() {
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
			    html += '<p class="recipeText kcal">' + recipe.info_eng + ' kcal<span class="sl">좋아요</span><span class="likeCnt"></span></p>';
			    html += '</div>';
			    html += '</div>';
			    html += '</div>';
			  });
			  $(".recipeListContainer").append(html);
			}
		
	</script>
	</head>
	<body>
		<h2>냉장고 레시피</h2>
		<div class="contentContainer container">
		
			<form id="detailForm">
				<input type="hidden" id="rcp_seq" name="rcp_seq">
			</form>
			
			<%-- 검색기능 --%>
			<div id="recipeSearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
					<div class="inline-box">
						<select id="search" name="search" class="form-control">
								<option value="all">전제</option>
								<option value="rcp_nm">메뉴명</option>
								<option value="info_eng">칼로리</option>
						</select>
						<input type="text" name="keyword" id="keyword" value="전체 레시피를 조회합니다." class="form-control" />
						<button type="button" id="searchData"></button>
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
									<h3 class="recipeText name">${recipe.rcp_nm}</h3>
									<h4 class="recipeText kcal">${recipe.info_eng} kcal<span class="sl">좋아요</span><span class="likeCnt"></span></h4>
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
		</div>
	</body>
</html>