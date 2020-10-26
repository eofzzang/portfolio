<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/resources/simplex.css" rel="stylesheet">
    <link href="/resources/payment.css" rel="stylesheet">
</head>

<body>

    <header>

        <!-- <h1 style="text-align: center; margin: 40px; font-size: 300%;">결제정보</h1> -->

    </header>
    
    <sec:authorize access="isAuthenticated()">
       	<sec:authentication property="principal.username" var="userid" />
       	<sec:authentication property="principal.member.userName" var="userName"/>
       	<sec:authentication property="principal.member.userEmail" var="userEmail"/>
       	<sec:authentication property="principal.member.userPhone" var="userPhone"/>
    </sec:authorize>

    <!-- paymentBox start -->
    <div class="paymentBox" style="margin: 0 auto; width: 900px;">

        <!-- The Modal -->
    <div id="myModal" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
            <p style="text-align: center;"><span style="font-size: 14pt;"><b><span
                            style="font-size: 24pt;">예매내역</span></b></span></p>

                            <div class="form-group" style="border-top: 1px solid darkgrey; margin-right: 50px;">
                                <fieldset style="margin: 0px auto; width: 700px; padding: 30px 0;">
                                
                                <div class="form-group row"
                                            style="width: 440px; padding: 10px 20px 15px 30px; margin: 0; font-size: 200%;">
                                                	<b>예매번호 : <span id="paymentNumber"></span></b>
                                        </div>
                                
                                    <img src="/resources/images/${movie.selectedPoster }" width="240" height="320" style="float: left; margin-left: 20px;">
                    
                                    <div class="form-group row"
                                        style="float: left; width: 440px; padding: 0px 20px 15px 30px; margin: 0; font-size: 200%; font-weight: bold;">
                                        <span style="font-weight: bold;">${movie.selectedMovie }</span>
                                    </div>
                    
                                    <div class="form-group row"
                                        style="float: left; width: 440px; padding: 10px 20px 15px 30px; margin: 0; font-size: 135%;">
                                        <span style="font-weight: bold;">가산시네마</span>
                                    </div>
                    
                                    <div class="form-group row"
                                        style="float: left; width: 440px; padding: 10px 20px 15px 30px; margin: 0; font-size: 135%;">
                                        <span style="font-weight: bold;">상영관 : ${movie.selectedTheaterNumber }관<br>
                                         상영날짜 : ${movie.selectedDate.substring(0,4)}.${movie.selectedDate.substring(4,6)}.${movie.selectedDate.substring(6,8)} (${dayOfWeek })<br>
                                        상영시간 : ${movie.selectedStartTime } ~ ${movie.selectedEndTime }</span>
                                    </div>
                    
                                    <div class="form-group row"
                                        style="float: left; width: 440px; padding: 10px 20px 15px 30px; margin: 0; font-size: 135%;">
                                        <span style="font-weight: bold;">인원 수 : 총 ${seatReservation.totalPeople }명<br>
                                        (성인 ${seatReservation.adultType }명/청소년 ${seatReservation.youthType }명/우대 ${seatReservation.preferentialType }명)</span>
                                    </div>
                    
                                    <div class="form-group row"
                                        style="float: left; width: 440px; padding: 10px 20px 15px 30px; margin: 0; font-size: 135%;">
                                        <span style="font-weight: bold;">선택좌석 : 
                                        <c:forEach items="${seatReservation.selectedSeatList }" var="seat" varStatus="status">
                                        <c:choose>
                                        <c:when test="${status.last }">${seat }</c:when>
                                        <c:otherwise>${seat }, </c:otherwise>
                                        </c:choose>
                                        </c:forEach></span>
                                    </div>
                    
                                </fieldset>
                            </div>
            <div class="modalClose" style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px; clear: both;">
                <span style="font-size: 13pt;">
                    확인
                </span>
            </div>
        </div>

    </div>
    <!--End Modal-->
        
        <!-- payment way start -->
        <div style="float: left; width: 540px; margin-left: 50px;">
            <h3 style="font-size: 250%; margin-top: 30px;">결제수단</h3>

            <table style="width: 540px; height: 480px;">
                <tr>
                    <td style="width: 180px; height: 80px;">
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1"
                                    value="card" checked="checked" style="width: 15px; height: 15px;">
                                <span style="font-size: 120%;">카드</span>
                            </label>
                        </div>
                    </td>
                    <td style="width: 180px; height: 80px;">
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2"
                                    value="trans" style="width: 15px; height: 15px;">
                                <span style="font-size: 120%;">계좌이체</span>
                            </label>
                        </div>
                    </td>
                    <td style="width: 180px; height: 80px;">
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios3"
                                    value="phone" style="width: 15px; height: 15px;">
                                <span style="font-size: 120%;">휴대폰 결제</span>
                            </label>
                        </div>
                    </td>

                </tr>
                <tr>
                    <td colspan="3" style="font-size: 150%;">
                        <div style="height: 362px; overflow: hidden;">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas et viverra libero, ac
                            dignissim enim. Mauris nec bibendum ex, et rhoncus tortor. Vivamus non enim sed ipsum
                            ultricies semper a ut odio. In scelerisque euismod mauris sed tempor. Integer tellus tellus,
                            ornare quis aliquet in, tincidunt non leo. Nam sem mi, hendrerit sed purus vitae, aliquet
                            hendrerit felis. Integer tristique tempus ante, vitae pretium augue tempus a.
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <!-- payment way end -->
            
        <!-- pay amount show start -->
        <div style="float: left; width: 296px;">
            <h3 style="font-size: 250%; margin-top: 30px; margin-left: 50px;">결제금액</h3>


            <div class="form-group row" style="border: 3px solid darkslategray; margin-bottom: 0; margin-top: 10px;">
                <label for="payAmount" class="col-form-label"
                    style="width: 100%; font-size: 130%; font-weight: bold; text-align: center; background-color: darkslategray; color: white;">결제하실
                    금액</label>
                <div style="width: 100%;">
                    <ul style="list-style: none; padding: 0; margin: 0;">
                        <li style="padding: 10px;">성인 ${seatReservation.adultType }명 : <span style="font-weight: bold;"> ${seatReservation.adultType * 200 }</span>원</li>
                        <li style="padding: 10px;">청소년 ${seatReservation.youthType }명 : <span style="font-weight: bold;"> ${seatReservation.youthType * 100 }</span>원</li>
                        <li style="padding: 10px;">우대 ${seatReservation.preferentialType }명 : <span style="font-weight: bold;"> ${seatReservation.preferentialType * 0 }</span>원</li>
                    </ul>
                </div>
                <div
                    style="width: 100%; height: 30px; background-color: darkslategray; color: white; text-align: right; padding-right: 20px;">
                    총 <span style="font-size: 150%; font-weight: bold;">${seatReservation.adultType * 200 + seatReservation.youthType * 100 + seatReservation.preferentialType * 0 }</span>원
                </div>
            </div>

            <div class="form-group row" style="border: 3px solid darkslategray; margin-bottom: 0; margin-top: 10px;">
                <label for="saleAmount" class="col-form-label"
                    style="width: 100%; font-size: 130%; font-weight: bold; text-align: center; background-color: darkslategray; color: white;">할인내역</label>
                <div style="width: 100%;">
                    <ul style="list-style: none; padding: 0; margin: 0;">
                        <li style="padding: 10px;">할인 1 : <span style="font-weight: bold;"> 8000</span>원</li>
                        <li style="padding: 10px;">할인 2 : <span style="font-weight: bold;"> 3000</span>원</li>
                        <li style="padding: 10px;">할인 3 : <span style="font-weight: bold;"> 10000</span>원</li>
                    </ul>
                </div>
                <div
                    style="width: 100%; height: 30px; background-color: darkslategray; color: white; text-align: right; padding-right: 20px;">
                    총 <span style="font-size: 150%; font-weight: bold;"> 0</span>원
                </div>
            </div>

            <div class="form-group row" style="border: 3px solid darkslategray; margin-bottom: 0; margin-top: 10px;">
                <label for="finalPayment" class="col-form-label"
                    style="width: 100%; font-size: 130%; font-weight: bold; text-align: center;">남은 결제금액</label>

                <div
                    style="width: 100%; height: 30px; background-color: darkslategray; color: white; text-align: right; padding-right: 20px;">
                    총 <span id="finalPayAmount" style="font-size: 150%; font-weight: bold;">${seatReservation.adultType * 200 + seatReservation.youthType * 100 + seatReservation.preferentialType * 0 }</span>원
                </div>
            </div>
        </div>
        <!-- pay amount show end -->

    </div>
    <!-- paymentBox end -->
        <!-- decision button start -->
        <div style="clear: both; margin: 40px auto; width: 280px; padding-top: 60px;">
        <button type="button" class="btn btn-info" id="pay"
            style="padding: 15px 25px; font-size: 150%;">결제</button>
        <button type="button" class="btn btn-primary" id="cancel"
            style="padding: 15px 25px; font-size: 150%;">취소</button>
        </div>
        <!-- decision button end -->
        
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
		<script type="text/javascript"
        src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
        <!-- <script src="/resources/js/payment.js"></script> -->
		<script type="text/javascript">
		$(document).ready(function(){
			
			console.log('최종 결제금액 : '+$("#finalPayAmount").html());
			
			var timeout; 
            var settingTimeout = function(){ //일정 시간 이후에 동작하는 함수 등록
            	//console.log('timeout 재설정함.');
                timeout = setTimeout(function(){
                reservationCancel();
                }, 1000 * 60 * 5 // 1000ms * 60 * 5-> 5분 후에 예약취소.
                );          
            }
			
			settingTimeout(); // 함수 실행.
			
			$(document).on('click',function(){ //화면 클릭시 예약취소함수 갱신
				clearTimeout(timeout);
				settingTimeout();
			})
			
			
			var reservationCancel = function(){
			
				$.ajax({
					url: "/reservationCancel",
					type: "get",
					success: function(){
						alert("결제가 취소되었습니다.");
						window.location.replace("http://localhost:8080/movieList");
					}
				});
			}
			
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			var paymentNumber;
			
			function getPaymentNumber(){
	            	$.ajax({
	            		url: '/getPaymentNumber',
	            		type: 'post',
	            		async: false,
	            		dataType: 'text',
	            		beforeSend: function(xhr){
	  						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	  					  }, 
	            		success: function(data){
	            			//alert('예매번호 얻어오기 성공!');
	            			paymentNumber = data;
	            			$("#paymentNumber").html(paymentNumber);
	            			//console.log(paymentNumber);
	            		}
	            	});
	            	return paymentNumber;
	            }
			
			var payOption = "card"; // default 결제수단
			$('input[name=optionsRadios]').on('click',function(){
			payOption = $(this).val();
            //console.log(payOption);
			});
			
			var payment = function(paymentNumber){
			
			$.ajax({
				url: "/pay",
				type: "POST",
				contentType: 'application/json; charset=utf-8',
				beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				data: JSON.stringify({
					imp_uid: 'rsp.imp_uid',
                    merchant_uid: paymentNumber
				}),
				success: function(){
					alert("결제가 완료되었습니다.");
					console.log("${userid}")
				},
				error:function(request,status,error){
		             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}

			});
		}
            
			var IMP = window.IMP; // 생략가능
            IMP.init('imp00435953'); // 가맹점 식별 코드 
			var requestPay = function(paymentNumber) {
				//alert('requestPay 호출됨.');
                // IMP.request_pay(param, callback) 호출
                IMP.request_pay({ // param
                    pg: "inisis",
                    pay_method: payOption,
                    merchant_uid: paymentNumber,
                    name: '${movie.selectedDate.substring(4,6)}.${movie.selectedDate.substring(6,8)} (${dayOfWeek }) 영화 : ${movie.selectedMovie } 좌석 예매',
                    amount: $("#finalPayAmount").html(),
                    buyer_email: "${userEmail}",
                    buyer_name: "${userName}",
                    buyer_tel: "${userPhone}",
                }, function (rsp) { // callback
                      if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
                          // jQuery로 HTTP 요청
                          $.ajax({
                              url: "/pay", // 가맹점 서버
                              method: "POST",
                              headers: { "Content-Type": "application/json" },
                              beforeSend: function(xhr){
          						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
          					  },
                              data: JSON.stringify({
                            	  imp_uid: rsp.imp_uid,
                                  merchant_uid: paymentNumber
                              })
                          }).done(function () {
                            // 가맹점 서버 결제 API 성공시 로직
                            //window.location.replace("http://localhost:8080/movieList");
                              alert('결제가 완료되었습니다.');
                              $('#myModal').show();
                          })
                        } else {
                          alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
                        }
                });
              }
			
			$("#cancel").on("click", function(){
				reservationCancel();
			});
			$("#pay").on("click", function(){
				console.log("현재 주문 고유번호 : " +getPaymentNumber());
				//alert('결제가 완료되었습니다.');
				//$('#myModal').show();
			    //requestPay(paymentNumber);
			    payment(paymentNumber);
			});
			
			$(".modalClose").on("click",function(){
				event.preventDefault();
				window.location.replace("http://localhost:8080/movieList");
				//$('#myModal').hide();
			})
		});
		//$(document).ready(function(){ end
		</script>
		
</body>

</html>