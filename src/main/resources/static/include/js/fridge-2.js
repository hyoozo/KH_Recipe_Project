$(function(){
	init();
	$('#listBtn').on('click', function(){
		history.go(-1);
	});
	$('#rcpBtn').on('click', function(){
		location.href = '/recipe/recipeList';
	})
}); /** *************상당 function 종료 *************** **/
async function init() {
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
			for(let i=0; i < data.length; i++){
				let $div = $('.refrigerator-card');
				let $element = $('#food-card').clone().removeAttr('id');
				$element.css('display','block');
				$element.find('img').attr('src',data[i].att_file_no_mk);
				$element.find('a').prop('href',"/recipe/recipeDetail?rcp_seq="+data[i].rcp_seq);
				$element.find('h3').html(data[i].rcp_nm);
				$element.find('.info_eng').html(data[i].info_eng+"kcal");
				$div.append($element);
			}
		
		},
		error: function(){
			console.log('error')
		},
		async: false
	});
}

