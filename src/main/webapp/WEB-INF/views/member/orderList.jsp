<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

	<style>
		img{
			width: 350px;
			height: 350px;
		}
		.orderList{
			overflow: hidden;
		}
	</style>
	
	<script type="text/javascript">
		$(function(){
			$.ajax({
				url:"/order/orderList",
				type:"post",
				data: ${login.m_num},
				dataType:"json",
				success: function(data){
					if(data != null){
						$(data).each(function(){
							let $table = $("<table>");
						});
					} else {
						alert("시스템 오류가 발생했습니다.");
					}
				}
			});
		});
	</script>
	</head>
	<body>
		<div class="container">
			<h2>주문 내역</h2>
			<hr>
			
			<table class="table table-striped">
				<tr>
					<th>주문 번호</th>
					<th>이미지</th>
					<th>제품명</th>
					<th>제품 가격</th>
					<th>주문 날짜</th>
					<th>주문 상테</th>
				</tr>
				<tr>
				<c:forEach>
					
				</c:forEach>
			</table>
		</div>
	</body>
</html>