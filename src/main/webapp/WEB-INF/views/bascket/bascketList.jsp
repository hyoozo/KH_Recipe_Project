<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
		
		
		<style>
			#pay{
				position: fixed;
			}
		</style>
		
		<script type="text/javascript">
			$(function(){
				function allPrice(){
					let allPrice = 0;
					$(".price").each(function(){
						allPrice += $(this).html().replace(/,/g, "");
					});
					
					$("#allPay").html(allPrice.toLocaleString('ko-KR'));
				}
				
				allPrice();
			
				#("#bascketList").change(function(){
					allPrice();
				});
				
				$("#requestPay").click(function(){
			    	
					   var IMP = window.IMP; 
					   IMP.init("imp30735743"); 
					    
					   IMP.request_pay({
				            pg : 'kcp',
				            pay_method : 'card',
				            merchant_uid: "${user}" + new Date().getTime(), 
				            amount : allPrice,
				            buyer_email : 'Iamport@chai.finance',
				            buyer_name : '포트원 기술지원팀',
				            buyer_tel : '010-1234-5678',
				            buyer_addr : '서울특별시 강남구 삼성동',
				            buyer_postcode : '123-456'
				        }, function (rsp) { // callback
				            if (rsp.success) {
				               // console.log(rsp);
				               $("#bascketList > div.itemList").each(function(){
				            	   let i_num = $(this).find("div > p.num").html();
				            	   let m_num = sessionStorage.getItem("loginUser");
				            	   let ol_quan = $(this).find("div > p.name > span.cnt").html();
				            	   
				            	   let OrderListVO = {
				            			   i_num : i_num,
				            			   m_num : m_num,
				            			   ol_quan : ol_quan
				            	   }
				            	   
				            	   $.ajax({
				            		   url : "order/addOrders",
				            		   type: "post",
				            		   data : OrderListVO,
				            		   dataType : "text",
				            		   success : function(data){
				            			   console.log(data);
				            		   }
				            	   });
				               });
				               location.href="/";
				            } else {
				                //console.log(rsp);
				                alert("결제에 실패했습니다.");
				            }
				        });
				 });
				
				$(".cntUp").click(function(){
				   let cnt = $(this).parent().prev().children("p.name > span.cnt").html();
				   
				   if(cnt<10){
					   cnt++;
					   $(this).parent().prev().children("p.name > span.cnt").html(cnt);
					   var price = $(this).parent().prev().children("p.price").html.replace(/,/g, "")
					   var result = Number(price) * Number(cnt);
					   $(this).parent().prev().children("p.price").html(result.toLocaleString('ko-KR'));
				   } else {
					   alert("최대 10개까지 구매 가능합니다.");
				   }
			   });
			   
			   $(".cntDown").click(function(){
				   let cnt = $(this).parent().prev().children("p.name > span.cnt").html();
				   
				   if(cnt>1){
					   cnt--;
					   $(this).parent().prev().children("p.name > span.cnt").html(cnt);
					   var price = $(this).parent().prev().children("p.price").html.replace(/,/g, "")
					   var result = Number(price) * Number(cnt);
					   $(this).parent().prev().children("p.price").html(result.toLocaleString('ko-KR'));
				   } else {
					   alert("1개 이상 구매 가능합니다.");
				   }
			   });
			   
			});
		</script>
	</head>
	<body>
		<div class="container">
			<h2 class="text-center">장바구니</h2>
			<c:choose>
				<c:when test="${not empty loginUser }">
					<c:choose>
						<c:when test="${not empty bascket}">
							<div class="col-md-8" id="bascketList">
								<c:forEach var="list" items="${bascket }">
									<div class="itemList">
										<div class="col-md-4">
											<img src="${bascket.i_img }"/>
										</div>
										<div class="col-md-4 text-center">
											<p style="display:none;" class="num">${detail.i_num }</p>
											<p class="name">${bascket.i_name } x <span class="cnt">1</span></p>
											<p class="price">${bascket.i_price }</p>
										</div>
										<div class="col0md-2 text-center">
											<button type="button" class="cntUp">+</button>
											<button type="button" class="cntDown">-</button>
										</div>
										<div class="col0md-2 text-center">
											<button type="button" >삭제</button>
										</div>
									</div>
								</c:forEach>	
							</div>
								
							<div class="col-md-4" id="pay">
								<table>
									<tr>	
										<td>결제</td>
									</tr>
									<tr>
										<td>총 주문 금액</td>
										<td id="allPay"></td>
									</tr>
									<tr>
										<td>주문하기</td>
									</tr>
								</table>
							</div>
						</c:when>
						<c:otherwise>
							<div>
								장바구니를 등록하세요.
							</div>
							<div>
								<button type="button">스토어로 이동</button>
							</div>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<button type="button" onclick="location.href=''">로그인 페이지 이동</button>
				</c:otherwise>
			</c:choose>
		</div>
	</body>
</html>