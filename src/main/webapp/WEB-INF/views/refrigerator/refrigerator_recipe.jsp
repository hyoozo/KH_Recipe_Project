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
	<h2>추천 레시피</h2>
		<section class="refrigerator-container center">
		    <div class="refrigerator-card">
		    
			    <section class="food-card" id="food-card">
	     			<img class="food-img" src="">
			      	<div class="food-content">
			      		<h3></h3>
			      		<span class="info_eng"></span>
			      		<span class="info">맛있는 요리 만들러 가기!</span>
		      		</div>
			      	<a><div class="food-card-bg"></div></a>
		      	</section>
		      	
		      </div>
	      </section>
	      <div class="box">
		      <button class="button button--pipaluk button--text-thick button--round-l" id="listBtn"> 냉장고 돌아가기 </button>
	          <button class="button button--pipaluk button--text-thick button--round-l" id="rcpBtn"> 전체 레시피 보기 </button>
	      </div>
		 <script type="text/javascript" src="/resources/include/js/fridge-2.js"></script>
	</body>
</html>