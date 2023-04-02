<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

	<style>
		img{
			width: 150px;
			height: 150px;
		}
		.orderList{
			overflow: hidden;
		}
		.imp_uid{
			display:none;
		}
	</style>
	<script>
		$(function(){
			$(".price").each(function(){
				//console.log($(this).html());
				let price = Number($(this).html());
				
				let cnt = Number($(this).prev().children(".cnt").html());
				//console.log(cnt);
				price = price * cnt;
				
				$(this).html(price.toLocaleString("ko-KR"));
			});
			
			$(".cancelPay").click(function(){
				let ol_num = $(this).parent().parent().children(".order_num").children(".num").html();
				console.log(ol_num);
				let imp_uid = $(this).parent().parent().children(".order_num").children(".imp_uid").html();
				console.log(imp_uid);
				let amount = $(this).parent().parent().children(".price").html().replace(/,/g, "");
				console.log(amount);
				
				 $.when(cancelPay(imp_uid, amount)).done(function(result){
					 if(result == '성공'){
						console.log(result);
						
						location.href = "/order/updateState?ol_num="+ol_num;
						
						alert("환불 처리 되었습니다.");
					 } else {
						 alert("시스템 에러가 발생했습니다.");
					 }
				 });
			});
			
			function cancelPay(imp_uid, amount){
				var def = new $.Deferred();
				$.ajax({
					url: "/order/paymentCancel",
					type: "post",
					data: {
						imp_uid: imp_uid,
						amount: amount
					},
					dataType: "text",
					success: function(data){
						if(data=='결제 취소'){
							def.resolve("성공");
						} else {
							def.reject("실패");
						}
					}
				});
				
				return def.promise();
			}
			
			$(".paginate_button a").click(function(e) {
				e.preventDefault();/* a태그는 원래 클릭하면 이동하는 기능이 있잖아 그 기능을 해제하고! */
				$("#f_order").find("input[name='pageNum']").val($(this).attr("href"));
				goPage();
			});
			
			function goPage(){
							
				$("#f_order").attr({
					"method" : "get",
					"action" : "/order/orderList"
				});
				$("#f_order").submit();
			}
		});
	</script>
	</head>
	<body>
		<form id="updateState"> 
			<input type="hidden" name="ol_num" id="ol_num" value=""/>
		</form>
		<div class="container">
			<h2>주문 내역</h2>
			<hr>
			
			<form id="f_order">
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}"/>
				<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
			</form>
			
			<c:choose>
				<c:when test="${not empty login }">
					<table class="table table-striped">
						<thead>
							<tr>
								<th class="text-center">주문 번호</th>
								<th class="text-center">이미지</th>
								<th class="text-center">제품명</th>
								<th class="text-center">제품 가격</th>
								<th class="text-center">주문 날짜</th>
								<th class="text-center">주문 상테</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty order }">
									<c:forEach var="order" items="${order }">
										<tr class="text-center">
											<td class="order_num">
												<span class="num">${order.ol_num }</span>
												<span class="imp_uid">${order.ovo.imp_uid }</span>
											</td>
											<td>
												<img src="${order.ivo.i_img }"/>
											</td>
											<td>
												${order.ivo.i_name } x <span class="cnt">${order.ol_quan }</span>
											</td>
											<td class="price">${order.ivo.i_price}</td>
											<td>${order.ovo.order_day }</td>
											<td class="state">
												${order.ol_state }
												<br>
												<c:if test="${order.ol_state == '결제 완료' }">
													<button type="button" class="cancelPay">환불</button>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="6" class="text-center">주문내역이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<%-- =================== 페이징 출력 시작 =============== --%>
					<div class="text-center">
						<ul class="pagination">
							<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인. -->
							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous">
									<a href="${pageMaker.startPage -1}">Previous</a>
								</li>
							</c:if>
							
							<!-- 바로가기 번호 출력 -->
							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':''}"><!-- 참이면 'active'클래스명 추가 거짓이면 '' -->
								<a href="${num}">${num}</a>
							</li>
							</c:forEach>
							
							<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인. -->
							<c:if test="${pageMaker.next}">
								<li class="paginate_button next">
									<a href="${pageMaker.endPage +1}">Next</a>
								</li>
							</c:if>
						</ul>
					</div>
					<%-- ================== 페이징 출력 종료 ================ --%>
				</c:when>
				<c:otherwise>
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