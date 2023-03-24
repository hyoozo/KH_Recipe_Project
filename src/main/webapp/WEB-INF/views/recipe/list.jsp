<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<script type="text/javascript">
		$(function(){
			$("#search").click(function(){
				$("#searchRecipe").attr({
					"method": "get",
					"action": "/recipe/list"
				});
				
				$("#searchRecipe").submit();
			});
		});
	</script>
   </head>
   <body>
      <div class="contentContainer container">
      
      	<form id="searchRecipe">
      		<input type="text" name="ingred1"/>
      		<input type="text" name="ingred2"/>
      		<input type="text" name="ingred3"/>
      		<button type="button" id="search">검색</button>
      	</form>
      	
      	<div id="boardList" class="table-height">
			<table summary="레시피 리스트" class="table table-striped" >
				<thead>
					<tr>
						<th data-value="rcp_seq" class="order text-center col-md-1" >번호</th>
						<th class="text-center col-md-4">레시피명</th>
						<th data-value="b_date" class="order col-md-1">요리종류</th>
						<th class="text-center col-md-2">칼로리</th>
						<th class="text-center col-md-3">이미지</th>
					</tr>
				</thead>
		 		<tbody id="list" class="table-striped" >
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty recipe}" >
							<c:forEach var="rvo" items="${recipe}" varStatus="status">
								<tr class="text-center" data-num="${rvo.rcp_seq}">
									<td>${rvo.rcp_seq}</td>
									<td class="goDetail text-left over">
										${rvo.rcp_nm}
										<%-- <c:if test="${board.r_cnt > 0}">
											<span class="reply_count">[${board.r_cnt }]</span>
										</c:if> --%>
									</td>
									<td class="text-left">${rvo.rcp_pat2}</td>
									<td class="text-center">${rvo.info_eng}</td>
									<td>
										<c:if test="${not empty rvo.att_file_no_mk}">
											<img src="${rvo.att_file_no_mk }" />
										</c:if>
										<c:if test="${empty rvo.att_file_no_mk}">
											<img src="/resources/static/images/common/noimage.png" />
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6" class="tac text-center">등록된 게시글이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody> 
			</table>
		</div>
      </div>
   </body>
</html>