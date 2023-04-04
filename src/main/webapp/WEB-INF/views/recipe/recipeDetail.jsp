<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
	<script type="text/javascript" src="/resources/include/js/jquery-3.6.3.min.js"></script>
	<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript" src="/resources/include/dist/js/cookie.js"></script>
	<link href="/resources/include/css/clientRecipeDetail.css" rel="stylesheet">
	
	<script type="text/javascript">
	
		function like_up(){
			var m_num = "${login.m_num}"
			var rcp_seq = $(".image-box").attr("data-num");
			var sl = $(".sl");
			let likecheck = "${likecheck}"
			console.log(likecheck);
			console.log("회원번호 : " + m_num + " 레시피 번호 : " + rcp_seq);
			$.ajax({
				url: "/recipe/likeUp",
				type: "get",
				data : "rcp_seq="+rcp_seq+"&m_num="+m_num,
				dataType : "text",
				error : function(){
					alert('시스템 오류. 관리자에게 문의하세요.');
				},
				success: function(data){
					console.log(data);
					if(data == '첫좋아요'){
						  sl.attr("src", "/resources/image/heart.png");
						} else if(data == '좋아요취소'){
						  sl.attr("src", "/resources/image/heart2.png");
						} else if(data == '다시좋아요'){
						  sl.attr("src", "/resources/image/heart.png");
						} else {
						  alert('실패입니다.');
					}
				}
			});
		}
		
		
		function login_need(){
			if(confirm("좋아요는 회원만 등록할 수 있습니다.\n 회원가입창으로 이동하시겠습니까?")){
				location.href="/member/joinForm";
			}else{
				
			}
				
		}
	</script>
	</head>
	<body>
		<h3>${detail.rcp_nm} 만들기</h3>
		<div class="contentContainer container">
			<div class="image-box" data-num="${detail.rcp_seq}">
				<c:if test="${fn:contains(detail.att_file_no_mk, 'foodsafetykorea')}">
					<img src="${detail.att_file_no_mk}" class="image-thumbnail"/>
				</c:if>
				<c:if test="${not fn:contains(detail.att_file_no_mk, 'foodsafetykorea')}">
					<img src="/resources/recipe/${detail.att_file_no_mk}"  class="image-thumbnail"/>
				</c:if>
				<div id="recipenm" class="text-info">${detail.rcp_nm}
					<c:choose>
						<%-- 회원 --%>
						<c:when test="${not empty login}">
							<c:choose>
								<c:when test="${likecheck == 0}">
									<a href="javascript: like_up();"><img src="/resources/image/heart2.png" class="sl"/></a>
								</c:when>
								<c:otherwise>
									<a href="javascript: like_up();"><img src="/resources/image/heart.png" class="sl"/></a>
								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>
					<c:if test="${empty login}">
						<a href="javascript: login_need();"><img src="/resources/image/heart2.png" class="sl"/></a>
					</c:if>
				</div>	
				<p class="text-info">재료 : ${detail.rcp_parts_dtls}</p>
			</div>
			<hr width="99%"/>
			
				<h4>레시피</h4>
				<c:choose>
					<c:when test="${not empty detail}">
						<c:if test="${not empty detail.manual_img01}">
							<article>
								<c:if test="${fn:contains(detail.manual_img01, 'foodsafetykorea')}">
									<img src="${detail.manual_img01}" class="recipe-thumbnail"/>
								</c:if>
								<c:if test="${not fn:contains(detail.manual_img01, 'foodsafetykorea')}">
									<img src="/resources/manual/${detail.manual_img01}"  class="recipe-thumbnail"/>
								</c:if>
							</article>
							<hgroup class="main-articles">
								<h4>&nbsp;&nbsp;Step1</h4>
							</hgroup>
							<hr width="49%"/>
							<hgroup>
								<h5>&nbsp;&nbsp;${detail.manual01}</h5>
							</hgroup>
							<div class="clean"></div>
						</c:if>
						<c:if test="${not empty detail.manual_img02}">
							<article>
								<c:if test="${fn:contains(detail.manual_img02, 'foodsafetykorea')}">
									<img src="${detail.manual_img02}" class="recipe-thumbnail"/>
								</c:if>
								<c:if test="${not fn:contains(detail.manual_img02, 'foodsafetykorea')}">
									<img src="/resources/manual/${detail.manual_img02}"  class="recipe-thumbnail"/>
								</c:if>
							</article>
							<hgroup class="main-articles">
								<h4>&nbsp;&nbsp;Step2</h4>
							</hgroup>
							<hr width="49%"/>
							<hgroup>
								<h5>&nbsp;&nbsp;${detail.manual02}</h5>
							</hgroup>
							<div class="clean"></div>
						</c:if>
						<c:if test="${not empty detail.manual_img03}">
							<article>
								<c:if test="${fn:contains(detail.manual_img03, 'foodsafetykorea')}">
									<img src="${detail.manual_img03}" class="recipe-thumbnail"/>
								</c:if>
								<c:if test="${not fn:contains(detail.manual_img03, 'foodsafetykorea')}">
									<img src="/resources/manual/${detail.manual_img03}"  class="recipe-thumbnail"/>
								</c:if>
							</article>
							<hgroup class="main-articles">
								<h4>&nbsp;&nbsp;Step3</h4>
							</hgroup>
							<hr width="49%"/>
							<hgroup>
								<h5>&nbsp;&nbsp;${detail.manual03}</h5>
							</hgroup>
							<div class="clean"></div>
						</c:if>
						<c:if test="${not empty detail.manual_img04}">
							<article>
								<c:if test="${fn:contains(detail.manual_img04, 'foodsafetykorea')}">
									<img src="${detail.manual_img04}" class="recipe-thumbnail"/>
								</c:if>
								<c:if test="${not fn:contains(detail.manual_img04, 'foodsafetykorea')}">
									<img src="/resources/manual/${detail.manual_img04}"  class="recipe-thumbnail"/>
								</c:if>
							</article>
							<hgroup class="main-articles">
								<h4>&nbsp;&nbsp;Step4</h4>
							</hgroup>
							<hr width="49%"/>
							<hgroup>
								<h5>&nbsp;&nbsp;${detail.manual04}</h5>
							</hgroup>
							<div class="clean"></div>
						</c:if>
						<c:if test="${not empty detail.manual_img05}">
							<article>
								<c:if test="${fn:contains(detail.manual_img05, 'foodsafetykorea')}">
									<img src="${detail.manual_img05}" class="recipe-thumbnail"/>
								</c:if>
								<c:if test="${not fn:contains(detail.manual_img05, 'foodsafetykorea')}">
									<img src="/resources/manual/${detail.manual_img05}"  class="recipe-thumbnail"/>
								</c:if>
							</article>
							<hgroup class="main-articles">
								<h4>&nbsp;&nbsp;Step5</h4>
							</hgroup>
							<hr width="49%"/>
							<hgroup>
								<h5>&nbsp;&nbsp;${detail.manual05}</h5>
							</hgroup>
							<div class="clean"></div>
						</c:if>
						<c:if test="${not empty detail.manual_img06}">
							<article>
								<c:if test="${fn:contains(detail.manual_img06, 'foodsafetykorea')}">
									<img src="${detail.manual_img06}" class="recipe-thumbnail"/>
								</c:if>
								<c:if test="${not fn:contains(detail.manual_img06, 'foodsafetykorea')}">
									<img src="/resources/manual/${detail.manual_img06}"  class="recipe-thumbnail"/>
								</c:if>
							</article>
							<hgroup class="main-articles">
								<h4>&nbsp;&nbsp;Step6</h4>
							</hgroup>
							<hr width="49%"/>
							<hgroup>
								<h5>&nbsp;&nbsp;${detail.manual06}</h5>
							</hgroup>
							<div class="clean"></div>
						</c:if>
					</c:when>
				</c:choose>
		</div>
	</body>
</html>