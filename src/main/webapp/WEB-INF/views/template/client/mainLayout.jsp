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

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="/resources/include/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script src="/resources/include/js/jquery-1.12.4.min.js"></script>
  </head>

  <body>


	<!-- Begin page content -->
    <div id="app">
	    <!-- Fixed navbar -->
        <header class="header-container">
    		<tiles:insertAttribute name="header"/>
        </header>

        <main class="wrapper">
            <section class="section-1 center">
                <div></div>
                <div></div>
                <div></div>
                <div></div>
            </section>
        </main>
        
    </div>

	<!-- Fixed footer -->
    <footer class="footer-container">
		<tiles:insertAttribute name="footer"/>
    </footer>
    
  </body>
</html>