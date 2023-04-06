<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/resources/include/js/member.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<script type="text/javascript" src="/resources/include/js/jquery-3.6.3.min.js"></script>

<script type="text/javascript">
$(function() {
	
	let m_num = ${login.m_num};
	
	//레시피 버튼 클릭
	$(document).on("click","#reciGood",function() {
		showRecipe(m_num);
	})
	
	//레시피 보여주기
	function showRecipe(m_num) {
			
			let url = '/mypage/recipeCheck/' + m_num;
			
			$.getJSON(url, function(data) {
				$(data).each(function() {
					let rcp_seq = this.rcp_seq;
					let rcp_nm = this.rcp_nm;
					let rcp_pat2 = this.rcp_pat2;
					let info_eng = this.info_eng;
					let rcp_parts_dtls = this.rcp_parts_dtls;
					receipeResult(rcp_seq,rcp_nm,rcp_pat2,info_eng,rcp_parts_dtls);
				});
			}).fail(function() {
				alert("정보를 불러오는데 실패하였습니다. 잠시 후에 다시 시도해 주세요.");
			});
		}
		function receipeResult(rcp_seq,rcp_nm,rcp_pat2,info_eng,rcp_parts_dtls) {
			$("#data").attr("num",rcp_seq);
			$("#tdm1").html(rcp_nm);
			$("#tdm2").html(rcp_pat2);
			$("#tdm3").html(info_eng);
			$("#tdm4").html(rcp_parts_dtls);
		}

})
</script>

<body>
	
	<div class="myPage-container">
		<div class="myPage-top1">
			<form id="myPageSubmit">
			<div class="page1">
				<div class="myPage"  style="background-color:red;">
					<h5><span>${login.m_name} 님</span></h5>
					<input type="hidden" name="n_num" id="m_num" value="${login.m_num}">
					<input type="button" value="냉장고" />
					<input type="button" class="myPage-update" value="수정" />
				</div>
				<div id="reciGood" style="background-color:blue;">레시피 좋아요</div>
				<div id="storeGood" style="background-color:yellow;">스토어 좋아요</div>
				<div style="background-color:pink;" onclick="location.href='/order/orderList'">주문 내역</div>
				<div id="insertList" style="background-color:#92B3B7;">작성한 글 조회</div>
			</div>
			</form>
		</div>

		
		<div id="ReceipeContainer">
			<table>
			
				<thead>
					<tr>
						<th>메뉴명</th>
						<th>요리 종류</th>
						<th>열량</th>
						<th>재료</th>
					</tr>
				</thead>
				
				<thead>
					<tr>
						<th>메뉴명</th>
						<th>요리 종류</th>
						<th>열량</th>
						<th>재료</th>
					</tr>
				</thead>
				



				<tbody>
					<tr id="data" >
						<td id="tdm1"></td>
						<td id="tdm2"></td>
						<td id="tdm3"></td>
						<td id="tdm4"></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		
		
	</div>
</body>
</html>