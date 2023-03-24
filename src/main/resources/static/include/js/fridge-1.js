$(function(){
	let ingredientData = []; // 재료 
	let refrigerator = [];  // 냉장고에 선택된 재료 (초기값 빈 배열)
	
	$.getJSON("/igr/igrList", function(data){
		ingredientData = data;   // 재료 리스트
		
		if(ingredientData.length === 0){
			let $div = $('.ingredient-container');
				$div.html("현재 준비된 재료가 없습니다.").css({'display':'flex',
														'justify-content': 'center',
														'align-items': 'center',
														'font-size':'20px'
													   });
		}
		//igrData_contol(ingredientData);
		
		// 재료 화면에 재료 리스트로 재료 버튼 만들기
		ingredientData.forEach(ingredient => {
		    //TODO: `${}` <- 이 문법 공부해볼것
		    const $button = $(`<button value="${ingredient.igr_num}" id="ingr-btn-${ingredient.igr_num}" class="igrBtn">${ingredient.igr_name}</button>`);
		    $('.ingredient-container').append($button);
		})
		
		// 재료 화면 내 재료 버튼 클릭 시 이벤트
		$('.igrBtn').on("click", function(){
		    const igr_num = $(this).val();
		    const igr_name = $(this).text();
		    // 냉장고 추가 전 이미 추가 되어있는지 찾는다
		    //TODO: 배열.find() 공부
		    const duplicateIngredient = refrigerator.find(ingredient => ingredient.igr_num === igr_num);
			
		    // 이미 추가된게 있다면 true
		    if (duplicateIngredient) {
		        // 이미 추가된 것을 제외한 것들을 새로 냉장고 넣는다
		        //TODO: 배열.filter() 공부
		        refrigerator = refrigerator.filter(ingredient => ingredient.igr_num !== igr_num);
		        // 제거된 버튼 css
		        $(`#ingr-btn-${igr_num}`).css({'color':'black',
		        							  'text-decoration':'none'});
		        $(`#ref-btn-${igr_num}`).remove();
		        remove_recommendTemp();  //*에러잡기! = 레시피삭제 메소드 
		        
		    } else {
				
				rcpRecomment(igr_name); //* 에러잡기 완료! 
				
		        // 추가된게 없다면 새로 추가되는 재료이니 냉장고 배열에 푸시
		        refrigerator.push({
		            igr_num: igr_num,
		            igr_name: igr_name
		        });
		        
		        // 해당 재료 버튼 css
		        $(`#ingr-btn-${igr_num}`).css({	'color':'Orange',
		        								'text-decoration':'line-through',
		        								'text-decoration-color':'red',
		        								'text-decoration-thickness':'3px'});
		        // 냉장고 화면에 추가할 버튼 생성
		        const $button = $(`<button value="${igr_num}" id="ref-btn-${igr_num}" class="rfgBtn">${igr_name}</button>`);
		        // 냉장고 화면에 버튼 추가
		        $('.rfg-container').append($button)
		        
		    }
		    
			// 냉장고 화면에 생성 된 버튼에 대한 클릭 이벤트시 생성
			$('.rfgBtn').on("click", function(){
				remove_recommendTemp(); //*에러잡기! = 레시피삭제 메소드 
				
			    const igr_num = $(this).val();
			
			    // 클릭하면 재료 쪽 버튼 css 변경
			    $(`#ingr-btn-${igr_num}`).css({'color':'black',
											  'text-decoration':'none'});
			    // 냉장고 화면 내 버튼은 추가 없고 지우는 기능 뿐
			    refrigerator = refrigerator.filter(ingredient => ingredient.igr_num !== igr_num)
			    // 냉장고 화면 내에서 본인버튼 소멸
			    $(this).remove()
			})
			
		})
		// 검색 버튼 클릭시
		$("#searchBtn").on("click", function(){
			console.log("#searchBtn 클릭됨.");
			const inputvalue = $("#searchInput").val();
			console.log(inputvalue);
			$.ajax({
				//console.log("???????????");
				url: "/igr/searchIgr/"+"'"+inputvalue+"'",
				type: "get",
				dataType: "xml",
				error: function(){
					$(".ingredient-container").html("검색어가 없습니다.");
				},
				success: function(xml){
					let data = $('.ingredient-container button');
					data.detach();
					
					$(xml).find('item').each(function(){
						let igr_num = $(this).find('igr_num').text();
						let igr_name = $(this).find('igr_name').text();
						const $button = $(`<button value="${igr_num}" id="ingr-btn-${igr_num}" class="igrBtn">${igr_name}</button>`);
						$('.ingredient-container').append($button);
						//*에러잡기! = 추가된 버튼 클릭시 기능 구현하기 
					});
					
					//검색 input 내용 지울 시 
					$("#searchInput").on("change", function(){
						const inputvalue = $(this).val();
						if(inputvalue == ""){
							
							console.log("???????")
							//*에러잡기! = input이 빈문자열일때 재료리스트 보여주기 
							//$('.ingredient-container button').append(data);
							ingredientData.forEach(ingredient => {
							    const $button = $(`<button value="${ingredient.igr_num}" id="ingr-btn-${ingredient.igr_num}" class="igrBtn">${ingredient.igr_name}</button>`);
							    $('.ingredient-container').append($button);
							})
		
						}
					})
					
					// 재료 화면 내 재료 버튼 클릭 시 이벤트
					$('.igrBtn').on("click", function(){
					    const igr_num = $(this).val();
					    const igr_name = $(this).text();
					    // 냉장고 추가 전 이미 추가 되어있는지 찾는다
					    //TODO: 배열.find() 공부
					    const duplicateIngredient = refrigerator.find(ingredient => ingredient.igr_num === igr_num);
						
					    // 이미 추가된게 있다면 true
					    if (duplicateIngredient) {
					        // 이미 추가된 것을 제외한 것들을 새로 냉장고 넣는다
					        //TODO: 배열.filter() 공부
					        refrigerator = refrigerator.filter(ingredient => ingredient.igr_num !== igr_num);
					        // 제거된 버튼 css
					        $(`#ingr-btn-${igr_num}`).css({'color':'black',
					        							  'text-decoration':'none'});
					        $(`#ref-btn-${igr_num}`).remove();
					        remove_recommendTemp();  //*에러잡기! = 레시피삭제 메소드 
					    } else {
							rcpRecomment(igr_name); //* 에러잡기 완료! 
							
					        // 추가된게 없다면 새로 추가되는 재료이니 냉장고 배열에 푸시
					        refrigerator.push({
					            igr_num: igr_num,
					            igr_name: igr_name
					        });
					        // 해당 재료 버튼 css
					        $(`#ingr-btn-${igr_num}`).css({	'color':'Orange',
					        								'text-decoration':'line-through',
					        								'text-decoration-color':'red',
					        								'text-decoration-thickness':'3px'});
					        // 냉장고 화면에 추가할 버튼 생성
					        const $button = $(`<button value="${igr_num}" id="ref-btn-${igr_num}" class="rfgBtn">${igr_name}</button>`);
					        // 냉장고 화면에 버튼 추가
					        $('.rfg-container').append($button)
					    }
					    
						// 냉장고 화면에 생성 된 버튼에 대한 클릭 이벤트시 생성
						$('.rfgBtn').on("click", function(){
							remove_recommendTemp(); //*에러잡기! = 레시피삭제 메소드 
							
						    const igr_num = $(this).val();
						
						    // 클릭하면 재료 쪽 버튼 css 변경
						    $(`#ingr-btn-${igr_num}`).css({'color':'black',
														  'text-decoration':'none'});
						    // 냉장고 화면 내 버튼은 추가 없고 지우는 기능 뿐
						    refrigerator = refrigerator.filter(ingredient => ingredient.igr_num !== igr_num)
						    // 냉장고 화면 내에서 본인버튼 소멸
						    $(this).remove()
						});
					});
				}
			});
		});
	
	}).fail(function(err){
		// null일경우 
		console.error(err);
	});/** 상당 getJSON 종료 */
		
	
	
	

}); /** *************상당 function 종료 *************** **/

//추천 레시피 검색
function rcpRecomment(value){
	let url = "/igr/rcpList/"+"'"+value+"'";
	$.ajax({
		url: url,
		dataType: "xml",
		success:function(data){
			$(data).find('List').each(function(){
				let arr = new Array();
				$(this).find('item').each(function(){
					arr.push($(this).text())
				})
				//console.log(arr);
				add_recommendTemp(arr);
			});
		}	
	});
}

//추천 레시피 템플릿
function add_recommendTemp(igr_name){
	let arrName = igr_name;
	let ul = document.querySelector('#content-list');
	//a.href="#";
	for(let i in arrName){
		ul.innerHTML += '<li><a href="#">'+arrName[i]+'</a></li>';
	}
	ul.style.display='block';
}
function remove_recommendTemp(){
	let ul = document.querySelector('#content-list');
	ul.replaceChildren(); //* 에러잡기! 모든 li가 삭제 됨. 해당되는 데이터만 삭제할 수 있도록 하기.
	
	// 페이지 이동으로 해결을 해볼까?
}

/*function igrData_contol(ingredientData){
	
	
	
}*/

