<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button class="payTest">테스트</button>
<div class="result"></div>


	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		
	
		$(".payTest").on("click",function(){
			//alert('test');
			
			             $.ajax({
                            url: "/payTest", // 가맹점 서버
                            method: "POST",
                            //headers: { "Content-Type": "application/json" },
                            contentType: 'application/json; charset=utf-8',
                            data: JSON.stringify({
                                name: "이름",
                                merchant_uid: "uid"
                            })
                        }).done(function (data) {
                          // 가맹점 서버 결제 API 성공시 로직
                          $(".result").append('<p>'+data.name+data.merchant_uid+'</p>')
                          console.log(data.name);
                        }) 
			
			
		    /* function requestPay() {
		      // IMP.request_pay(param, callback) 호출
		      IMP.request_pay({ // param
		          pg: "inicis",
		          pay_method: "card",
		          merchant_uid: "ORD20180131-0000011",
		          name: "노르웨이 회전 의자",
		          amount: 100,
		          buyer_email: "gildong@gmail.com",
		          buyer_name: "홍길동",
		          buyer_tel: "010-4242-4242",
		          buyer_addr: "서울특별시 강남구 신사동",
		          buyer_postcode: "01181"
		      }, function (rsp) { // callback
		    	    if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
		    	        // jQuery로 HTTP 요청
		    	        $.ajax({
		    	            url: "/payTest", // 가맹점 서버
		    	            method: "POST",
		    	            headers: { "Content-Type": "application/json" },
		    	            data: JSON.stringify({
		    	                imp_uid: rsp.imp_uid,
		    	                merchant_uid: rsp.merchant_uid
		    	            })
		    	        }).done(function (data) {
		    	          // 가맹점 서버 결제 API 성공시 로직
		    	        })
		    	      } else {
		    	        alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
		    	      }
		      });
		    } */
		})	
	
		var IMP = window.IMP; // 생략가능
		IMP.init('imp00435953'); // 가맹점 식별 코드 

		
		
	});
	</script>
</body>
</html>