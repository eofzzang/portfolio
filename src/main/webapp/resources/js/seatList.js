$(document).ready(function() {

							var reservationFrm = $("form[name=reservationFrm]");

							var selectedSeat = [];

							var adultNumber = $(".adultType").html();
							var adultCount = Number(adultNumber);
							var youthNumber = $(".youthType").html();
							var youthCount = Number(youthNumber);
							var preferentialNumber = $(".preferentialType")
									.html();
							var preferentialCount = Number(preferentialNumber);

							console.log("총 좌석 수 : " + $(".seat").length);
							console.log("예약된 좌석 수 : " + $(".reserved").length);
							console.log($(".seat").eq(0).val());
							console.log($(".scheduleCode").html());
							
							var scheduleCode = $(".scheduleCode").html(); 
							
							$(".row-G").hide();
							$(".row-H").hide();

							//---------------버튼 누를시 고객타입 숫자 변경-------------------------
							$(".adultCountUp")
									.on(
											"click",
											function() {
												var totalCount = adultCount
														+ youthCount
														+ preferentialCount;
												if (totalCount < 8) {
													adultCount = adultCount + 1;
													$(".adultType").html(
															adultCount);
													$("input[name=adultType]")
															.val(adultCount);
													//console.log(adultCount);
													console
															.log($(
																	"input[name=adultType]")
																	.val());
												} else {
													alert("한 번에 최대 8개의 좌석까지 예매할 수 있습니다.");
												}
											});
							$(".adultCountDown").on("click", function() {
								if (adultCount > 0) {
									adultCount = adultCount - 1;
								}
								$(".adultType").html(adultCount);
								$("input[name=adultType]").val(adultCount);
								//console.log(adultCount);
							});
							$(".youthCountUp")
									.on(
											"click",
											function() {
												var totalCount = adultCount
														+ youthCount
														+ preferentialCount;
												if (totalCount < 8) {
													youthCount = youthCount + 1;
													$(".youthType").html(
															youthCount);
													$("input[name=youthType]")
															.val(youthCount);
													//console.log(youthCount);
												} else {
													alert("한 번에 최대 8개의 좌석까지 예매할 수 있습니다.");
												}
											});
							$(".youthCountDown").on("click", function() {
								if (youthCount > 0) {
									youthCount = youthCount - 1;
								}
								$(".youthType").html(youthCount);
								$("input[name=youthType]").val(youthCount);
								//console.log(youthCount);
							});
							$(".preferentialCountUp")
									.on(
											"click",
											function() {
												var totalCount = adultCount
														+ youthCount
														+ preferentialCount;
												if (totalCount < 8) {
													preferentialCount = preferentialCount + 1;
													$(".preferentialType")
															.html(
																	preferentialCount);
													$(
															"input[name=preferentialType]")
															.val(
																	preferentialCount);
													//console.log(preferentialCount);
												} else {
													alert("한 번에 최대 8개의 좌석까지 예매할 수 있습니다.");
												}
											});
							$(".preferentialCountDown")
									.on(
											"click",
											function() {
												if (preferentialCount > 0) {
													preferentialCount = preferentialCount - 1;
												}
												$(".preferentialType").html(
														preferentialCount);
												$(
														"input[name=preferentialType]")
														.val(preferentialCount);
												//console.log(preferentialCount);
											});
							//---------------버튼 누를시 고객타입 숫자 변경-------------------------

							//-------------------버튼 누를시 구매창 금액 및 인원 변경-----------------
							$(".countButton").on("click",function() {
									var payment = $(".payment").html(adultCount * 200 + youthCount * 100 + preferentialCount * 0);
												console.log("결제금액 : "+payment);
											});
							//-------------------버튼 누를시 구매창 금액 및 인원 변경-----------------

							//-------------------결제 버튼----------------------

							$(".payBtn").on("click",function() {
												var totalCount = adultCount
														+ youthCount
														+ preferentialCount;
												$("input[name=totalPeople]")
														.val(totalCount);
												$("input[name=payAmount]").val(
														$(".payment").html());
												console
														.log($(
																"input[name=totalPeople]")
																.val());
												console
														.log($(
																"input[name=payAmount]")
																.val()
																+ "원");
												if (totalCount == 0) {
													alert("인원 수를 선택해주세요.");
												}
												if (totalCount != 0
														&& confirm("선택하신 좌석으로 예매를 진행하시겠습니까?")) {
													if (selectedSeat.length != totalCount) {
														alert("인원수만큼 좌석을 선택해주세요.");
														$(
																"input[name=selectedSeatList]")
																.remove();
														return;
													}
													for (var i = 0; i < selectedSeat.length; i++) {
														var str = "";
														str += '<input type="hidden" name="selectedSeatList" value="'+selectedSeat[i]+'">';
														reservationFrm
																.append(str);
														console
																.log("선택좌석은 "
																		+ $(
																				"input[name=selectedSeatList]")
																				.eq(
																						i)
																				.val()
																		+ " 입니다.");
													}
													reservationFrm.submit();
												} else {
													$(
															"input[name=selectedSeatList]")
															.remove();
												}
											});

							//-------------------결제 버튼----------------------
							
							//-------------------취소 버튼----------------------
							$(".cancelBtn").on('click', function(){
								alert("좌석 선택이 취소되었습니다.");
								window.location.replace("http://localhost:8080/movieList");
							});
							//-------------------취소 버튼----------------------

							//-----------------좌석 클릭하면 오른쪽 목록에 나오게 하기------------

							$(".seatRow")
									.find("button")
									.on(
											"click",
											function() {
												var totalCount = adultCount
														+ youthCount
														+ preferentialCount;
												var selectedSeatList = $("#selectedSeatList");

												if ($(this)
														.hasClass("reserved")) {
													event.preventDefault();
													alert("이미 예매된 좌석입니다.");
													return;
												}

												if (totalCount == 0) {
													event.preventDefault();
													alert("인원 수를 선택해주세요.");
												} else {

													console.log("총 예매 좌석 수 : "
															+ totalCount);

													if (selectedSeat.length < totalCount) {

														console.log("누른 버튼 : "
																+ $(this));

														if ($(this).hasClass(
																"selected")) {
															$(this)
																	.removeClass(
																			"selected");
															$(this)
																	.html(
																			$(
																					this)
																					.val()
																					.substring(
																							1));
															for (var i = 0; i < selectedSeat.length; i++) {
																if (selectedSeat[i] === $(
																		this)
																		.val()) {
																	selectedSeat
																			.splice(
																					i,
																					1);
																}
															}
															var str = "";
															for (var i = 0; i < selectedSeat.length; i++) {
																str += '<li class="finalSeat"><button class="selectedSeat" style="width: 40px; height: 40px; border: none;" value="'+selectedSeat[i]+'">'
																		+ selectedSeat[i]
																		+ '</button></li>';
															}
															selectedSeatList
																	.html(str);

															console
																	.log("선택된 좌석 수 : "
																			+ selectedSeat.length);
														} else {
															$(this).addClass(
																	"selected");
															$(this).html("");
															selectedSeat
																	.push($(
																			this)
																			.val());

															var str = "";
															for (var i = 0; i < selectedSeat.length; i++) {
																str += '<li class="finalSeat"><button class="selectedSeat" style="width: 40px; height: 40px; border: none;" value="'+selectedSeat[i]+'">'
																		+ selectedSeat[i]
																		+ '</button></li>';
															}

															selectedSeatList
																	.html(str);
															console
																	.log("선택된 좌석 수 : "
																			+ selectedSeat.length);
														}

													} else {

														if ($(this).hasClass(
																"selected")) {
															$(this)
																	.removeClass(
																			"selected");
															$(this)
																	.html(
																			$(
																					this)
																					.val()
																					.substring(
																							1));
															for (var i = 0; i < selectedSeat.length; i++) {
																if (selectedSeat[i] === $(
																		this)
																		.val()) {
																	selectedSeat
																			.splice(
																					i,
																					1);
																}
															}
															var str = "";
															for (var i = 0; i < selectedSeat.length; i++) {
																str += '<li><button class="selectedSeat" style="width: 40px; height: 40px; border: none;" value="'+selectedSeat[i]+'">'
																		+ selectedSeat[i]
																		+ '</button></li>';
															}
															selectedSeatList
																	.html(str);

															console
																	.log("선택된 좌석 수 : "
																			+ selectedSeat.length);
														} else {
															event
																	.preventDefault();
															alert("최대 인원수만큼 좌석을 선택하셨습니다.");
														}
													}

												}

											});

							//-----------------좌석 클릭하면 오른쪽 목록에 나오게 하기------------

							//-----------------오른쪽 목록에 좌석버튼 클릭하면 없애기-----------------
							$(document).on("click",".selectedSeat",function() {
												//alert($(this));
												var selectedSeatList = $("#selectedSeatList");

												for (var i = 0; i < selectedSeat.length; i++) {

													for (var j = 0; j < $(".seat").length; j++) {
														if ($(this).val() === $(
																".seat").eq(j)
																.val()) {
															$(".seat")
																	.eq(j)
																	.removeClass(
																			"selected");
															$(".seat")
																	.eq(j)
																	.html(
																			$(
																					this)
																					.val()
																					.substring(
																							1));
															console
																	.log("목록에서 취소한 좌석 : "
																			+ $(
																					".seat")
																					.eq(
																							j)
																					.val());
														}
													}

													if (selectedSeat[i] === $(
															this).val()) {
														selectedSeat.splice(i,
																1);

														console
																.log("취소한 좌석 번호 : "
																		+ $(
																				this)
																				.val());
													}
												}

												var str = "";
												for (var i = 0; i < selectedSeat.length; i++) {
													str += '<li><button class="selectedSeat" style="width: 40px; height: 40px; border: none;" value="'+selectedSeat[i]+'">'
															+ selectedSeat[i]
															+ '</button></li>';
												}

												selectedSeatList.html(str);
											});

							//-----------------오른쪽 목록에 좌석 클릭하면 없애기-----------------

							//-----------------DB반영된 좌석표 출력--------------------------

							var getEnabledSeatList = function(scheduleCode,
									callback) {

								$.ajax({
									url : "/getEnabledSeatList/" + scheduleCode
											+ ".json",
									type : "get",
									dataType : "json",
									success : function(data) {
										callback(data);
									}
								});
							};

							getEnabledSeatList(
									scheduleCode,
									function(list) {
										for (var i = 0; i < list.length; i++) {
											for (var j = 0; j < $(".seat").length; j++) {
												if (list[i].seat === $(".seat")
														.eq(j).val()) {
													$(".seat").eq(j).addClass(
															"reserved");
													$(".seat").eq(j).html("");
													console.log("예매처리된 좌석 : "
															+ $(".seat").eq(j)
																	.val());
												}
											}
										}
									});

							//------------------------------------------------------------

						});