<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		 <meta charset="UTF-8">
      	 <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
      	 <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      	 
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
	      		$("#insertBtn").click(function(){
		      		console.log($("#i_file").val());
		 			if(!chkData("#i_name", "제품명을")) return;
		 			else if(!chkData("#i_parts", "제품 분류를")) return;
		 			else if(!chkData("#i_price", "제품 가격을")) return;
		 			else if(!chkData("#i_quan", "재고")) return;
		 			else {
		 				if($("#i_file").val()==""){
		 					if(!chkData("#i_file", "제품 사진을")) return;
		 				}
		 				$("#insertForm").attr({
	  	 					"method": "post",
	  	 					"enctype": "multipart/form-data",
	  	 					"action": "/admin/store/insertItem"
	  	 				});
	  	 				$("#insertForm").submit();
		 			}
		 		}); 
	      	 });
      	 </script>
	</head>
	<body>
		<div class="container">
			<h2 class="text-center">
				제품 등록
			</h2>
			<form id="insertForm" class="form-horizontal">
			  <input type="hidden" name="i_img" id="i_img"/>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">제품명</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="i_name" id="i_name"/>
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
			      <input type="text" class="form-control" name="i_price" id="i_price">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">재고</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="i_quan" id="i_quan" >
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
			      <button type="button" id="insertBtn" class="btn btn-default">등록</button>
			    </div>
			  </div>
		    </form>
		</div>
	</body>
</html>