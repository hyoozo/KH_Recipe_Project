<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/ccd4ff9cee.js" crossorigin="anonymous"></script>
<link href="/resources/include/css/postList-1.css" rel="stylesheet">
<link href="/resources/include/css/community.css" rel="stylesheet">



<script type="text/javascript">
	$(function() {
		
		ytbShow();

		
		//디테일 페이지 이동
		$(".goDetail").click(function() {
			let c_no = $(this).parents("tr").attr("data-num");
			console.log("c_no1 : " + c_no);
			$("#c_no").val(c_no);
			console.log("c_no2 : " + c_no);
			
			$("#detailForm").attr({
				"method":"get",
				"action":"/community/postDetail"
			})
			$("#detailForm").submit();
		})
		
		$(".paginateBtn a").click(function(e) {
			e.preventDefault();
			$("#c_search")
		})
		
		$("#postList-insert").click(function() {
			location.href="/community/insertForm";
		})
		
		
		//글쓰기 버튼 클릭 (로그인 유무 확인)
 		let useAfter = "${useAfter}";
		console.log("useAfter:" + useAfter);
		if (useAfter == "error") {
			useAfter = "";
			if(confirm("로그인 후에 이용가능합니다. 로그인 하시겠습니까?") == true) {
				result = location.href="/member/loginForm";
			} else {
				return;
			}
		}
		
		//검색
		let word = "<c:out value='${communityVO.keyword}' />";
		let value = "";
		if(word!="") {
			$("#keyword").val("<c:out value='${communityVO.keyword}' />");
			$("#search").val("<c:out value='${communityVO.search}' />");
			
			if($("#search").val() != 'c_comment') {
				if($("#search").val == 'c_title') value = "#list tr td.goDetail";
				else if($("#search").val() == 'c_writer') value = "#list tr td.listWriter";
				
	
				$(value+":contains('" + word + "')").each(function() {
					let regex = new RegExp(word,'gi');
					$(this).html($(this).html().replace(regex,"<span class='required'>" + word + "</span>"));
				});
			}
		}
		
		//enter 제거
		$("#keyword").bind("keydown",function(event) {
			if(event.keyCode == 13) {
				event.preventDefault();
			}
		});
		
		//검색 대상 변경 시
		$("#search").change(function() {
			if($("#search").val() == "all") {
				$("#keyword").val("전체 데이터 조회합니다.");
			} else if($("#search").val() != "all") {
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
		
		//검색 버튼 클릭 이벤트
		$("#comSearchBtn").click(function() {
			if($("#search").val() != "all"){
				if(!chkSearch("#keyword","검색어를")) return;
			}
			goPage();
		})
		
		
		//검색 처리 함수
		function goPage() {
			if($("#search").val() == "all") {
				$("#keyword").val("");
			}
			
			$("#c_search").attr({
				"method":"get",
				"action":"/community/postList"
			});
			$("#c_search").submit();
		}
		
		
		// 페이징
		$(".paginateBtn a").click(function(e) {
			e.preventDefault();
			$("#c_search").find("input[name='pageNum']").val($(this).attr("href"));
			goPage();
		})
		
		
		//검색어 확인 
		function chkSearch(item, msg) {
			if($(item).val().replace(/\s/g,"")=="") {
				alert(msg + " 입력해주세요 ");
				$(item).val("");
				$(item).focus();
				return false;
			} else {
				return true;
			}
		}
		
		function ytbShow() {
			console.log("확인1");
			
			let url = "/ComYtb";

			$.getJSON(url, function(data) {	
				
				$("#ytb1").attr("src",data[0].cy_ytb);
				$("#ytb2").attr("src",data[1].cy_ytb);
				$("#ytb3").attr("src",data[2].cy_ytb);
				
			})
		}
		
		//디테일 페이지 이동
		$(".mngDetail").click(function() {
			let cm_no = $(this).parents("tr").attr("data-num");
			$("#cm_no").val(cm_no);

			$("#detailForm").attr({
				"method":"get",
				"action":"/community/mngPostDetail"
			})
			$("#detailForm").submit();
		})
		
		
		$(".paginateBtn a").click(function(e) {
			e.preventDefault();
			$("#c_search")
		})
		
	});
</script>

</head>
<body>
	<div>
		<h2 class="headerH2">커뮤니티 게시판</h2>

		<form id="detailForm">
			<input type="hidden" id="c_no" name="c_no">
			<input type="hidden" id="cm_no" name="cm_no">
		</form>
	
		<div class="youtube-container">
			<div class="youtube-section">
		 		<div>
					<iframe width="280" height="157.5" id="ytb1" ></iframe>
				</div>
				<div>
					<iframe width="280" height="157.5" id="ytb2"></iframe>
				</div>
				<div>
					<iframe width="280" height="157.5" id="ytb3"></iframe>
				</div>
				 
			</div>
		</div>
		
		<div class="search-box">
			<form id="c_search">
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
				<div class="inline-box">
					<select name="search" id="search">
						<option value="all">전체</option>
						<option value="c_title">제목</option>
						<option value="c_writer">작성자</option>
						<option value="c_comment">내용</option>
					</select> 
					<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" />
					<button type="button" id="comSearchBtn"></button>
				</div>
			</form>
		</div>
	
		
	
		<div class="board-container">
			<table class="board-table">
				<thead>
					<tr>
						<th id="b_num">글 번호</th>
						<th id="b_title">제 목</th>
						<th id="b_writer">작성자</th>
						<th id="b_categori">카테고리</th>
						<th id="b_date">등록일</th>
						<th id="b_views">조회수</th>
					</tr>
				</thead>

				<tbody id="list">
				
				<c:choose>
					<c:when test="${not empty MngPostList}">
						<c:forEach var="MngPostList" items="${MngPostList}" varStatus="status">
							<tr  data-num="${MngPostList.cm_no}" style="background-color: blue;">
								<td class="fontRR">공지시항</td>
								<td class="mngDetail fontR">${MngPostList.cm_title}</td>
								<td class="fontR">${MngPostList.cm_writer}</td>
								<td class="fontR">공지</td>
								<td class="fontR">${MngPostList.cm_reg_date}</td>
								<td class="fontR">${MngPostList.cm_readcnt}</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>

					<c:choose>
						<c:when test="${not empty postList}">
							<c:forEach var="postList" items="${postList}" varStatus="status">
								<tr data-num="${postList.c_no}">
									<td>${postList.c_no}</td>
									<td class="goDetail">${postList.c_title}</td>
									<td class="listWriter">${postList.c_writer}</td>
									<td>${postList.c_category}</td>
									<td>${postList.c_reg_date}</td>
									<td>${postList.c_readcnt}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td>더 이상 게시물이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	
		<div id="pageBox">
			<ul class="pageUl">
				<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인 -->
				<c:if test="${pageMaker.prev}">
					<li class="paginateBtn">
						<a href="${pageMaker.startPage-1}">Previous</a>
					</li>
				</c:if>
	
				<!-- 바로가기 번호 출력 -->
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="paginateBtn ${pageMaker.cvo.pageNum == num ?'active':''}">
						<a href="${num}">${num}</a>
					</li>
				</c:forEach>
	
				<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인 -->
				<c:if test="${pageMaker.next}">
					<li class="paginateBtn">
						<a href="${pageMaker.endPage+1}">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
		<div class="writh-box">
			<input type="button" id="postList-insert" value="글쓰기">
		</div>
	
		
	</div>
	

</body>
</html>