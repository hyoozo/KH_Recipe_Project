<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/resources/include/js/jquery-3.6.3.min.js"></script>

<script type="text/javascript">
	$(function() {
		
		//댓글
		//불러오기
		let c_no = ${postDetail.c_no};
		listAll(c_no);
		
		console.log("c_no:" + ${postDetail.c_no});
		
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
			
			var con	=	'<div id="replyInner">'+
							'<div id="par">' + 
								'<div>'+
									'<h4>'+
										'<input type="hidden" id="reListM_num" value="' + m_num + '" />' + 
										'<input type="hidden" id="reListCr_no" value="' + cr_no + '" />' + 
										'<span id="reListCr_wr"> <i class="fa-solid fa-reply fa-rotate-180"></i>' + cr_writer + '</span>' +
									'</h4>' +
									'<div class="parBtn-box">' +
										'<button type="button" id="reDeleteBtn" class="reBtnHide">삭제</button>'+
									'</div>' +
								'</div>' +
								'<div id="reListCr_co">' + cr_content + '</div>' +
							'</div>' +
							'<div id="replyInnerAdd"></div>' +
						'</div>';
			var div = $("<div />").html(con);

			$div.append(div);
			
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
	<div id="replyList">
		
	</div>

</body>
</html>