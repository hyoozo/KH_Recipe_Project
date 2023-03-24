<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< Updated upstream
 	<link href="/resources/include/css/refrigerator.css" rel="stylesheet">
=======
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 	<link href="/resources/include/css/fridge-1.css" rel="stylesheet">
>>>>>>> Stashed changes
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/ccd4ff9cee.js" crossorigin="anonymous"></script>
</head>
<body>
     
	<h2>이찍쭉의 냉장고</h2>
<<<<<<< Updated upstream
            <section class="refrigerator-container center">
                <div class="refrigerator-card">
                    <h3>나의 냉장고</h3>
                    <div class="content-container">

                    </div>
                </div>
                <div class="refrigerator-card">
                    <h3>재료 리스트</h3>
                    <div class="content-container">
                        <div class="food-container">
                            <div>
                                <input type="checkbox" name="f_name" id="potato" value="감자">
                                <label for="potato">감자</label>
                            </div>
                            <div>
                                <input type="checkbox" name="f_name" id="potato" value="감자">
                                <label for="potato">감자감자감자</label>
                            </div>
                            <div>
                                <input type="checkbox" name="f_name" id="potato" value="감자">
                                <label for="potato">감자</label>
                            </div>
                            <div>
                                <input type="checkbox" name="f_name" id="potato" value="감자">
                                <label for="potato">감자</label>
                            </div>
                            <div>
                                <input type="checkbox" name="f_name" id="potato" value="감자">
                                <label for="potato">감자</label>
                            </div>
                            <div>
                                <input type="checkbox" name="f_name" id="potato" value="감자">
                                <label for="potato">감자감자감자</label>
                            </div>
                            <div>
                                <input type="checkbox" name="f_name" id="potato" value="감자">
                                <label for="potato">감자</label>
                            </div>
                            <div>
                                <input type="checkbox" name="f_name" id="potato" value="감자">
                                <label for="potato">감자감자감자</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="refrigerator-card">
                    <h3>메모장</h3>
                    <div class="content-container">
                        <textarea class="content-memo"></textarea>
                    </div>
                </div>
                <div class="refrigerator-card">
                    <h3>추천 레시피</h3>
                    <div class="content-container">
                        <div class="food-container ">
                            <ul class="content-list">
                                <li><a href="#">감자볶음</a></li>
                                <li><a href="#">감자볶음</a></li>
                                <li><a href="#">감자볶음</a></li>
                                <li><a href="#">감자볶음</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
</body>
=======
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
		        	<!-- <form id="form_search"> -->
			        	<div class="searchBox">
			        		<input id="searchInput" type="text" placeholder="재료를 검색하세요."/>
			        		<button id="searchBtn"></button>
			        	</div>
		        	<!-- </form> -->
		        	
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
			                </ul>
		            	</div>
		            </div>
		        </div>
		    </div>
		    
		</section>
		 <script type="text/javascript" src="/resources/include/js/fridge-1.js"></script>
	</body>
>>>>>>> Stashed changes
</html>