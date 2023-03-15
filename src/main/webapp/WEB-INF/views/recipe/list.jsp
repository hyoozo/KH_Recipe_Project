<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
   <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      <title>레시피 리스트</title>
      
      <link rel="shortcut icon" href="/resources/static/image/icon.png" />
      <link rel="apple-touch-icon" href="/resources/static/image/icon.png" />
      
      <!--[if lt IE 9]>
      <script src="../js/html5shiv.js"></script>
      <![endif]-->
   </head>
   <body>
      <div class="contentContainer container">
      	<div>
      		<a href="/recipe/insert">DB저장</a>
      	</div>
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
						<c:when test="${not empty rvo}" >
							<c:forEach var="rvo" items="${rvo}" varStatus="status">
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