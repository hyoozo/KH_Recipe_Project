<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<link href="/resources/include/css/index.css" rel="stylesheet">
		<style>
			#requestPay{
				background-color: #81c147;
				color: white;
			}
		</style>

		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
		
		<script type="text/javascript">
		    $(function(){
		       $("#payWindow").css("display", "none");
		    	
		       let i_num = $("#i_num").val();
		       let i_name = $("#i_name").html();
		       
		       function verifiaction(imp_uid){
		    	   var def = new $.Deferred();
		    	   $.ajax({
		            	 url: "/order/paymentVerification" ,
		            	 type: "post",
		            	 data: {
		            		imp_uid: imp_uid,
		            		i_num: i_num
		            	 },
		            	 dataType: "text",
		            	 success: function(data){
		            		 console.log(data);
		            		 def.resolve(data);
		            	 }, error: function(){
		            		 def.reject("실패");
		            	 }
		    	   });
		    	   
		    	   return def.promise();
		       };
		       
			       
			   $("#requestPay").click(function(){
				   
				   console.log(i_num);
				   if($("#loginUser").val()== ""){
					   alert("로그인 후 이용 가능합니다.");
					   location.href="#";
				   } else {
					   var IMP = window.IMP; 
					   IMP.init("imp30735743");
					   
					   let amount=$("#payPrice").html();
					    
					   IMP.request_pay({
				            pg : 'kakaopay',
				            pay_method : 'card',
				            merchant_uid: ${login.m_num} + "_" + new Date().getTime(), 
				            name : i_name,
				            amount : amount,
				            buyer_email : "${login.m_email}",
				            buyer_name : "${login.m_name}",
				            buyer_tel : "${login.m_phone}",
				            buyer_addr : "${login.m_address}",
				            buyer_postcode : "${login.m_zip}"
				        }, function (rsp) { // callback
				            if (rsp.success) {
				              console.log(rsp);
				             
				              $.when(verifiaction(rsp.imp_uid)).done(function(result){

					              console.log(result);
				            	  if(result == '성공'){
					            	  alert("결제에 성공했습니다.");
					            	  
					            	  $("#imp_uid").val(rsp.imp_uid);
						              $("#pay_method").val(rsp.pay_method);
						              $("#merchant_uid").val(rsp.merchant_uid);
						              $("#name").val(rsp.name);
						              $("#amount").val(rsp.paid_amount);
						              $("#ol_quan").val($("#cnt").html()); 
						              
						              $("#addOrder").attr({
						            	  "method":"post",
						            	  "action": "/order/addOneOrder"
						              })
						              
						              $("#addOrder").submit();
					              } else {
					            	  
					            	  $.ajax({
						            	 url: "/order/paymentCancel" ,
						            	 type: "post",
						            	 data: {
						            		imp_uid: rsp.imp_uid,
						            		amount: rsp.paid_amount
						            	 },
						            	 dataType: "text",
						            	 success: function(data){
						            		 console.log(data);
						            		 if(data == "결제 취소"){
						            			 alert("결제가 취소되었습니다."); 
						            		 } else {
						            			 alert("시스템 오류가 발생");
						            		 }
						            		 
						            	 }
						              });
					              }
				              });
				               
				            } else {
				                //console.log(rsp);
				                alert("결제에 실패했습니다.");
				            }
				        });  
				   }
				   
			   });
			   
			   $("#goBascket").click(function(){
				  if($("#loginUser").val() != ""){
					  $.ajax({
						url: "/bascket/insertItem",
						type: "post",
						dataType: "text",
						data: $("#inputBascket").serialize(),
						success: function(data){
							console.log(data);
							if(data=="성공"){
								if(confirm("장바구니로 이동하겠습니까?")){
									location.href="/bascket/bascketList";
								}
							} else{
								alert("시스템 오류가 발생했습니다. 잠시 후 이용해 주세요.");
							}
						},
						error : function(){
							alert("오류 발생");
						}
					  });
					  
				  } else {
					  alert("로그인 후 이용 가능합니다.");
					  location.href="#";
				  }
			   });
			   
			   $("#openPay").click(function(){
				   $("#payWindow").css("display", "");
			   });
			   
			   $("#cntUp").click(function(){
				   let cnt = $("#cnt").html();
				   
				   if(cnt<10){
					   cnt++;
					   $("#cnt").html(cnt);
					   payPrice();
				   } else {
					   alert("최대 10개까지 구매 가능합니다.");
				   }
			   });
			   
			   $("#cntDown").click(function(){
				   let cnt = $("#cnt").html();
				   
				   if(cnt>1){
					   cnt--;
					   $("#cnt").html(cnt);
					   payPrice();
				   } else {
					   alert("1개 이상 구매 가능합니다.");
				   }
			   });
			   
			   function payPrice(){
				   const payPrice = $("#i_price").html().replace(/,/g, "");
				   var cnt = $("#cnt").html().replace(/,/g, "");;
				   
				   var result = Number(payPrice) * Number(cnt);
				   console.log(parseInt(result));
				   
				   $("#payPrice").html(result.toLocaleString('ko-KR'));
			   };
		    });
		    
		</script>
	</head>
	<body>
		<div class="container">
			<form id="addOrder">
				<input type="hidden" name="ovo.imp_uid" id="imp_uid" value=""/>
				<input type="hidden" name="ovo.pay_method" id="pay_method" value=""/>
				<input type="hidden" name="ovo.merchant_uid" id="merchant_uid" value=""/>
				<input type="hidden" name="ovo.name" id="name" value=""/>
				<input type="hidden" name="ovo.amount" id="amount" value=""/>
				<input type="hidden" name="mvo.m_num" value="${login.m_num}"/>
				
				<input type="hidden" name="ivo.i_num" value="${detail.i_num }"/>
				<input type="hidden" name="ol_quan" id="ol_quan" value=""/>
			</form>
		
			<form id="inputBascket">
				<input type="hidden" name="ivo.i_num" id="i_num" value="${detail.i_num }"/>
				<input type="hidden" name="mvo.m_num" id="loginUser" value="${login.m_num}"/>
			</form>
			<div class="col-md-6">
				<img src="${detail.i_img }">
			</div>
			<div class="col-md-6 text-center">
				<table class="table table-bordered">
					<tr>
						<td>제품 분류</td>
						<td id="i_parts">${detail.i_parts }</td>
					</tr>
					<tr>
						<td>제품명</td>
						<td id="i_name">${detail.i_name }</td>
					</tr>
					<tr>
						<td>제품 가격</td>
						<td id="i_price">${detail.i_price }</td>
					</tr>
				</table>
				
				<button type="button" id="goBascket">장바구니</button>
				<button type="button" id="openPay">주문</button>
				
				<br/>
				<br/>
				
				<div id="payWindow">
					<table class="table table-bordered">
						<tr>
							<td>${detail.i_name }</td>
							<td>${detail.i_price }</td>
							<td>
								<button type="button" id="cntUp">+</button>
								<button type="button" id="cntDown">-</button>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								${detail.i_name } x <span id="cnt">1</span>
							</td>
						</tr>
						<tr>
							<td colspan="3" id="payPrice">
								${detail.i_price }
							</td>
						</tr>
						<tr>
							<td colspan="3" id="requestPay">
								결제
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>