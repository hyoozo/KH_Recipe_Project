<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>냉장고리스트 관리자 페이지</title>
        <link href="/resources/include/dist/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <style type="text/css">
        	a{color: #000; text-decoration: none; outline: none}
			a:hover, a:active {text-decoration: none; color:#000;}
        	#logout{
				border: 1px solid skyblue;
				color: white;
				font:bold 12px tahoma;
				font-size: 18px;
				border:1px solid #eee;
				text-decoration:none;
				padding: 5px;
				border-radius: 5px;
			}
			#logout:hover{
				color:white;
				color:#fff;
				border:1px solid #f40;
				background-color:#f40;
			}
			#managerInfo{
				color:white;
			}
			
        </style>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">냉장고 레시피</a>
            <div id="managerInfo">
            <c:choose>
            	<c:when test="${adminLogin.mng_lev eq '마스터'}">
            		[${adminLogin.mng_name}]<small>관리자님 반갑습니다. ${adminLogin.mng_lev}등급 관리자이므로 관리자 추가/삭제 가능</small>
            	</c:when>
            <c:otherwise>
            	[${adminLogin.mng_name}]<small>관리자님 반갑습니다. ${adminLogin.mng_lev}등급 관리자이므로 관리자 추가/삭제 불가</small>
            </c:otherwise>
            </c:choose>
            <a href="/admin/logout" id="logout" role="button">로그아웃</a>
			</div>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-light" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">관리자 메뉴</div>
                            <a class="nav-link" href="/admin/admin/adminList">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                관리자 관리
                            </a>
                            <a class="nav-link" href="/admin/user/userList">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                회원 관리
                            </a>
                            <a class="nav-link" href="/admin/recipe/recipeList">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                레시피 관리
                            </a>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                스토어 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/admin/store/itemsList">제품 관리</a>
                                    <a class="nav-link" href="/admin/store/statistics/chart">통계</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                커뮤니티 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                    	<a class="nav-link" href="layout-static.html">게시글 관리</a>
                                    	<a class="nav-link" href="layout-sidenav-light.html">관리자</a>
                                    	<a class="nav-link" href="layout-sidenav-light.html">사용자</a>
                               		</nav>
                                </nav>
                            </div>
                            
                        </div>
                    </div>
                   
                </nav>
            </div>
            
            <!-- body -->
            <div id="layoutSidenav_content">
                
                <tiles:insertAttribute name="main" />
                
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright <a href="/">&copy;</a> Your Website 2023</div>
                            <div>
                               Privacy Policy
                                &middot;
                                Terms &amp; Conditions
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </body>
</html>
