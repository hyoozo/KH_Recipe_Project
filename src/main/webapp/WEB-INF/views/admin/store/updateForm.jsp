<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
      
      	 <link rel="shortcut icon" href="/resources/static/image/icon.png" />
      	 <link rel="apple-touch-icon" href="/resources/static/image/icon.png" />
      	 <link rel="stylesheet" type="text/css" href="/resources/include/css/admin.css"/>
      
      	 <!--[if lt IE 9]>
      	 <script src="../js/html5shiv.js"></script>
      	 <![endif]-->
      	 
      	 <script type="text/javascript" src="/resources/include/js/common.js"></script>
      	 <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      	 <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
      	 <script type="text/javascript" src="/resources/include/dist/js/cookie.js"></script>
      	 
      	 
      	 <script type="text/javascript">
      	 	$(function(){
      	 		$("#i_parts").val("${item.i_parts}");
      	 		//$("#i_img").val("${item.i_img}");
      	 		
      	 		console.log($("#i_img").val());
      	 		
      	 		$("#updateBtn").click(function(){
      	 			if(!chkData("#i_name", "제품명을")) return;
      	 			else if(!chkData("#i_parts", "제품 분류를")) return;
      	 			else if(!chkData("#i_price", "제품 가격을")) return;
      	 			else if(!chkData("#i_quan", "재고")) return;
      	 			else {
      	 				if($("#i_file").val()==""){
      	 					if(!chkData("#i_file", "제품 사진을")) return;
      	 				}
      	 				$("#updateForm").attr({
      	 					"method": "post",
      	 					"enctype": "multipart/form-data",
      	 					"action": "/admin/store/itemUpdate"
      	 				});
      	 				$("#updateForm").submit();
      	 			}
      	 		});
      	 	});
      	 </script>
	</head>
	<body>
		<c:if test="${not empty adminLogin }">
			<div class="container">
				<h2 class="text-center">
					제품 수정
				</h2>
				<form id="updateForm" class="form-horizontal">
				  <input type="hidden" name="i_img" id="i_img" value="${item.i_img }"/>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">제품명</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="i_name" id="i_name" value="${item.i_name}">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">제품분류</label>
				    <div class="col-sm-10">
				      <select id='i_parts' name='i_parts' class='form-control' style='width: 180px;'>
				      	<option value='가전제품'>가전제품</option>
				      	<option value='간편식·조리식품'>간편식·조리식품</option>
				      	<option value='그릇·컵'>그릇·컵</option>
				      	<option value='수산·해산·건어물'>수산·해산·건어물</option>
				      	<option value='욕실·세제·청소'>욕실·세제·청소</option>
				      </select>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">제품 가격</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="i_price" id="i_price" value="${item.i_price}">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">재고</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="i_quan" id="i_quan" value="${item.i_quan}">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">제품 사진</label>
				    <div class="col-sm-10">
				      <input type="file" name="file" id="i_file" >
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="button" id="updateBtn" class="btn btn-default">수정</button>
				    </div>
				  </div>
			  </form>
			</div>
		</c:if>
		
		<c:if test="${empty adminLogin }">
    		<div class="text-center">
				<p>
					로그인 후 이용 가능한 서비스 입니다. 
				</p>
				<button type="button" class="btn btn-primary" onclick="location.href='/admin/loginForm'">로그인 페이지 이동</button>
			</div>
    	</c:if>
	</body>
</html>