$(function(){
	let ingredientData = [];
	let memberNum = Number($("#sessionId").val());
	
	memoSelect();
	
	$.getJSON("/igr/igrList", function(data){
		ingredientData = data;
		if(ingredientData.length === 0){
			let $div = $('.ingredient-container');
				$div.html("현재 준비된 재료가 없습니다.").css({'display':'flex','justify-content': 'center',
														'align-items': 'center','font-size':'20px'});
		}
		
		// 재료 화면에 재료 리스트로 재료 버튼 만들기
		ingredientData.forEach(ingredient => {
		    const $button = $(`<button value="${ingredient.igr_num}" id="ingr-btn-${ingredient.igr_num}" class="igrBtn">${ingredient.igr_name}</button>`);
		    $('.ingredient-container').append($button);
		})
		
		// 재료 화면 내 재료 버튼 클릭 시 이벤트
		$('.igrBtn').on("click", function(){
			 console.log("재료버튼 클릭됨.")
		    const igr_num = $(this).val();
		    const igr_name = $(this).text();
			fridgeSelect(igr_num, memberNum,igr_name);
		})
		
		// 냉장고 화면에 생성 된 버튼에 대한 클릭 이벤트시 생성
		$(document).on("click", ".rfgBtn" , function(){
		    console.log("냉장고버튼 클릭됨.")
		    const igr_num = Number($(this).val());
		    deleteIgrList(memberNum,igr_num);
		});
		
		/*회원에 맞는 냉장고 테이블 재료 뿌리기 */
		memberIgrList(ingredientData);
		
		$('#memoBtn').on('click', function(){
			$('.memo-bg').remove();
			let memo_content = $('#content-memo').val();
			console.log("insert")
			$.ajax({
				url: "/refrigerator/memoInsert",
				type: "post",
				data: {memo_content : memo_content},
				success:function(data){
					console.log(data)
					$('#content-memo').html(data);
					$('.memo-bg').addClass('memo-none');
				},
				error: function(){
					$('#content-memo').html("저장에 실패하였습니다.");
				},
			})
		})
		$('#content-memo').on('change',function(){
			const memo_content = $('#content-memo').val();
			console.log("#content-memo 수정함>>>"+memo_content);
			
			if(memo_content == ""){
				console.log("delete")
				$.ajax({
					url: "/refrigerator/memoDelete",
					type: "post",
					success:function(){
						$('.memo-bg').removeClass('memo-none');
					},
					error: function(){
						$('#content-memo').html("삭제에 실패하였습니다.");
					},
				})
			}else if (memo_content != "") {
				console.log("update")
				$.ajax({
					url: "/refrigerator/memoUpdate",
					type: "post",
					data: {memo_content : memo_content},
					success:function(data){
						$('#content-memo').html(data);
						$('.memo-bg').addClass('memo-none');
					},
					error: function(){
						$('#content-memo').html("수정에 실패하였습니다.");
					},
				})
			}
		})
	}).fail(function(err){
		console.error(err);
	});/** 상당 getJSON 종료 */
	
	let input = document.getElementById("searchInput");
	let button = document.getElementById('searchBtn');
	input.focus()
	input.addEventListener('keydown',function(e){
	    if(e.key === "Enter"){
	      filter();
	    }
	})
	button.addEventListener('click', filter());

}); /** *************상당 function 종료 *************** **/

function filter(){
	const item = document.getElementsByClassName('igrBtn');
	const input = document.getElementById('searchInput').value.toUpperCase();
	let name;
	for(let i=0; i < item.length; i++){
		name = item[i].innerHTML;
		if(name.indexOf(input) > -1){
			item[i].style.display = 'grid';
		}else{
			item[i].style.display = 'none';
		}
	}	
	
}       
		
function insertRefridge(sessionId, igr_num) {
	let requestData = {
		m_num : sessionId,
		igr_num: igr_num
	};
	$.ajax({
		url: "/refrigerator/insert",
		data: requestData,
		type: "post",
		error: function(){
			$(".rfg-container").html("저장에 실패하였습니다.");
		},
		success: function(){

		}
	});
}

function deleteIgrList(memberNum,igr_num){
	 $.ajax({
		url: "/refrigerator/memberIgrDelete",
		data: {m_num:memberNum,
			   igr_num:igr_num},
		type: "get",
		error: function(){
			alert("재료를 삭제할 수 없습니다. 관리자에게 문의하세요.")
		},
		success: function(){
			$(`#ingr-btn-${igr_num}`).addClass('clearBtn')
			 $(`#ingr-btn-${igr_num}`).removeClass('removeBtn')
	        $(`#ref-btn-${igr_num}`).remove();
		}
	})
}

function memberIgrList(){
	$.ajax({
		url: "/refrigerator/memberIgrList",
		type: "get",
		dataType: "json",
		error: function(){
			$(".rfg-container").html("리스트를 불러올 수 없습니다.");
		},
		success: function(data){
			console.log("JS memberIgrList 호출 완료")
			$(data).each(function(){
				 const $button = $("<button value=" + this.igr_num.igr_num + " id=ref-btn-"+this.igr_num.igr_num +" class='rfgBtn'>"+this.igr_num.igr_name+"</button>");
				 $('.rfg-container').append($button)
				 $(`#ingr-btn-${this.igr_num.igr_num}`).addClass('removeBtn');
			})
		}
	})
}

function fridgeSelect(igr_num,memberNum,igr_name){
	$.ajax({
		url: "/refrigerator/fridgeSelect",
		data: {m_num:memberNum,
			   igr_num:igr_num},
		type: "get",
		error: function(err){
			console.log(err);
		},
		success: function(resultData){
			console.log("fridgeSelect=>"+resultData);
			// 냉장고 select 후 count가 없으면 냉장고에 insert/ 있으면 냉장고 재료 삭제
			if(resultData == 0){
				let sessionId = $(`#sessionId`).val();
		        // 해당 재료 버튼 css
		        $(`#ingr-btn-${igr_num}`).addClass('removeBtn');
		        $(`#ingr-btn-${igr_num}`).removeClass('clearBtn')
		        // 냉장고 화면에 추가할 버튼 생성
		        const $button = $(`<button value="${igr_num}" id="ref-btn-${igr_num}" class="rfgBtn">${igr_name}</button>`);
		        // 냉장고 화면에 버튼 추가
		        $('.rfg-container').append($button)
				insertRefridge(sessionId, igr_num);
			}else {
		        $(`#ingr-btn-${igr_num}`).addClass('clearBtn')
		        $(`#ingr-btn-${igr_num}`).removeClass('removeBtn')
		        $(`#ref-btn-${igr_num}`).remove();
		        deleteIgrList(memberNum,igr_num);
			}
		}
	})
}
function memoSelect(){
	$.ajax({
		url: "/refrigerator/memoSelect",
		type: "get",
		error: function(){
			$('#content-memo').html("메모를 불러올 수 없습니다. 관리자에게 문의하세요.");
		},
		success: function(data){
			if(data.memo_content == null){
				$('.memo-bg').removeClass('memo-none');
			}else {
				$('.memo-bg').addClass('memo-none');
				$('#content-memo').html(data.memo_content);
			}
		}
	})
	
}

