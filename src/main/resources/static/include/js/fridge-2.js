$(function(){
	console.log("페이지2");
	init();
}); /** *************상당 function 종료 *************** **/

async function init() {
	/**
	 * memberIgrList = [1,2,3,4];
	 */
	const memberIgrListPromise = await memberIgrList();
	selectRecommend(memberIgrListPromise);
}


function memberIgrList(){
	return new Promise((resolve, reject) => {
		$.ajax({
			url: "/refrigerator/memberIgrList",
			type: "get",
			dataType: "json",
			async: false,
			error: function(){
				$(".rfg-container").html("리스트를 불러올 수 없습니다.");
				reject('call error');
			},
			success: function(data){
				const memberIgrList = data.map(function(fridge){return fridge.igr_num.igr_num});
				resolve(memberIgrList);
			}
		})
	})
}

function selectRecommend(memberIgrList){
	$.ajax({
		url: "/refrigerator/selectRecommend",
		traditional: true,
		data: {arr : memberIgrList},
		type: "post",
		dataType:"json",
		async:false,
		success: function(data){
			console.log(data);
			console.log('성공쓰.>>>>'+data[0].rcp_seq+":"+data[0].rcp_nm);
			console.log(data[1].rcp_nm);
			let $div = $('refrigerator-card');
			let $element = $('.food-card');
			for(let i=0; i < data.length; i++){
				
				$element.find('img').attr('src',data[i].att_file_no_mk);
				$element.find('a').prop('href',"/recipe/recipeDetail?rcp_seq="+data[i].rcp_seq);
				$element.find('a').html(data[i].rcp_nm);
				
			}
			$div.append($element);
		},
		error: function(){
			console.log('error')
		},
		async: false
	});
}
