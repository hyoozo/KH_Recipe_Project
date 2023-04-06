<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		
		<link rel="shortcut icon" href="/resources/images/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/image/icon.png" />
		<link rel="stylesheet" type="text/css" href="/resources/include/css/admin.css"/>
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
      	<script type="text/javascript" src="/resources/include/js/common.js"></script>
      	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      	<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
      	<script type="text/javascript" src="/resources/include/dist/js/cookie.js"></script>
 	
 		<style>
 			.num{
				display:none;
			}
			#searchForm, #registerForm{
				text-align: right;
				margin: 0px 0px 20px 0px;
			}
 		</style>
		
		<script type="text/javascript">
			$(function(){
				
				$("#keyword").bind("keydown", function(event){
					if(event.keyCode == 13) {
						event.preventDefault();
					}
				});
				
				$("#keyword").click(function(){
					if($("#search").val() == 'all'){
						alert("검색어를 입력할 수 없습니다.");
					}
				});
				
				$("#search").change(function(){
					searchAll();
					
					//console.log($(this).val());
					
					if($(this).val() == 'i_parts'){
						$("#keyword").remove();
						
						let $select = $("<select id='keyword' name='keyword' class='form-control'>");
						
						let $option1 = $("<option value='가전제품'>가전제품</option>");
						let $option2 = $("<option value='간편식·조리식품'>간편식·조리식품</option>");
						let $option3 = $("<option value='그릇·컵'>그릇·컵</option>");
						let $option4 = $("<option value='수산·해산·건어물'>수산·해산·건어물</option>");
						let $option5 = $("<option value='욕실·세제·청소'>욕실·세제·청소</option>");
						
						$select.append($option1).append($option2).append($option3).append($option4).append($option5);
						
						$("#keyInput").append($select);
					} else if($(this).val() == 'i_name'){
						$("#keyword").remove();
						
						let $input = $("<input type='text' class='form-control' id='keyword'>");
						
						$("#keyInput").append($input);
						
						$("#keyword").val("");
						$("#keyword").focus();
					}
				});
				
				$("#searchBtn").click(function(){
					
					if($("#search").val() != "all"){
						if(!chkData("#keyword", "검색어")) return;
					}
					
					$("#itemsList").html("");
					
					pageNum = 1;
					search = $("#search").val();
					keyword = $("#keyword").val();
					
					location.href="/admin/store/itemsList?=pageNum="+pageNum+"&search="+search+"&keyword="+keyword;
				});
				
				$(".paginate_button a").click(function(e) {
					e.preventDefault();/* a태그는 원래 클릭하면 이동하는 기능이 있잖아 그 기능을 해제하고! */
					$("#f_item").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
				
				function goPage(){
					
					$("#f_item").attr({
						"method" : "get",
						"action" : "/admin/store/itemsList"
					});
					$("#f_item").submit();
				}
				
				function searchAll(){
					$("#keyword").val("");
					if($("#search").val() == "all"){
						$("#keyword").prop('readonly', true);
					} else {
						$("#keyword").prop('readonly', false);
					}
				}
				searchAll();
				
				$(".update").click(function(){
					let i_num = $(this).parent().parent().children(".i_num").children(".num").html();
					console.log(i_num);
					location.href="/admin/store/updateForm?i_num="+i_num;
				});
				
				$(".delete").click(function(){
					let i_num = $(this).parent().parent().children(".i_num").children(".num").html();
					let i_img = $(this).parent().parent().children(".i_img").html();
					$.ajax({
						url: "/admin/store/deleteItem",
						type: "get",
						data : {
							i_num: i_num,
							i_img: i_img
						},
						dataType: "text",
						success: function(data) {
							if(data=='성공'){
								alert("삭제 처리 했습니다.");
								location.href="/admin/store/itemsList";
							} else {
								alert("삭제 처리하지 못했습니다.");
							}
						}
					})
				});
				
			});
		</script>
	</head>
	<body>
		<div class="container">
			<h2>제품 관리</h2>
			<hr>
			
			<form id="f_item">
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}"/>
				<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
			</form>
			
			<c:choose>
				<c:when test="${not empty adminLogin }">
					<div id="searchForm">
			      		<form id="searchItems" class="form-inline">
						  <div class="form-group">
						  	<div class="col-md-4">
						  		<select id="search" name="search" class="form-control">
							    	<option value="all">전체</option>
							    	<option value="i_name">제품명</option>
							    	<option value="i_parts">제품분류</option>
							    </select>
						  	</div>
						  	<div class="col-md-4" id="keyInput">
						  		<input type="text" class="form-control" id="keyword">
						  	</div>
						  	<div class="col-md-4">
						  		<button type="button" class="btn btn-default" id="searchBtn">검색</button>
						  	</div>
						  </div>
						</form>
			      	</div>
			      	
			      	<div id="registerForm">
			      		<button type="button" class="btn btn-primary" onclick="location.href='/admin/store/insertForm'">제품 등록</button>
			      	</div>
			      	
					<div id="itemsList">
						<table class="table table-striped">
							<thead>
								<tr>
									<th class="text-center">번호</th>
									<th class="text-center">제품명</th>
									<th class="text-center">제품 분류</th>
									<th class="text-center">제품 가격</th>
									<th class="text-center">재고량</th>
									<th class="text-center">수정</th>
									<th class="text-center">삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty items }">
										<c:forEach var="list" items="${items }">
											<tr class="text-center">
												<td style="display:none;" class="i_img">${list.i_img }</td>
												<td class="i_num">
													<span class="num">${list.i_num}</span>
													<span class="rnum">${list.rnum}</span>
												</td>
												<td>
													${list.i_name}
												</td>
												<td>${list.i_parts}</td>
												<td class="price">${list.i_price}</td>
												<td>${list.i_quan }</td>
												<td>
													<button type="button" class="update">수정</button>
												</td>
												<td>
													<button type="button" class="delete">삭제</button>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="7" class="text-center">
												<p>제품이 없습니다.</p>
												<p>
													<button type="button" id="addItem">제품 추가</button>
												</p>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<%-- =================== 페이징 출력 시작 =============== --%>
						<div class="text-center">
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
								
								<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인. -->
								<c:if test="${pageMaker.next}">
									<li class="paginate_button next">
										<a href="${pageMaker.endPage +1}">Next</a>
									</li>
								</c:if>
							</ul>
						</div>
						<%-- ================== 페이징 출력 종료 ================ --%>
					</div>
				</c:when>
				<c:otherwise>
					<div class="text-center">
						<p>
							로그인 후 이용 가능한 서비스 입니다. 
						</p>
						<button type="button" class="btn btn-primary" onclick="location.href='/admin/loginForm'">로그인 페이지 이동</button>
					</div>
				</c:otherwise>
				
			</c:choose>
		</div>
	</body>
</html>