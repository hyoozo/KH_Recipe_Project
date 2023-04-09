<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="/resources/include/js/common.js"></script>
<link href="/resources/include/css/community.css" rel="stylesheet">

<script type="text/javascript">
	$(function() {
		
		//댓글
		//불러오기
		let c_no = ${postDetail.c_no};
		listAll(c_no);
		
		//글 입력
		$(document).on("click","#replyInsertBtn",function() {
			let insertURL = "/comReply/replyInsert";
			
			let value= JSON.stringify({
				cr_writer : $("#insertWriter").val(),
				cr_content : $("#insertContent").val(),
				c_no : $("#c_no").val(),
				m_num : $("#replyM_num").val()
			});
			console.log("value : " + value);
			{}
			$.ajax({
				url:insertURL,
				type:"post",
				headers : {
					"Content-Type":"application/json"
				},
				dataType:"text",
				data : value,
				error:function(xhr, textStatus, errorThrown) {
					alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
			
				},
				beforeSend: function(){
					if (!checkForm("#insertWriter","작성자를"))		return false;
					else if (!checkForm("#insertContent","댓글번호를"))return false;
				},
				success : function(result) {
					if(result == "SUCCESS") {
						alert("댓글 등록이 완료되었습니다.");
						reset($("#insertContent"));
						$("#replyList").html("")
						listAll(c_no);

					}
				}
			})

		})
		
		
		//댓글 보여주기 1
		function listAll(c_no) {
			console.log("확인1");
			
			let url = "/comReply/replyList/" + c_no;

			$.getJSON(url, function(data) {
				$(data).each(function() {
					let cr_no = this.cr_no;
					let cr_writer = this.cr_writer;
					let cr_content = this.cr_content;
					cr_content = cr_content.replace(/(\r\n|\r|\n)/g, "<br />");
					let c_no = this.c_no;
					let m_num = this.m_num;
					template(cr_no,cr_writer,cr_content,m_num);
				});
			}).fail(function() {
				alert("댓글 목록을 불러오는데 실패하였습니다. 잠시 후에 다시 시도해 주세요.");
			});
		}
		//댓글 보여주기 2
		function template(cr_no,cr_writer,cr_content,m_num) {
			
			let $div = $('#replyList');
			
			//let $element = $('#replyInner').clone().removeAttr('id');
			//$element.addClass("reply");

			
			var con	=	'<div id="replyInner">'+
							'<div id="par">' + 
								'<div>'+
									'<h4>'+
										'<input type="hidden" id="reListM_num" value="' + m_num + '" />' + 
										'<input type="hidden" id="reListCr_no" value="' + cr_no + '" />' + 
										'<span id="reListCr_wr"> <i class="fa-solid fa-reply fa-rotate-180"></i>' + cr_writer + '</span>' +
									'</h4>' +
									'<div class="parBtn-box">' +
										'<button type="button" id="reUpdateBtn" class="reBtnHide">수정</button>'+
										'<button type="button" id="reDeleteBtn" class="reBtnHide">삭제</button>'+
									'</div>' +
								'</div>' +
								'<div id="reListCr_co">' + cr_content + '</div>' +
							'</div>' +
							'<div id="replyInnerAdd"></div>' +
						'</div>';
			var div = $("<div />").html(con);

			$div.append(div);
			
			replyHide();			
		}
		
		function replyHide() {
			let comNum = $("#reListM_num").val();
			let memNum = $("input[name=m_num]").val();
			
			$(".reBtnHide").hide();
			
			if(comNum == memNum) {
				$(".reBtnHide").show();
			}
		}
		
		function reset(set) {
			set.val("");
		}
		
		//삭제버튼 클릭
		$(document).on("click","#reDeleteBtn",function() {
			let c_no = $("#c_no").val();
			let parCr = $(this).parents("#par").find("#reListCr_no");
			let cr_no = parCr.val();
			deleteBtn(cr_no,c_no);
		})
		
		
		//수정폼버튼
		$(document).on("click","#reUpdateBtn",function() {
			//입력 폼 지우기
			det = $("#replyForm").clone();
			$("#replyForm").hide();

			//수정폼 위치지정
			let par = $(this).parents("#par");
			let add = par.siblings("#replyInnerAdd");
			
			//작성자이름 불러오기
			let name = par.find("#reListCr_wr");
			let writer = name.text();
			
			console.log("writer:" + writer);
			
			//수정하기 버튼 -> 취소 버튼
			$(this).removeAttr('id','reUpdateBtn');
			$(this).attr('id','reCancelBtn');
			$(this).html('취소');
		
			replyUpdate(add,writer);
		})
		
		function replyUpdate(add,writer) {
			
			var conu = 	'<form>' +
							'<div>' +		
								'<table>' +
									'<tbody>' +
										'<tr>' +
											'<td>작성자</td>' +
											'<td>' +
												'<input type="text" value="' + writer + '" readonly/>' +
											'</td>' +
											'<td>' +
												'<button type="button" id="updateBtn">수정</button>' +
											'</td>' +
										'</tr>' +
										'<tr>' +
											'<td>댓글 내용</td>' +
											'<td>' +
											'<input type="text" id="insertContent" />' +
											'</td>' +
										'</tr>' +
									'</tbody>' +
								'</table>' +
							'</div>' +
						'</form>';
			var divu = $("<div />").html(conu);
						
			add.append(divu);
		}

		
		//수정 ajax
		$(document).on("click", "#updateBtn", function(){
		
			$.ajax({
				url:'/comReply/replyUpdate',
				type:'post',
				headers : {
					"Content-Type":"application/json"
				},
				data:JSON.stringify({
					cr_content : $("#insertContent").val(),
					cr_no : $("#reListCr_no").val(),
					c_no : $("#c_no").val(),
					m_num : $("#reListM_num").val()
				}), 
				dataType:'text', 
				error: function(xhr, textStatus, errorThrown) { 
					alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
				}, 
				success:function(result){
					console.log("result: " + result);
					if(result == "SUCCESS"){
						alert("댓글 수정이 완료되었습니다.");
						reset($("#insertWriter"));
						reset($("#insertContent"));
						$("#replyList").html("")
						replyUpdateReset();
						listAll(c_no);
					}
				}
			});
		})
		
		
		$(document).on("click","#reCancelBtn",function() {
			//입력 폼 나오기
			$("#replyContainer").append(det);
			
			
			//취소 버튼 -> 수정하기 버튼
			$(this).attr('id','reUpdateBtn');
			$(this).html('수정');
			
			//리셋
			$("#replyList").each(function(){
				$("#replyInnerAdd").html("");
			});
		})
		
		
		
		function deleteBtn(cr_no,c_no){
			if (confirm("선택하신 댓글을 삭제하시겠습니까?")) {
				$.ajax({
					url : '/comReply/replyDelete/' + cr_no, 
					type : 'delete',        
					headers : {
						"X-HTTP-Method-Override" : "DELETE"
					},
					dataType : 'text',
					error: function(xhr, textStatus, errorThrown) {
						alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
					},
					success : function(result) {
						console.log("delete result: " + result);
						if (result == 'SUCCESS') {
							alert("댓글 삭제가 완료되었습니다.");
							$("#replyList").html("")
							listAll(c_no);
						}
					}
				});
			} else {
				return;
			}
		}
		

	})
</script>

<body>
<h3>댓글</h3>
<div id="replyContainer">
	<form id="replyForm" class="replyForm">
		<div>
			<input type="hidden" id="replyM_num" value="${login.m_num}"/>
			<table>
				<tbody>
					<tr>
						<!-- <td>작성자</td> -->
						<td>
							<input type="text" name="cr_writer" id="insertWriter" value="${login.m_name}" readonly/>
							<!-- readonly로 이름 변경 안되게 막아놨지만 form 전송은 됨. -->
						</td>
					</tr>
					<tr>
				<!-- 		<td>댓글 내용</td> -->
						<td>
							<input type="text" name="cr_content" id="insertContent" placeholder="댓글을 남겨보세요."/>
						</td>
						<td>
							<button type="button" id="replyInsertBtn">댓글 입력</button>
						</td>
					</tr>	
				</tbody>
			</table>
		</div>
	</form>
</div>
	
	<div id="replyList">

	</div>

</body>
</html>