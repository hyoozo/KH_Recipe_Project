<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page trimDirectiveWhitespaces="true" %>
<!-- <link href="/resources/include/css/member.css" rel="stylesheet"> -->
<script type="text/javascript" src="/resources/include/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
<link href="/resources/include/css/member.css" rel="stylesheet">

<script type="text/javascript">
$(function() {
	$("#login-info").show();
	
	$(".myPage-update").click(function() {
		location.href="/member/updateForm";
	})
	
	let m_num = ${login.m_num};
	$("#mPageList").hide();
	
	//레시피 버튼 클릭
	$(document).on("click","#reciGood",function() {
		showRecipe(m_num);
	})
	//커뮤니티 버튼 클릭
	$(document).on("click","#insertList",function() {
		showCommunity(m_num);
	})
	//개인정보 출력
	$(document).on("click",".mypageTop",function() {
		showInfo();
	})
	
	
	//레시피 보여주기
	function showRecipe(m_num) {
		let url = '/mypage/recipeCheck/' + m_num;
		
		reset();
		$.getJSON(url, function(data) {
			if(data == "") {
				receipeResultFail();
			} else {
				$(data).each(function() {
					let rcp_seq = this.rcp_seq;
					let rcp_nm = this.rcp_nm;
					let rcp_pat2 = this.rcp_pat2;
					let info_eng = this.info_eng;
					let rcp_parts_dtls = this.rcp_parts_dtls;
					receipeResult(rcp_seq,rcp_nm,rcp_pat2,info_eng,rcp_parts_dtls);
				})
			};
		}).fail(function() {
			alert("정보를 불러오는데 실패하였습니다. 잠시 후에 다시 시도해 주세요.");
		});
	}
	
		function receipeResult(rcp_seq,rcp_nm,rcp_pat2,info_eng,rcp_parts_dtls) {	
			let $tb = $("#commTb");
			
			let con = '<tr id="data" data-num = "' + rcp_seq + '">'
			let conn = 
					'<td class="tdm1Rec tdm1">' + rcp_nm + '</td>' +
					'<td class="tdm2">' + rcp_pat2 + '</td>' +
					'<td class="tdm3">' + info_eng + ' kcal</td>' +
					'<td class="tdm4">' + rcp_parts_dtls + '</td>' +
				'</tr>';
			
			let col = $(con).html(conn);
			
			$tb.append(col);
			
			$("#commHe").hide();
			$("#recHe").show();
			
			$(".tdm1Rec").click(function() {
				let rcp_seq = $(this).parents("tr").attr("data-num");
				$("#rcp_seq").val(rcp_seq);
				
				$("#myPageSubmit").attr({
					"method" : "get",
					"action" : "/recipe/recipeDetail"
				});
				$("#myPageSubmit").submit();
			})
		}
	//레시피 정보 없을 시
	function receipeResultFail() {
		let $tb = $("#commTb");
		
		let con = '<tr id="data" data-num = "">'
		let conn = 
				'<p>정보가 없습니다</p>' +
			'</tr>';
		
		let col = $(con).html(conn);
		
		$tb.append(col);
		
		$("#commHe").hide();
		$("#recHe").show();
	}
		
	function showCommunity(m_num) {
			
			let url = '/mypage/commCheck/' + m_num;
			
			reset();
			
			$.getJSON(url, function(data) {
				if(data == "") {
					communityResultFail();
				} else {
					$(data).each(function() {
						let c_no = this.c_no;
						let c_title = this.c_title;
						let c_category = this.c_category;
						let c_readcnt = this.c_readcnt;
						let c_reg_date = this.c_reg_date;
						communityResult(c_no,c_title,c_category,c_readcnt,c_reg_date);
					})
				};
			}).fail(function() {
				alert("정보를 불러오는데 실패하였습니다. 잠시 후에 다시 시도해 주세요.");
			});
	}
	function communityResult(c_no,c_title,c_category,c_readcnt,c_reg_date) {
			let $tb = $("#commTb");
			
			let con = '<tr id="data" data-num = "' + c_no + '">'
			let conn =
					'<td class="tdm1Com tdm1">' + c_title + '</td>' +
					'<td class="tdm2">'+ c_category + '</td>' +
					'<td class="tdm3">' + c_readcnt + '</td>' +
					'<td class="tdm4">' + c_reg_date + '</td>' +
				'</tr>';
				
			let col = $(con).html(conn);
			
			$tb.append(col);
			
			$("#recHe").hide();		
			$("#commHe").show();
			
			//디테일 페이지 이동
			$(".tdm1Com").click(function() {
				let c_no = $(this).parents("tr").attr("data-num");
				$("#c_no").val(c_no);
					
				$("#myPageSubmit").attr({
						"method":"get",
						"action":"/community/postDetail"
				})
				$("#myPageSubmit").submit();
			})			
	}
	function communityResultFail() {
		let $tb = $("#commTb");
		
		let con = '<tr id="data" data-num = "">'
		let conn =
				'<p>정보가 없습니다</p>'
			'</tr>';
			
		let col = $(con).html(conn);
		
		$tb.append(col);
		
		$("#recHe").hide();		
		$("#commHe").show();
	}
	
	
	function reset() {
		$("#login-info").hide();
		$("#mPageList").show();
		$("#commTb").empty();
	}
	
	function showInfo() {
		$("#mPageList").hide();
		$("#login-info").show();
	}			

})
</script>

<body>
	
	<div class="myPage-container">
		<div class="myPage-top1">
			<form id="myPageSubmit">
				<input type="hidden" id="c_no" name="c_no">
				<input type="hidden" id="rcp_seq" name="rcp_seq">
			<div class="page1">
				<input type="hidden" name="n_num" id="m_num" value="${login.m_num}">
				<div class="mypageTop btn btn-default" role="button">
					${login.m_name} 님
				</div>
				<input type="button" class="myPage-update btn btn-default" value="회원 정보 수정" />
				<div id ="orderList" class="btn btn-default" onclick="location.href='/order/orderList'">주문 내역</div>
				<div id="reciGood" class="btn btn-default">레시피 좋아요</div>
				<div id="insertList" class="btn btn-default" >작성한 글 조회</div>
			</div>
			</form>
		</div>
		
		<div class="mPageList">
		<div class="ReceipeContainer">
			<table id="login-info" class="table table-hover"  style="width: 44%;height: 300px;">
				<tbody>
					<tr>
						<td class="tdm12"><span>아이디 : </span></td>
						<td class="tdm22"><span>${login.m_id}</span></td>
					</tr>
					<tr>
						<td class="tdm12"><span>이름 : </span></td>
						<td class="tdm22"><span>${login.m_name}</span></td>
					</tr>
					<tr>
						<td class="tdm12"><span>전화번호 : </span></td>
						<td class="tdm22"><span>${login.m_phone}</span></td>
					</tr>
					<tr>
						<td class="tdm12"><span>이메일</span></td>
						<td class="tdm22"><span>${login.m_email}</span></td>
					</tr>
					<tr>
						<td class="tdm12"><span>주소 : </span></td>
						<td class="tdm22"><span>${login.m_address}</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		</div>



		<div id="mPageList" class="mPageList">
		<div id="ReceipeContainer" class="ReceipeContainer">
		
			<table class="table table-hover" style="width: 70%;">
			
				<thead id="recHe" class="tthd">
					<tr>
						<th class="thm1">메뉴명</th>
						<th class="thm2">요리 종류</th>
						<th class="thm3">열량</th>
						<th class="thm4">재료</th>
					</tr>
				</thead>
				
				<thead id="commHe" class="tthd">
					<tr>
						<th class="thm1">제목</th>
						<th class="thm2">카테고리</th>
						<th class="thm3">조회수</th>
						<th class="thm4">날짜</th>
					</tr>
				</thead>

				<tbody id="commTb">
				
					
					
				</tbody>
				
			</table>
		</div>
		</div>
	</div>
</body>
</html>