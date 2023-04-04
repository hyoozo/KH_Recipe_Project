<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title> <tiles:getAsString name="title"/> </title>
    <!-- Custom styles for this template -->
    <link href="/resources/include/css/index.css" rel="stylesheet">
    <link href="/resources/include/css/mainLayout-1.css" rel="stylesheet">
    <script src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<!-- fontawesome -->
    <script src="https://kit.fontawesome.com/ccd4ff9cee.js" crossorigin="anonymous"></script>
    	 <script>
			$(function(){
				$('#keyword').bind("keydown", function (event) {
					if(event.keyCode == 13){
						event.preventDefault();
						console.log("!");
						searcfn();
					}
				});
				
				function searcfn(){		
					$("#f_search").attr({
						"method" : "get",
						"action" : "/recipe/recipeList"
					});
					$("#f_search").submit();
				}
			})
        </script>
  </head>
  <body>
    <div id="app">
        <header class="header-container">
    		<tiles:insertAttribute name="header"/>
        </header>
        <main class="wrapper">
        	 <section class="center">
        	 	<div class="title-box">
        	 		<h1>레시피</h1>
        	 		<p>"매일 즐거운 요리를 함께해요"
	        	 		<br><br>
     					<span>"냉장고 재료로 매일 새로운 요리에 도전하다"</span>  	 		
        	 		</p>
        	 	<div class="v-line"></div>
        	 	</div>
        	 </section>
        </main>
        <section>
             <div class="search-container d-center">
             	<form id="f_search">
             		<input type="hidden" name="search" value="rcp_nm"/>
             		<div class="d-center search-box">
	             		<i class="fa-solid fa-magnifying-glass"></i>
	              		<input class="mainTop-search" name="keyword" id="keyword" placeholder="레시피를 검색하세요." />
	             	</div>
             	</form>
           	</div>
        </section>
         <section class="info-t d-center ">
         	<p class="">냉장고를 알차게 사용하는 방법 !</p>
         </section>
        <section class="center d-center info-container">
        	<div class="info-box">
        		<p> 회원가입 후 <br> 냉장고 관리탭을 클릭 </p>
        	</div>
        	<i class="fa-solid fa-angles-right" style="color: #000000;"></i>
        	<div class="info-box">
        		<p> 나의 냉장고에<br> 재료 담기</p>
        	</div>
        	<i class="fa-solid fa-angles-right" style="color: #000000;"></i>
        	<div class="info-box">
        		<p> 재료에 알맞는<br> 레시피 추천 받기</p>
        	</div>
        </section>
    </div>
    <footer class="footer-container">
		<tiles:insertAttribute name="footer"/>
    </footer>
  </body>
</html>