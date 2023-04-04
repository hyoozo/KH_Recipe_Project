<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/resources/include/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<link href="/resources/include/css/adminRecipeDetail.css" rel="stylesheet">

<script type="text/javascript">
	$(function(){
		$("#updateBtn").click(function(){
			let rcp_seq = ${detail.rcp_seq}
			$("#rcp_seq").val(rcp_seq);
			//console.log(rcp_seq);
			$("#updateForm").attr({
				"method" : "get",
				"action" : "/admin/recipe/updateForm"
			});
			$("#updateForm").submit();
		});
		
		$("#deleteBtn").click(function(){
			if(confirm("정말 삭제하시겠습니까?\n삭제하신 데이터는 복구할 수 없습니다.")){
			let rcp_seq = ${detail.rcp_seq}
			$("#rcp_seq").val(rcp_seq);
			//console.log(rcp_seq);
			$("#updateForm").attr({
				"method" : "get",
				"action" : "/admin/recipe/recipeDelete"
			});
			$("#updateForm").submit();
			}
		})
		
	}); // $ 종료
</script>
	</head>
	<body>
		<div class="contentContainer container">
			<h3>레시피 상세 정보</h3>
				<form id="updateForm">
					<input type="hidden" id="rcp_seq" name="rcp_seq" />
					<input type="hidden" id="att_file_no_mk" name="att_file_no_mk" value="${detail.att_file_no_mk}"/>
					<input type="hidden" id="manual_img01" name="manual_img01" value="${detail.manual_img01}"/>
					<input type="hidden" id="manual_img02" name="manual_img02" value="${detail.manual_img02}"/>
					<input type="hidden" id="manual_img03" name="manual_img03" value="${detail.manual_img03}"/>
					<input type="hidden" id="manual_img04" name="manual_img04" value="${detail.manual_img04}"/>
					<input type="hidden" id="manual_img05" name="manual_img05" value="${detail.manual_img05}"/>
					<input type="hidden" id="manual_img06" name="manual_img06" value="${detail.manual_img06}"/>
				</form>
				<table class="table table-bordered">
					<colgroup>
						<col width="30%" />
						<col width="70%" />
					</colgroup>
					<tbody>
						<tr>
							<td>레시피 이미지</td>
							<td><c:if test="${fn:contains(detail.att_file_no_mk, 'foodsafetykorea')}">
									<img src="${detail.att_file_no_mk}" class="recipeImg"/>
								</c:if>
								<c:if test="${not fn:contains(detail.att_file_no_mk, 'foodsafetykorea')}">
									<img src="/resources/recipe/${detail.att_file_no_mk}" class="recipeImg"/>
								</c:if>
							</td>
						</tr>
						<tr>
							<td>메뉴명</td>
							<td>${detail.rcp_nm}</td>
						</tr>
						<tr>
							<td>요리종류</td>
							<td>${detail.rcp_pat2}</td>
						</tr>
						<tr>
							<td>칼로리</td>
							<td>${detail.info_eng} kcal</td>
						</tr>
						<tr>
							<td>재료</td>
							<td>${detail.rcp_parts_dtls}</td>
						</tr>
						<tr>
							<td>만드는법 이미지 1</td>
							<td>
								<c:if test="${not empty detail.manual_img01}">
									<c:if test="${fn:contains(detail.manual_img01, 'foodsafetykorea')}">
										<img src="${detail.manual_img01}" class="recipeImg"/>
									</c:if>
										<c:if test="${not fn:contains(detail.manual_img01, 'foodsafetykorea')}">
										<img src="/resources/manual/${detail.manual_img01}" class="recipeImg"/>
									</c:if>
								</c:if>
							</td>
						</tr>
						<tr>
							<td>만드는법 1</td>
							<td>${detail.manual01}</td>
						</tr>
						<tr>
							<td>만드는법 이미지 2</td>
							<td>
								<c:if test="${not empty detail.manual_img02}">
									<c:if test="${fn:contains(detail.manual_img02, 'foodsafetykorea')}">
										<img src="${detail.manual_img02}" class="recipeImg"/>
									</c:if>
										<c:if test="${not fn:contains(detail.manual_img02, 'foodsafetykorea')}">
										<img src="/resources/manual/${detail.manual_img02}" class="recipeImg"/>
									</c:if>
								</c:if>
							</td>
						</tr>
						<tr>
							<td>만드는법 2</td>
							<td>${detail.manual02}</td>
						</tr>
						<tr>
							<td>만드는법 이미지 3</td>
							<td>
								<c:if test="${not empty detail.manual_img03}">
									<c:if test="${fn:contains(detail.manual_img03, 'foodsafetykorea')}">
										<img src="${detail.manual_img03}" class="recipeImg"/>
									</c:if>
										<c:if test="${not fn:contains(detail.manual_img03, 'foodsafetykorea')}">
										<img src="/resources/manual/${detail.manual_img03}" class="recipeImg"/>
									</c:if>
								</c:if>
							</td>
						</tr>
						<tr>
							<td>만드는법 3</td>
							<td>${detail.manual03}</td>
						</tr>
						<tr>
							<td>만드는법 이미지 4</td>
							<td>
								<c:if test="${not empty detail.manual_img04}">
									<c:if test="${fn:contains(detail.manual_img04, 'foodsafetykorea')}">
										<img src="${detail.manual_img04}" class="recipeImg"/>
									</c:if>
									<c:if test="${not fn:contains(detail.manual_img04, 'foodsafetykorea')}">
										<img src="/resources/manual/${detail.manual_img04}" class="recipeImg"/>
									</c:if>
								</c:if>
							</td>
						</tr>
						<tr>
							<td>만드는법 4</td>
							<td>${detail.manual04}</td>
						</tr>
						<tr>
							<td>만드는법 이미지 5</td>
							<td>
							<c:if test="${not empty detail.manual_img05}">
								<c:if test="${fn:contains(detail.manual_img05, 'foodsafetykorea')}">
									<img src="${detail.manual_img05}" class="recipeImg"/>
								</c:if>
								<c:if test="${not fn:contains(detail.manual_img05, 'foodsafetykorea')}">
									<img src="/resources/manual/${detail.manual_img05}" class="recipeImg"/>
								</c:if>
							</c:if>
							</td>
						</tr>
						<tr>
							<td>만드는법 5</td>
							<td>${detail.manual05}</td>
						</tr>
						<tr>
							<td>만드는법 이미지 6</td>
							<td>
								<c:if test="${not empty detail.manual_img06}">
									<c:if test="${fn:contains(detail.manual_img06, 'foodsafetykorea')}">
										<img src="${detail.manual_img06}" class="recipeImg"/>
									</c:if>
									<c:if test="${not fn:contains(detail.manual_img06, 'foodsafetykorea')}">
										<img src="/resources/manual/${detail.manual_img06}" class="recipeImg"/>
									</c:if>
								</c:if>
							</td>
						</tr>
						<tr>
							<td>만드는법 6</td>
							<td>${detail.manual06}</td>
						</tr>
				</tbody>
			</table>
			<div id="btnList">
				<input type="button" value="수정" id="updateBtn" class="btnCss"/>
				<input type="button" value="삭제" id="deleteBtn" class="btnCss"/>
			</div>
		</div>
	</body>
</html>