<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/resources/include/js/member.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<link href="/resources/include/css/member.css" rel="stylesheet">
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<style type="text/css">
	.page1 {
		width: 312px;
		height: 155px;
		
		display: grid;
    	grid-template-columns: 380px auto;
    	grid-template-rows: 155pxpx;
    	
    	text-align:center;
	}
	
	.maPage{
		grid-row: 1 / 3;
   			grid-row-start: 1;
    		grid-row-end: 3;
	}
	
	.reciGood {
		width:192px;
		height:90px;
		
	}
	
	.storeGood {
		width:192px;
		height:90px;

		float:right;
	}
	
	.comGood {
		width:192px;
		height:90px;

	}
	
	.orderList {
		width:275px;
		height:23px;

	}
	
	.insertList {
		width:275px;
		height:23px;
	}
</style>
<body>
	<div class="myPage-container">
		<div class="myPage-top1">
			<div class="page1">
				<div class="myPage"  style="background-color:red;">
					<h5>${login.m_name} 님</h5>
					<input type="button" value="냉장고" />
					<input type="button" class="myPage-update" value="수정" />
				</div>
				<div class="reciGood" style="background-color:blue;">레시피 좋아요</div>
				<div class="storeGood" style="background-color:yellow;">스토어 좋아요</div>
				<div class="comGood" style="background-color:green;">커뮤니티 좋아요</div>
				<div style="background-color:pink;" onclick="location.href='/order/orderList'">주문 내역</div>
				<div class="insertList" style="background-color:#92B3B7;">작성한 글 조회</div>
			</div>
		</div>
		
		<div>
		
			<table>
				<thead>
					<tr>
						<th>메뉴명</th>
						<th>요리종류</th>
						<th>열량</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th></th>
						<th></th>
						<th></th>					
				</tbody>
			</table>
			
			<table>
				<thead>
					<tr>
						<th>메뉴명</th>
						<th>요리종류</th>
						<th>열량</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th></th>
						<th></th>
						<th></th>					
				</tbody>
			</table>
			
			<table>
				<thead>
					<tr>
						<th>메뉴명</th>
						<th>요리종류</th>
						<th>열량</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th></th>
						<th></th>
						<th></th>					
				</tbody>
			</table>
			
		</div>
	</div>
</body>
</html>