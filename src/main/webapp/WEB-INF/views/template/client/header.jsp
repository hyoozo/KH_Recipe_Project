<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ page trimDirectiveWhitespaces="true" %>


                <header class="header-container">
                    <div class="header-img">
                        <div class="center">
                            <h1>냉장고 레시피</h1>
                        </div>
                    </div>
                    <div class="nav">
                        <div class="center">
                            <ul>
                                <li><a href="/">홈</a></li>
                                <c:if test="${login == null}">
                                    <li><a href="/member/loginForm">냉장고관리</a></li>
                                </c:if>
                                <c:if test="${login != null}">
                                    <li><a href="/refrigerator/refrigeratorView">냉장고관리</a></li>
                                </c:if>
                                <!--  <li><a href="/refrigerator/refrigeratorView">냉장고관리</a></li> -->
                                <li><a href="/store/itemsList">스토어</a></li>
                                <li><a href="/recipe/recipeList">레시피</a></li>
                                <li><a href="/community/postList">커뮤니티</a></li>

                            </ul>
                            <ul>
                                <li>
                                    <a href="/bascket/bascketList">
                                        <img style="width: 40px; height: 40px;" src="/resources/image/bascket.png" />
                                    </a>
                                </li>
                                <c:if test="${login == null}">
                                    <li><a href="/member/joinForm">회원가입</a></li>
                                    <li><a href="/member/loginForm">로그인</a></li>
                                </c:if>
                                <c:if test="${login != null}">
                                    <li><a href="/member/myPage">${login.m_name}님 마이페이지</a></li>
                                    <li><a href="/member/logout">로그아웃</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </header>