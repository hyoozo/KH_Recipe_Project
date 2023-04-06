<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link href="/resources/include/dist/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        
        <link rel="shortcut icon" href="/resources/static/image/icon.png" />
      	<link rel="apple-touch-icon" href="/resources/static/image/icon.png" />
        
        <script type="text/javascript" src="/resources/include/js/common.js"></script>
	   	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	   	<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
	   	<script type="text/javascript" src="/resources/include/dist/js/cookie.js"></script>
        
        <style>
        	form{
        		display: inline;
        	}
        </style>
        
        <script type="text/javascript">
        	$(function(){
        		var saleLabels = [];
        		var price = [];
        		
        		var countLabels = [];
        		var percent = [];
        		
        		function saleChart(){
        			saleLabels = [];
            		price = [];
        			
        			var def = new $.Deferred();
        			$.ajax({
    					url : "/admin/store/statistics/saleChart",
    					type : "post",
    					data : $("#sale").serialize(),
    					dataType : "json",
    					success : function(data){
    						//console.log(data);
    						$(data).each(function(){
    							saleLabels.push(this.i_parts);
    							//console.log(this.i_parts);
    							price.push(Number(this.sum));
    							
    							
    						});
    						def.resolve("성공");
    						//console.log(labels.length);
    					},
    					error: function(){
    						def.reject("실패");
    					}
    				});
        			return def.promise();
        		}
        		
        		$("#saleBtn").click(function(){
            		
        			$("#myBarChart").remove();
        			$("#saleChart").append("<canvas id='myBarChart' width='100%' height='50'>");
        			
        			if(!chkData("#sale_start", "날짜")) return;
        			else if(!chkData("#sale_end", "날짜")) return;
        			else {
        				
        				$.when(saleChart()).done(function(result){
        					if(result == '성공'){
        						// Set new default font family and font color to mimic Bootstrap's default styling
                        		Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
                        		Chart.defaults.global.defaultFontColor = '#292b2c';

                        		// Bar Chart Example
                        		var ctx = document.getElementById("myBarChart");
                        		var myLineChart = new Chart(ctx, {
                        		  type: 'bar',
                        		  data: {
                        		    labels: saleLabels,
                        		    datasets: [{
                        		      label: "Revenue",
                        		      backgroundColor: "rgba(2,117,216,1)",
                        		      borderColor: "rgba(2,117,216,1)",
                        		      data: price,
                        		    }],
                        		  },
                        		  options: {
                        		    scales: {
                        		      xAxes: [{
                        		        time: {
                        		          unit: 'month'
                        		        },
                        		        gridLines: {
                        		          display: false
                        		        },
                        		        ticks: {
                        		          maxTicksLimit: 6
                        		        }
                        		      }],
                        		      yAxes: [{
                        		        ticks: {
                        		          min: 0,
                        		          max: 500000,
                        		          maxTicksLimit: 5
                        		        },
                        		        gridLines: {
                        		          display: true
                        		        }
                        		      }],
                        		    },
                        		    legend: {
                        		      display: false
                        		    }
                        		  }
                        		});
        					} else {
        						alert("시스템 오류");
        					}
        				});
        				
        			}
        		});
        		
        		function countChart(){
        			countLabels = [];
        			percent = [];
        			
        			var def = new $.Deferred();
        			$.ajax({
    					url : "/admin/store/statistics/countChart",
    					type : "post",
    					data : $("#count").serialize(),
    					dataType : "json",
    					success : function(data){
    						//console.log(data);
    						$(data).each(function(){
    							countLabels.push(this.i_parts);
    							//console.log(this.i_parts);
    							percent.push(Number(this.percent));
    							
    						});
    						def.resolve("성공");
    						console.log(percent);
    					},
    					error: function(){
    						def.reject("실패");
    					}
    				});
        			return def.promise();
        		}
        		
        		$("#cntBtn").click(function(){
					$("#myPieChart").remove();
					$("#countChart").append("<canvas id='myPieChart' width='100%' height='50'>");
        			
        			if(!chkData("#cnt_start", "날짜")) return;
        			else if(!chkData("#cnt_end", "날짜")) return;
        			else {
        				
        				$.when(countChart()).done(function(result){
        					if(result == '성공'){
        						Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        						Chart.defaults.global.defaultFontColor = '#292b2c';

        						// Pie Chart Example
        						var ctx = document.getElementById("myPieChart");
        						var myPieChart = new Chart(ctx, {
        						  type: 'pie',
        						  data: {
        						    labels: countLabels,
        						    datasets: [{
        						      data: percent,
        						      backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745'],
        						    }],
        						  },
        						});
        					} else {
        						alert("시스템 오류");
        					}
        				});
        			}
        		});
        		

        	});
        </script>
        
    </head>
    <body class="sb-nav-fixed">
    	<c:if test="${not empty adminLogin }">
    		<div id="layoutSidenav_content">
	         <div class="container-fluid px-4">
	             <h1 class="mt-4">통계</h1>
	             <div class="row">
	                 <div class="col-lg-6">
	                     <div class="card mb-4">
	                         <div class="card-header">
	                             <i class="fas fa-chart-bar me-1"></i>
	                             <span class="inline">제품 판매 금액</span>
	                             <form id="sale">
	                             	<input type="date" name="start" id="sale_start"/>
		                            ~
		                            <input type="date" name="end" id="sale_end"/>
		                            <input type="button" id="saleBtn" value="조회"/>
	                             </form>                   
	                         </div>
	                         <div class="card-body" id="saleChart">
	                         	<canvas id="myBarChart" width="100%" height="50"></canvas>
	                         </div>
	                         <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
	                     </div>
	                 </div>
	                 <div class="col-lg-6">
	                     <div class="card mb-4">
	                         <div class="card-header">
	                             <i class="fas fa-chart-pie me-1"></i>
	                             <span class="inline">제품 판매량</span>
	                             <form id="count">
	                             	<input type="date" name="start" id="cnt_start"/>
		                            ~
		                            <input type="date" name="end" id="cnt_end"/>
		                            <input type="button" id="cntBtn" value="조회"/>
	                             </form>                     
	                         </div>
	                         <div class="card-body" id="countChart">
	                         	<canvas id="myPieChart" width="100%" height="50"></canvas>
	                         </div>
	                         <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
	                     </div>
	                 </div>
	             </div>
	         </div>
	        </div>
    	</c:if>
    	<c:if test="${empty adminLogin }">
    		<div class="text-center">
				<p>
					로그인 후 이용 가능한 서비스 입니다. 
				</p>
				<button type="button" class="btn btn-primary" onclick="location.href='/admin/loginForm'">로그인 페이지 이동</button>
			</div>
    	</c:if>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/include/dist/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    </body>
</html>
