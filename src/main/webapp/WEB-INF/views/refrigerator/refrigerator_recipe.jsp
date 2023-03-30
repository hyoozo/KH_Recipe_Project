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
<%-- 	<form name="f_data" id="f_data">
		<input type="hidden" name="listIgrNum" id="listIgrNum" value="${detail.listIgrNum}"/>
	</form> --%>
     
	<h2>${login.m_name}의 냉장고</h2>
		<section class="refrigerator-container center">
		    <div class="refrigerator-card">
		    
			    <section class="food-card">
	     			<img class="food-img" src="">
			      	<div class="food-content">
			      		<h3><a href=""></a></h3>
		      		</div>
		      		<div class="food-card-bg"></div>
		      	</section>
		      	
		      </div>
	      </section>
		 <script type="text/javascript" src="/resources/include/js/fridge-2.js"></script>
	</body>
</html>