<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	
	
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
						<c:when test="${not empty list}" >
							<c:forEach var="list" items="${list}" varStatus="status">
								<tr class="text-center" data-num="${list.i_num}">
									<td>${list.i_parts}</td>
									<td class="goDetail text-left over">
										${list.i_name}
										<%-- <c:if test="${board.r_cnt > 0}">
											<span class="reply_count">[${board.r_cnt }]</span>
										</c:if> --%>
									</td>
									<td class="text-left">${list.i_price}</td>
									<td class="text-center">${list.i_quan}</td>
									<td>
										<c:if test="${not empty list.i_img}">
											<img src="${list.i_img }" />
										</c:if>
										<c:if test="${empty list.i_img}">
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