<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 	<link href="/resources/include/css/fridge-1.css" rel="stylesheet">
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/ccd4ff9cee.js" crossorigin="anonymous"></script>
</head>
<body>
     
	<h2>${login.m_name}의 냉장고</h2>
		<section class="refrigerator-container center">
		    <div class="refrigerator-card">
		        <h3>나의 냉장고</h3>
		        <div class="content-container">
		        
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
		        </div>
		    </div>
		    
		</section>
		 <script type="text/javascript" src="/resources/include/js/fridge-2.js"></script>
	</body>
</html>