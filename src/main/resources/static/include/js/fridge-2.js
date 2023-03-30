$(function(){
	console.log("페이지2");
	let $div = $('#content-container');
	let listIgrNum = [];
	
	let result =  $('#listIgrNum').val().replace("[","").replace("]","").trim().split(",");
	
	listIgrNum.push(result);
	console.log(typeof result);
	console.log(listIgrNum);
	console.log("result: "+result.length);

	//뷰(view)단 : JavaScript에서 ajax를 이용해 배열을 선언한 데이터를 넘길때, traditional: true로 설정
	$.ajax({
		url: "/refrigerator/selectRecommend",
		traditional: true, 
		data: {arr : listIgrNum},
		type: "post",
		dataType:"json",
		async:false,
		success: function(data){
			console.log('성공쓰.>>>>'+data[0].rcp_seq+":"+data[0].rcp_nm);
			console.log(data)
			
		
			for(var i = 0; i < data.length; i++){
				console.log($(data[i]))
				let $li = $('<li><a href="/recipe/recipeDetail?rcp_seq='+$(data)[i].rcp_seq+'>'+$(data)[i].rcp_nm+'</a></li>');
				$div.append($li);
			}
		},error: function(){
			$ul.html("리스트 실패..");
		}
	})

}); /** *************상당 function 종료 *************** **/
