<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="/resources/include/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<link href="/resources/include/css/adminRecipeDetail.css" rel="stylesheet">


<script type="text/javascript">
	$(function(){
		
		$("#info_eng").on("input", function(){
			let value = $(this).val()
			if(isNaN(value)){
				alert("칼로리는 숫자만 입력 가능합니다.");
				$(this).val("");
			}
		});
		
		$("#insertBtn").click(function(){
			if(!chkData("#file","레시피 이미지를")) return;
			else if(!chkData("#rcp_nm","메뉴명을")) return;
			else if(!chkData("#info_eng", "칼로리를")) return;
			else if(!chkData("#rcp_parts_dtls","재료정보를")) return;
			else{
			$("#r_writeForm").attr({
				"method" : "post",
				"enctype" : "multipart/form-data",
				"action" : "/admin/recipe/recipeInsert"
			});
			$("#r_writeForm").submit();
			}
		})
		
		$("#cancelBtn").click(function(){
			//console.log("adsfa")
			$("#r_writeForm").each(function(){
				this.reset();
			});
		});
		
		$("#listBtn").click(function(){
			location.href = "/admin/recipe/recipeList";
		})
	})
</script>
	</head>
	<body>
		<div class="contentContainer container">
			<h3>레시피 등록</h3>
			<div>
				<form id="r_writeForm" name="r_writeForm">
					<table class="table table-bordered">
						<colgroup>
							<col width="20%" />
							<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<td>레시피 이미지</td>
								<td><input type="file" name="file" id="file" /></td>
							</tr>
							<tr>
								<td>메뉴명</td>
								<td><input type="text" name="rcp_nm" id="rcp_nm" class="more"/></td>
							</tr>
							<tr>
								<td>요리종류</td>
								<td><select id="rcp_pat2" name="rcp_pat2">
										<option value="반찬">반찬</option>
										<option value="후식">후식</option>
										<option value="밥">밥</option>
										<option value="일품">일품</option>
										<option value="국&찌개">국&찌개</option>
									</select></td>
							</tr>
							<tr>
								<td>칼로리</td>
								<td><input type="text" name="info_eng" id="info_eng" class="more" placeholder="숫자만 입력하세요"/></td>
							</tr>
							<tr>
								<td>재료정보</td>
								<td><input type="text" name="rcp_parts_dtls" id="rcp_parts_dtls" class="more"/></td>
							</tr>
							<tr>
								<td>만드는법1</td>
								<td><input type="text" name="manual01" id="manual01" class="more"/></td>
							</tr>
							<tr>
								<td>만드는법 이미지1</td>
								<td><input type="file" name="file01" id="file01" /></td>
							</tr>
							<tr>
								<td>만드는법2</td>
								<td><input type="text" name="manual02" id="manual02" class="more"/></td>
							</tr>
							<tr>
								<td>만드는법 이미지2</td>
								<td><input type="file" name="file02" id="file02" /></td>
							</tr>
							<tr>
								<td>만드는법3</td>
								<td><input type="text" name="manual03" id="manual03" class="more"/></td>
							</tr>
							<tr>
								<td>만드는법 이미지3</td>
								<td><input type="file" name="file03" id="file03" /></td>
							</tr>
							<tr>
								<td>만드는법4</td>
								<td><input type="text" name="manual04" id="manual04" class="more"/></td>
							</tr>
							<tr>
								<td>만드는법 이미지4</td>
								<td><input type="file" name="file04" id="file04" /></td>
							</tr>
							<tr>
								<td>만드는법5</td>
								<td><input type="text" name="manual05" id="manual05" class="more"/></td>
							</tr>
							<tr>
								<td>만드는법 이미지5</td>
								<td><input type="file" name="file05" id="file05" /></td>
							</tr>
							<tr>
								<td>만드는법6</td>
								<td><input type="text" name="manual06" id="manual06" class="more"/></td>
							</tr>
							<tr>
								<td>만드는법 이미지6</td>
								<td><input type="file" name="file06" id="file06" /></td>
							</tr>
						</tbody>
					</table>
					
					<div>
						<input type="button" value="등록" id="insertBtn" class="btnCss">
						<input type="button" value="취소" id="cancelBtn" class="btnCss"/>
						<input type="button" value="목록" id="listBtn" class="btnCss"/>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>