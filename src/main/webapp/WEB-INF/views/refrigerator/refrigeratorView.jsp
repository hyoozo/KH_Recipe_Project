<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 	<!-- <link href="/resources/include/css/fridge.css" rel="stylesheet"> -->
 	<link href="/resources/include/css/fridge-1.css" rel="stylesheet">
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/ccd4ff9cee.js" crossorigin="anonymous"></script>
   <style>
        
    </style>
</head>
<body>
     
	<h2>이찍쭉의 냉장고</h2>
		<section class="refrigerator-container center">
		    <div class="refrigerator-card">
		        <h3>나의 냉장고</h3>
		        <div class="content-container">
		        	<div class="food-container rfg-container pTop">
		        	</div>
       			</div>
		    </div>
		    
		    <div class="refrigerator-card">
		        <h3>재료 리스트</h3>
		        <div class="content-container">
		        	<div class="searchBox">
		        		<input id="searchInput" type="text" placeholder="재료를 검색하세요."/>
		        		<button id="searchBtn"></button>
		        	</div>
		        	<div class="food-container ingredient-container ">
		        		
		        	</div>
        		</div>
		    </div>
		    
		    <div class="refrigerator-card">
		        <h3>메모장</h3>
		        <div class="content-container pTop">
		            <textarea class="content-memo"></textarea>
		        </div>
		    </div>
		    
		    <div class="refrigerator-card">
		        <h3>추천 레시피</h3>
		        <div class="content-container pTop">
		            <div class=" recipeList pTop">
		            	<div class="recipeTemp">
			                <ul id="content-list">
			                    <!-- <li class="li"><a href="#"></a></li> -->
			                </ul>
		            	</div>
		            </div>
		        </div>
		    </div>
		    
		</section>
		 <script type="text/javascript" src="/resources/include/js/fridge-1.js"></script>
	</body>
</html>