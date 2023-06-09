<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<link href="/resources/include/css/index.css" rel="stylesheet">
	<style>
		.info{
			height: 100px;
		}
		.notGoDetail > .info {
			background-color: #808080;
		}
	</style>
	
	<script type="text/javascript">
		
		function getItems(pageNum, search, keyword){
			$.ajax({
				type:"post",
				url:"/store/getList",
				dataType:"json",
				data : {pageNum : pageNum, search : search, keyword : keyword},
				success: function(data){
					console.log(data.length);
					if(data != 0){
						/* console.log("성공");
						console.log(pageNum);
						console.log(data); */
						$(data).each(function(){
							// console.log(this);
							
							if(Number(this.i_quan) > 0){
								//console.log(1);
								let $div = $("<div class='col-md-4 goDetail item' data-num='" + this.i_num + "'>");
								
								if(this.i_img.indexOf("https://")==0){
									$div.append($("<img style='width:350px; height:350px;'>").attr("src", this.i_img));
								} else {
									$div.append($("<img style='width:350px; height:350px;'>").attr("src", "/resources/item/"+this.i_img));
								}
								
								let $info = $("<div class='info'>");
								$info.append($("<p>").append(this.i_name));
								$info.append($("<p>").append(this.i_price));
								$info.append($("<p class='parts'>").append(this.i_parts));
								
								$("#itemsList").append($div.append($info));
							} 
							
						});	
					}
				}
			});
		}
	
		$(function(){
			let pageNum = 1;
			let search = "";
			let keyword = "";
			
			getItems(pageNum, search, keyword);
			
			$(window).scroll(function(){
				var scrollTop = $(window).scrollTop();
				//console.log(scrollTop);
				var innerHeight = $(window).innerHeight();
				//console.log(innerHeight);
				var height = $(document).height();	
				//console.log(height);
				
				if(scrollTop + innerHeight + 100 >= height) {
					pageNum += 1;
					//console.log(pageNum);
					
					getItems(pageNum, search, keyword);
				}
				
			});
			
			$("#keyword").bind("keydown", function(event){
				if(event.keyCode == 13) {
					event.preventDefault();
				}
			});
			
			$("#searchBtn").click(function(){
				
				if($("#search").val() != "all"){
					if(!chkData("#keyword", "검색어")) return;
				}
				
				$("#itemsList").html("");
				
				pageNum = 1;
				search = $("#search").val();
				keyword = $("#keyword").val();
				
				getItems(pageNum, search, keyword);
			});
			
			$("#search").change(function(){
				searchAll();
				
				//console.log($(this).val());
				
				if($(this).val() == 'i_parts'){
					$("#keyword").remove();
					
					let $select = $("<select id='keyword' name='keyword' class='form-control'>");
					
					let $option1 = $("<option value='가전제품'>가전제품</option>");
					let $option2 = $("<option value='간편식·조리식품'>간편식·조리식품</option>");
					let $option3 = $("<option value='그릇·컵'>그릇·컵</option>");
					let $option4 = $("<option value='수산·해산·건어물'>수산·해산·건어물</option>");
					let $option5 = $("<option value='욕실·세제·청소'>욕실·세제·청소</option>");
					
					$select.append($option1).append($option2).append($option3).append($option4).append($option5);
					
					$("#keyInput").append($select);
				} else if($(this).val() == 'i_name'){
					$("#keyword").remove();
					
					let $input = $("<input type='text' class='form-control' id='keyword'>");
					
					$("#keyInput").append($input);
					
					$("#keyword").val("");
					$("#keyword").focus();
				}
			});
			
			$(document).on("click", ".goDetail", function(){
				//console.log($(this).attr("data-num"));
				
				let i_num = $(this).attr("data-num");
				let i_parts= $(this).children(".info").children(".parts").html();
				location.href="/store/itemsDetail?i_num="+i_num+"&i_parts="+i_parts;
				
			});
			
			$(document).on("click", ".notGoDetail", function(){
				//console.log($(this).attr("data-num"));
				
				alert("재고가 소진되어 주문할 수 없습니다.");
				
			});
			
			function searchAll(){
				if($("#search").val() == "all"){
					$("#keyword").prop('readonly', true);
				} else {
					$("#keyword").prop('readonly', false);
				}
			}
			searchAll();
		});
	</script>
   </head>
   <body>
      <div class="contentContainer container">
      
      	<div class="text-right">
      		<form id="searchItems" class="form-inline">
			  <div class="form-group">
			  	<div class="col-md-4">
			  		<select id="search" name="search" class="form-control">
				    	<option value="all">전체</option>
				    	<option value="i_name">제품명</option>
				    	<option value="i_parts">제품분류</option>
				    </select>
			  	</div>
			  	<div class="col-md-4" id="keyInput">
			  		<input type="text" class="form-control" id="keyword">
			  	</div>
			  	<div class="col-md-4">
			  		<button type="button" class="btn btn-default" id="searchBtn">검색</button>
			  	</div>
			  </div>
			</form>
      	</div>
      	
      	<br>
      	
      	<div id="itemsList" class="table-height">
			
		</div>
      </div>
   </body>
</html>