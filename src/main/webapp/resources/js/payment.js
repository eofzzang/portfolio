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
	            			//console.log(paymentNumber);
	            		}
	            	});
	            	return paymentNumber;
	            }
			
			/* var payment = function(paymentNumber){
				
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
			} */
			
			var IMP = window.IMP; // 생략가능
            IMP.init('imp00435953'); // 가맹점 식별 코드 
			
			var requestPay = function(paymentNumber) {
				//alert('requestPay 호출됨.');
                // IMP.request_pay(param, callback) 호출
                IMP.request_pay({ // param
                    pg: "inicis",
                    pay_method: "card",
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
                              alert('결제가 완료되었습니다.');
                              window.location.replace("http://localhost:8080/movieList");
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
			    requestPay(paymentNumber);
			    //payment(paymentNumber);
			});
			
			
			
			
			
			
		});
		//$(document).ready(function(){ end