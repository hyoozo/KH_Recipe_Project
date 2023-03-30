<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 	<link href="/resources/include/css/fridge-1.css" rel="stylesheet">
 	<link href="/resources/include/css/fridge-2.css" rel="stylesheet">
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/ccd4ff9cee.js" crossorigin="anonymous"></script>
</head>
<body>
	<form name="f_data" id="f_data">
		<input type="hidden" name="listIgrNum" id="listIgrNum" value="${detail.listIgrNum}"/>
	</form>
     
	<h2>${login.m_name}의 냉장고</h2>
		<section class="refrigerator-container center">
		    <div class="refrigerator-card">
		    
			    <section class="food-card">
	     			<img src="/resources/image/heart.png">
			      	<div class="food-content">
			      		<h3><a href="/recipe/recipeDetail?rcp_seq=677">민어매운탕</a></h3>
		      		</div>
		      		<div class="food-card-bg"></div>
		      	</section>
	       		<c:choose>
					<c:when test="${!empty list}" > --%>
			     		<c:forEach var="list" items="${list}">
					      	 <section class="food-card">
				     			<img src="${list.att_file_no_mk}">
						      	<div class="food-content">
						      		<h3><a href="/recipe/recipeDetail?rcp_seq=${list.rcp_seq}">${list.rcp_nm }</a></h3>
					      		</div>
					      		<div class="food-card-bg"></div>
					      	</section>
				      	</c:forEach>
			      		</c:when>
			      	<c:otherwise>
						<p>추천하는 레시피가 없습니다.</p>		
					</c:otherwise>
		      	</c:choose>
		
		    </div>
		    
		</section>
		 <script type="text/javascript" src="/resources/include/js/fridge-2.js"></script>
	</body>
</html>