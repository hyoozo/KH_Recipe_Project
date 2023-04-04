<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 	<link href="/resources/include/css/fridge-1.css" rel="stylesheet">
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/ccd4ff9cee.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="/resources/include/js/fridge-1.js"></script>
</head>
<body>
    <input type='hidden' id="sessionId" value="${login.m_num}">
	<h2>${login.m_name}의 냉장고</h2>
		<section class="refrigerator-container center">
			<div class="refrigerator-card">
		        <h3>재료 리스트</h3>
		        <div class="content-container">
			        	<div class="searchBox">
			        		<input onkeyup="filter()" type="text" id="searchInput" type="text" placeholder="재료를 검색하세요."/>
			        		<button id="searchBtn"></button>
			        	</div>
		        	<div class="food-container ingredient-container ">
		        	</div>
        		</div>
		    </div>
		    <div class="refrigerator-card">
		    	<div class="display-Box">
				        <h3 class="h3-Box">나의 냉장고</h3>
		    		<form id="igrForm">
				        <input type="hidden" name="listIgrNum" id="igr_num"/>
				        <input type="button" id="recommedRecipeBtn" value="레시피 추천 받기" onclick="location.href='/refrigerator/recomView';"/>
		    		</form>
		    	</div>
		        <div class="content-container">
		        	<div class="food-container rfg-container pTop">
		        	</div>
       			</div>
		    </div>
		    <div class="refrigerator-card">
		        <h3>메모장</h3>
		        <div class="content-container pBox">
		            <textarea class="content-memo" id="content-memo"></textarea>
		        </div>
		        <div class="memo-bg">
		        	<button id="memoBtn">메모 작성</button>
        		</div>
		    </div>
		</section>
	</body>
</html>