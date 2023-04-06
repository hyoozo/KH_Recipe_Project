<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
		
		
		<style>
			#requestPay{
				background-color: #81c147;
				color: white;
			}
			img{
				width: 250px;
				height: 250px;
			}
			.itemList{
				margin-bottom: 10px;
			}
		</style>
		
		<script type="text/javascript">
			$(function(){
				
				
				function allPrice(){
					let allPrice = 0;
					$(".allPrice").each(function(){
						console.log($(this).html());
						allPrice = Number(allPrice) + Number($(this).html().replace(/,/g, ""));
					});
					
					$("#allPay").html(allPrice.toLocaleString('ko-KR'));
				}
				
				allPrice();
				
				$("#requestPay").click(function(){
			       let name = "";
			       
			       $("p.name").each(function(){
			    	   let str = $(this).html().split("x")
			    	   console.log(str[0]);
			    	   name += "_" + str[0];
			       });
			       
			       let o_num = ${login.m_num} + "_" + new Date().getTime();
			       console.log(o_num);
			       
			       var IMP = window.IMP; 
			       IMP.init("imp30735743"); 
				   
				   
				   IMP.request_pay({
			            pg : 'kcp',
			            pay_method : 'card',
			            merchant_uid: o_num,
			            name : name,
			            amount : $("#allPay").html(),
			            buyer_email : '${login.m_email}',
			            buyer_name : '${login.m_name}',
			            buyer_tel : '${login.m_phone}',
			            buyer_addr : '${login.m_address}',
			            buyer_postcode : '${login.m_zip}'
			        }, function (rsp) { // callback
			        	console.log(rsp);
			            if (rsp.success) {
			            	$.when(addOrder(rsp)).done(function(result){
				            	   //console.log(result);
				            	   if(result == '성공'){
				            		   $("#bascketList > div.itemList").each(function(){
						            	   let b_num = $(this).attr("data-num");
						            	   let i_num = $(this).find("div > p.num").html();
						            	   let ol_quan = Number($(this).find("div > p.name > span.cnt").html());
						            	   
						            	   $.ajax({
						            		   url : "/order/addOrders",
						            		   type: "post",
						            		   data : {
						            			   "imp_uid": rsp.imp_uid,
						            			   "pay_method": rsp.pay_method,
						            			   "merchant_uid": rsp.merchant_uid,
						            			   "name": rsp.name,
						            			   "amount": rsp.paid_amount,
						            			   
						            			   i_num : i_num,
					            				   i_quan: ol_quan,
					            				   ol_quan : ol_quan,  
						            			   b_num: b_num
						            	  	   },
						            		   dataType : "text",
						            		   success : function(data){
						            			   //alert("결제 완료되었습니다.");
						            			   console.log(data);

							            		   location.href="/";
						            		   },
						            		   error: function(){
						            			   alert("결제 실패했습니다.");
						            		   }
						            	   });
						               });
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
				 });
				
				
				
				$(".cntUp").click(function(){
				   let cnt = $(this).parent().prev().children("p.name").children("span.cnt").html();
				   
				   //console.log($(this).parent().prev().children("p.name").children("span.cnt").html());
				   const price = $(this).parent().prev().children("p.price").html().replace(/,/g, "");
				   if(cnt<10){
					   cnt++;
					   $(this).parent().prev().children("p.name").children("span.cnt").html(cnt);
					   console.log("price: " + price + " cnt : " + cnt);
					   var result = Number(price) * Number(cnt);
					   $(this).parent().prev().children("p.allPrice").html(result.toLocaleString('ko-KR'));
					   allPrice();
				   } else {
					   alert("최대 10개까지 구매 가능합니다.");
				   }
			   });
			   
			   $(".cntDown").click(function(){
				   let cnt = $(this).parent().prev().children("p.name").children("span.cnt").html();
				   const price = $(this).parent().prev().children("p.price").html().replace(/,/g, "");
				   if(cnt>1){
					   cnt--;
					   $(this).parent().prev().children("p.name").children("span.cnt").html(cnt);
					   console.log("price: " + price + " cnt : " + cnt);
					   var result = Number(price) * Number(cnt);
					   $(this).parent().prev().children("p.allPrice").html(result.toLocaleString('ko-KR'));
					   allPrice();
				   } else {
					   alert("1개 이상 구매 가능합니다.");
				   }
			   });
			   
			   $(".deleteBtn").click(function(){
				   let b_num = $(this).parent().parent().attr("data-num");
				   //console.log(b_num);
				   let i_num = $(this).parent().prev().prev().children("p.num").html();
				   //console.log( $(this).parent().prev().prev().children("p.num"));
				   $.ajax({
					  url: "/bascket/deleteItem",
					  type: "post",
					  data: {
						  b_num: b_num
					  },
					  dataType: "text",
					  success: function(data){
						  //console.log(data);
						  if(data=="성공"){
							  alert("삭제되었습니다.");
							  location.href="/bascket/bascketList";
						  } else {
							  alert("시스템 오류가 발생했습니다.");
						  }
					  }
				   });
				   
			   });
			   
			   function addOrder(rsp){
				   //console.log(rsp.imp_uid);
				   var def = new $.Deferred();
				   $.ajax({
            		   url : "/order/addOrder",
            		   type: "post",
            		   data : {
            			   "imp_uid": rsp.imp_uid,
            			   "pay_method": rsp.pay_method,
            			   "merchant_uid": rsp.merchant_uid,
            			   "name": rsp.name,
            			   "amount": rsp.paid_amount
            		   },
            		   dataType : "text",
            		   success : function(data){
            			   console.log(data);
            			   def.resolve(data);
            		   },
            		   error: function(){
            			   def.reject("실패");
            		   }
            	   });
				   return def.promise();
			   }
			   
			   function bascketCnt(){
				   $(".itemList").each(function(){
					   let cnt = $(this).children(".info").children(".name").children(".cnt").html();
					   console.log(cnt);
					   let price = $(this).children(".info").children(".price").html().replace(/,/g, "");
					   console.log(price);
					   var result = Number(cnt) * Number(price);
					   console.log(result);
					   
					   $(this).children(".info").children(".allPrice").html(result.toLocaleString('ko-KR'))
				   });
			   }
			   bascketCnt();
			});
		</script>
	</head>
	<body>
		<div class="container">
			<h2 class="text-center">장바구니</h2>
			<c:choose>
				<c:when test="${not empty login }">
					<c:choose>
						<c:when test="${not empty bascket}">
							<div id="bascketList">
								<c:forEach var="bascket" items="${bascket }">
									<div class="itemList container" data-num="${bascket.b_num }">
										<div class="col-md-4 item">
											<img src="${bascket.ivo.i_img }"/>
										</div>
										<div class="col-md-4 text-center item info">
											<p style="display:none;" class="num">${bascket.ivo.i_num }</p>
											<p class="name">${bascket.ivo.i_name } x <span class="cnt">${bascket.b_quan }</span></p>
											<p class="price" style="display: none;">${bascket.ivo.i_price }</p>
											<p class="allPrice">${bascket.ivo.i_price }</p>
										</div>
										<div class="col-md-2 text-center item">
											<button type="button" class="cntUp">+</button>
											<button type="button" class="cntDown">-</button>
										</div>
										<div class="col-md-2 text-center item">
											<button type="button" class="deleteBtn">삭제</button>
										</div>
									</div>
								</c:forEach>
							</div>
							<div id="pay">
								<table class="table table-bordered">
									<tr>	
										<th colspan="2" class="text-center">결제</th>
									</tr>
									<tr class="text-center">
										<td class="col-md-4">총 주문 금액 </td>
										<td class="col-md-8" id="allPay"></td>
									</tr>
									<tr>
										<td colspan="2" id="requestPay" class="text-center">
											주문하기
										</td>
									</tr>
								</table>
							</div>	
						</c:when>
						<c:otherwise>
							<hr>
							<div class="text-center">
								<p>장바구니를 등록하세요.</p>
								
								<button type="button" class="btn btn-primary" onclick="location.href='/store/itemsList'">스토어로 이동</button>
							</div>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<hr>
					<div class="text-center">
						<p>
							로그인 후 이용 가능한 서비스 입니다. 
						</p>
						<button type="button" class="btn btn-primary" onclick="location.href='/member/loginForm'">로그인 페이지 이동</button>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</body>
</html>