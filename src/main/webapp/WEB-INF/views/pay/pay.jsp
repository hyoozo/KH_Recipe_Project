<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      <title>Insert title here</title>
      
      <link rel="shortcut icon" href="../image/icon.png" />
      <link rel="apple-touch-icon" href="../image/icon.png" />
      
      <!--[if lt IE 9]>
      <script src="../js/html5shiv.js"></script>
      <![endif]-->
      <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
 // Set a same-site cookie for first-party contexts
    document.cookie = 'cookie1=value1; SameSite=Lax';
    // Set a cross-site cookie for third-party contexts
    document.cookie = 'cookie2=value2; SameSite=None; Secure';
        var IMP = window.IMP; 
        IMP.init("imp30735743"); 
    	
        function requestPay() {
        	
            IMP.request_pay({
                pg : 'kakaopay',
                pay_method : 'card',
                merchant_uid: "57008833-3300422", 
                name : '당근 10kg',
                amount : 1004,
                buyer_email : 'Iamport@chai.finance',
                buyer_name : '포트원 기술지원팀',
                buyer_tel : '010-1234-5678',
                buyer_addr : '서울특별시 강남구 삼성동',
                buyer_postcode : '123-456'
            }, function (rsp) { // callback
                if (rsp.success) {
                    console.log(rsp);
                } else {
                    console.log(rsp);
                }
            });
        }
    </script>
   </head>
   <body>
      <button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->
   </body>
</html>