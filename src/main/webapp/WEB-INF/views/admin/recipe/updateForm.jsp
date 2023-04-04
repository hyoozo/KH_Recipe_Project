<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="/resources/include/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<link href="/resources/include/css/updateForm.css" rel="stylesheet">

<script type="text/javascript">
	
	$(function(){
		
		$("#info_eng").on("input", function(){
			let value = $(this).val()
			if(isNaN(value)){
				alert("칼로리는 숫자만 입력 가능합니다.");
				$(this).val("");
			}
		});
		
		
		$("#updateBtn").click(function(){
			let rcp_seq = ${detail.rcp_seq}
			$("#rcp_seq").val(rcp_seq);
			if($("#rcp_pat2").val()=='분류'){
				alert("음식분류를 반드시 해주세요.");
				$("#rcp_pat2").val("분류");
				$("#rcp_pat2").focus();
				
			}
			else if(!chkData("#info_eng","변경할 칼로리를")) return;
			else {
				$("#r_updateForm").attr({
					"method" : "post",
					"enctype" : "multipart/form-data",
					"action" : "/admin/recipe/recipeUpdate"
				})
				$("#r_updateForm").submit();
			}
		});
		
		$("#cancelBtn").click(function(){
			$("#r_updateForm").each(function(){
				this.reset();
			})
		});
		
		$("#listBtn").click(function(){
			location.href = "/admin/recipe/recipeList";
		})
	})
	
</script>
	</head>
	<body>
		<div class="contentContainer container">
			<h3>레시피 수정</h3>
				<form id="r_updateForm" name="r_updateForm">
					<input type="hidden" id="rcp_seq" name="rcp_seq" />
					<input type="hidden" id="att_file_no_mk" name="att_file_no_mk" />
					<input type="hidden" id="manual_img01" name="manual_img01" />
					<input type="hidden" id="manual_img02" name="manual_img02" />
					<input type="hidden" id="manual_img03" name="manual_img03" />
					<input type="hidden" id="manual_img04" name="manual_img04" />
					<input type="hidden" id="manual_img05" name="manual_img05" />
					<input type="hidden" id="manual_img06" name="manual_img06" />
					
					
					<table class="table table-bordered">
						<colgroup>
							<col width="20%" />
							<col width="40%" />
							<col width="40%" />
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
								<td>
									<input type="file" name="file" id="file" />
								</td>
							</tr>
							<tr>
								<td>메뉴명</td>
								<td>${detail.rcp_nm}</td>
								<td><input type="text" name="rcp_nm" id="rcp_nm" class="dataInput" placeholder="입력하지 않으시면 기존 메뉴명이 유지됩니다."/></td>
							</tr>
							<tr>
								<td>요리종류</td>
								<td>${detail.rcp_pat2}</td>
								<td><select id="rcp_pat2" name="rcp_pat2">
										<option value="분류">분류</option>
										<option value="반찬">반찬</option>
										<option value="후식">후식</option>
										<option value="밥">밥</option>
										<option value="일품">일품</option>
										<option value="국&찌개">국&찌개</option>
									</select></td>
							</tr>
							<tr>
								<td>칼로리</td>
								<td>${detail.info_eng} kcal</td>
								<td><input type="text" name="info_eng" id="info_eng" class="dataInput"/></td>
							</tr>
							<tr>
								<td>재료</td>
								<td>${detail.rcp_parts_dtls}</td>
								<td><input type="text" name="rcp_parts_dtls" id="rcp_parts_dtls" class="dataInput" placeholder="입력하지 않으시면 기존 재료가 유지됩니다."/></td>
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
								<td>
									<input type="file" name="file01" id="file01" />
								</td>
							</tr>
							<tr>
								<td>만드는법 1</td>
								<td>${detail.manual01}</td>
								<td><input type="text" name="manual01" id="manual01" class="dataInput" placeholder="입력하지 않으시면 기존 만드는법 1이 유지됩니다."/></td>
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
								<td>
									<input type="file" name="file02" id="file02" />
								</td>
							</tr>
							<tr>
								<td>만드는법 2</td>
								<td>${detail.manual02}</td>
								<td><input type="text" name="manual02" id="manual02" class="dataInput" placeholder="입력하지 않으시면 기존 만드는법 2가 유지됩니다."/></td>
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
								<td>
									<input type="file" name="file03" id="file03" />
								</td>
							</tr>
							<tr>
								<td>만드는법 3</td>
								<td>${detail.manual03}</td>
								<td><input type="text" name="manual03" id="manual03" class="dataInput" placeholder="입력하지 않으시면 기존 만드는법 3이 유지됩니다."/></td>
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
								<td>
									<input type="file" name="file04" id="file04" />
								</td>
							</tr>
							<tr>
								<td>만드는법 4</td>
								<td>${detail.manual04}</td>
								<td><input type="text" name="manual04" id="manual04" class="dataInput" placeholder="입력하지 않으시면 기존 만드는법 4가 유지됩니다."/></td>
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
								<td>
									<input type="file" name="file05" id="file05" />
								</td>
							</tr>
							<tr>
								<td>만드는법 5</td>
								<td>${detail.manual05}</td>
								<td><input type="text" name="manual05" id="manual05" class="dataInput" placeholder="입력하지 않으시면 기존 만드는법 5가 유지됩니다."/></td>
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
								<td>
									<input type="file" name="file06" id="file06" />
								</td>
							</tr>
							<tr>
								<td>만드는법 6</td>
								<td>${detail.manual06}</td>
								<td><input type="text" name="manual06" id="manual06" class="dataInput" placeholder="입력하지 않으시면 기존 만드는법 6이 유지됩니다."/></td>
							</tr>
					</tbody>
				</table>
				<div id="btnList">
					<input type="button" value="수정완료" id="updateBtn" class="btnCss" />
					<input type="button" value="취소" id="cancelBtn" class="btnCss" />
					<input type="button" value="목록" id="listBtn" class="btnCss" />
				</div>
			</form>
		</div>
	</body>
</html>