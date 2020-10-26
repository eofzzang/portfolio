		$(document).ready(function() {

			var reservationFrm = $("form[name=reservationFrm]");
			var dateCheck = false; //날짜 선택유무
			var movieCheck = false; //영화 선택유무
			var allCheck = false; // 날짜, 영화 모두 선택유무
			var today = $('input[name=selectedDate]').val();
			//console.log("today : "+today);
			//console.log("movieCheck: "+movieCheck);
			//console.log("dateCheck: "+dateCheck);
			//console.log("allCheck: "+allCheck);
			//console.log($("#selectedDate").val());
			//$(".date").eq(0).addClass("selected");
			
			//console.log(count(1)); 1번 스케쥴에 해당하는 좌석수 출력
			
			$('.date').eq(0).addClass('selected');
			
			//--------------getScheduleByDate------추가-----------------
			getScheduleByDate(function(list){
				
				var str = "";
				
				for(var i = 0, len = list.length||0; i<len; i++){
					//console.log(list[i]);//콘솔에 리스트 출력.
					
					var scheduleCode = list[i].scheduleCode;
								//console.log(scheduleCode);
					
					str += '<li class="movieSchedule"><span class="movieName" ';
					str += 'style="font-weight: bold; font-size: 160%">'+list[i].movieName+'</span>';
					str += '<span class="scheduleCode" style="visibility: hidden; font-size: 0%;">'+list[i].scheduleCode+'</span>';
					str += '<span class="movieCode" style="visibility: hidden; font-size: 0%;">'+list[i].movieCode+'</span>';
					str += '<span class="poster" style="visibility: hidden; font-size: 0%;">'+list[i].poster+'</span>';
					str += '<span style="float: right; font-size:110%; color:green; margin-left: 10px;">'+count(list[i].scheduleCode)+'석</span>';
					str += '<span style="float: right; font-size: 110%"><span ';
					str += 'class="startTime">'+list[i].startTime+'</span> ~ <span ';	
					str += 'class="endTime">'+list[i].endTime+'</span></span> <span ';		
					str += 'style="font-weight: bold; font-size: 110%; float: right; margin-right: 10px;"><span ';		
					str += 'class="theaterNumber">'+list[i].theaterCode+'</span>관</span></li>';	
				}
							
					$("#scheduleUL").html(str);
			});
			//------------getScheduleByDate-----추가--------------------
			
			//-----------------------------------------------------
			getMovieByDate(function(list){
					
					var str = ""; 
					
					for(var i = 0, len = list.length||0; i<len; i++){
						//console.log(list[i]);//콘솔에 리스트 출력.
						
						str += '<li class="movieTitle">'+list[i].movieName+'</li>'
						
					}
					
					$("#movieListUL").html(str);
					
					});

			//-----------------------------------------------------

			$(document).on("click", ".movieTitle" ,function(e) { //영화 제목 누르면 그에 맞는 DB상의 상영시간표 나오게 함.
				//alert('영화제목 클릭함');
				//$("#selectedMovie").val($(this).html());
				var checkDate; 
				  for(var i = 0; i<$('.date').length; i++){ // 날짜 선택유무 체크
					  if($('.date').eq(i).hasClass('selected')){
						  checkDate = true;
						  //console.log(checkDate);
						  break;
					  }
				  }
				if($(this).hasClass("selected") === true) { 
					if(checkDate == true) { // 날짜가 선택되어 있다면 날짜로 스케쥴 얻어옴. 아니라면 유지.
					  $(this).removeClass("selected");
					  $("#selectedMovie").val("");
					  movieCheck = false;
					  allCheck = false;
					  //console.log("movieCheck: "+movieCheck);
					  //console.log("allCheck: "+allCheck);
					  removeSchedule();
					  
					  if(dateCheck === true) {
							//--------------getScheduleByDate-----------------------
							getScheduleByDate(function(list){
								
								var str = "";
								
								for(var i = 0, len = list.length||0; i<len; i++){
									//console.log(list[i]);//콘솔에 리스트 출력.
									
									var scheduleCode = list[i].scheduleCode;
									//console.log(scheduleCode);
									
									str += '<li class="movieSchedule"><span class="movieName" ';
									str += 'style="font-weight: bold; font-size: 160%">'+list[i].movieName+'</span>';
									str += '<span class="scheduleCode" style="visibility: hidden; font-size: 0%;">'+list[i].scheduleCode+'</span>';
									str += '<span class="movieCode" style="visibility: hidden; font-size: 0%;">'+list[i].movieCode+'</span>';
									str += '<span class="poster" style="visibility: hidden; font-size: 0%;">'+list[i].poster+'</span>';
									str += '<span style="float: right; font-size:110%; color:green; margin-left: 10px;">'+count(list[i].scheduleCode)+'석</span>';
									str += '<span style="float: right; font-size: 110%"><span ';
									str += 'class="startTime">'+list[i].startTime+'</span> ~ <span ';	
									str += 'class="endTime">'+list[i].endTime+'</span></span> <span ';		
									str += 'style="font-weight: bold; font-size: 110%; float: right; margin-right: 10px;"><span ';		
									str += 'class="theaterNumber">'+list[i].theaterCode+'</span>관</span></li>';	
								}
											
									$("#scheduleUL").html(str);
									movieCheck = false;
									//console.log(movieCheck);
							});
							//------------getScheduleByDate-------------------------
							} 
						}
					} else {
					  $(".movieTitle").removeClass("selected");
				      $(this).addClass("selected");
				      $("#selectedMovie").val($(this).html());
				      movieCheck = true;
				      if(dateCheck === true){
							allCheck = true;
						}
				      //console.log("movieCheck: "+movieCheck);
				      //console.log("allCheck: "+allCheck);
					}

				
				//console.log("선택 영화: " + $("#selectedMovie").val());
				
				//console.log("loading...");
				
				if(movieCheck === true && allCheck === false) {
					//--------------getScheduleByName-----------------------
				getScheduleByName(function(list){
					
					var str = "";
					
					for(var i = 0, len = list.length||0; i<len; i++){
						//console.log(list[i]);//콘솔에 리스트 출력.
						
						var scheduleCode = list[i].scheduleCode;
									//console.log(scheduleCode);
						
						str += '<li class="movieSchedule"><span class="movieName" ';
						str += 'style="font-weight: bold; font-size: 160%">'+list[i].movieName+'</span>';
						str += '<span class="scheduleCode" style="visibility: hidden; font-size: 0%;">'+list[i].scheduleCode+'</span>';
						str += '<span class="movieCode" style="visibility: hidden; font-size: 0%;">'+list[i].movieCode+'</span>';
						str += '<span class="poster" style="visibility: hidden; font-size: 0%;">'+list[i].poster+'</span>';
						str += '<span style="float: right; font-size:110%; color:green; margin-left: 10px;">'+count(list[i].scheduleCode)+'석</span>';
						str += '<span style="float: right; font-size: 110%"><span ';
						str += 'class="startTime">'+list[i].startTime+'</span> ~ <span ';	
						str += 'class="endTime">'+list[i].endTime+'</span></span> <span ';		
						str += 'style="font-weight: bold; font-size: 110%; float: right; margin-right: 10px;"><span ';		
						str += 'class="theaterNumber">'+list[i].theaterCode+'</span>관</span></li>';	
					}
								
						$("#scheduleUL").html(str);
				});
				//--------------getScheduleByName-----------------------
				} else if(allCheck === true){
					//------------getScheduleByAll-------------------------
					getScheduleByAll(function(list){
						
						var str = "";
						
						for(var i = 0, len = list.length||0; i<len; i++){
							//console.log(list[i]);//콘솔에 리스트 출력.
							
							var scheduleCode = list[i].scheduleCode;
									//console.log(scheduleCode);
							
							str += '<li class="movieSchedule"><span class="movieName" ';
							str += 'style="font-weight: bold; font-size: 160%">'+list[i].movieName+'</span>';
							str += '<span class="scheduleCode" style="visibility: hidden; font-size: 0%;">'+list[i].scheduleCode+'</span>';
							str += '<span class="movieCode" style="visibility: hidden; font-size: 0%;">'+list[i].movieCode+'</span>';
							str += '<span class="poster" style="visibility: hidden; font-size: 0%;">'+list[i].poster+'</span>';
							str += '<span style="float: right; font-size:110%; color:green; margin-left: 10px;">'+count(list[i].scheduleCode)+'석</span>';
							str += '<span style="float: right; font-size: 110%"><span ';
							str += 'class="startTime">'+list[i].startTime+'</span> ~ <span ';	
							str += 'class="endTime">'+list[i].endTime+'</span></span> <span ';		
							str += 'style="font-weight: bold; font-size: 110%; float: right; margin-right: 10px;"><span ';		
							str += 'class="theaterNumber">'+list[i].theaterCode+'</span>관</span></li>';	
						}
									
							$("#scheduleUL").html(str);
							//console.log("allCheck: "+allCheck);
					});
				//------------getScheduleByAll-------------------------
				}
				
			});
			
			//------------$(".date").on("click", function(e) {-------------------------
			$(".date").on("click", function(e) {
				//alert('날짜 클릭함');
				//var year = $(this).children(".year").html();
				//var month = $(this).children(".month").html();
				//var day = $(this).children(".day").html();
				
				var checkMovie;
				  for(var i = 0; i<$('.movieTitle').length; i++){ // 영화 선택유무 체크
					  if($('.movieTitle').eq(i).hasClass('selected')){
						  checkMovie = true;
						  //console.log(checkMovie);
						  break;
					  }
				  }
				
				if($(this).hasClass("selected") === true) {
					  
					  if(checkMovie == true) { // 영화가 선택되어 있다면 영화로 스케쥴 얻어옴. 아니라면 유지.
						  $(this).removeClass("selected");
						  $("#selectedDate").val(today);
						  dateCheck = false;
						  allCheck = false;
						  //console.log("dateCheck:" + dateCheck);
						  //console.log("allCheck: "+allCheck);
						  removeSchedule();
					//--------------getScheduleByName-----------------------
						getScheduleByName(function(list){
							
							var str = "";
							
							for(var i = 0, len = list.length||0; i<len; i++){
								//console.log(list[i]);//콘솔에 리스트 출력.
								
								var scheduleCode = list[i].scheduleCode;
									//console.log(scheduleCode);
								
								str += '<li class="movieSchedule"><span class="movieName" ';
								str += 'style="font-weight: bold; font-size: 160%">'+list[i].movieName+'</span>';
								str += '<span class="scheduleCode" style="visibility: hidden; font-size: 0%;">'+list[i].scheduleCode+'</span>';
								str += '<span class="movieCode" style="visibility: hidden; font-size: 0%;">'+list[i].movieCode+'</span>';
								str += '<span class="poster" style="visibility: hidden; font-size: 0%;">'+list[i].poster+'</span>';
								str += '<span style="float: right; font-size:110%; color:green; margin-left: 10px;">'+count(list[i].scheduleCode)+'석</span>';
								str += '<span style="float: right; font-size: 110%"><span ';
								str += 'class="startTime">'+list[i].startTime+'</span> ~ <span ';	
								str += 'class="endTime">'+list[i].endTime+'</span></span> <span ';		
								str += 'style="font-weight: bold; font-size: 110%; float: right; margin-right: 10px;"><span ';		
								str += 'class="theaterNumber">'+list[i].theaterCode+'</span>관</span></li>';	
							}
										
								$("#scheduleUL").html(str);
						});
						//--------------getScheduleByName-----------------------
					  }
					  
					} else {
						$(".date").removeClass("selected");
						$(this).addClass("selected");
						var year = $(this).children(".year").html();
						
						if($(this).children(".month").html()<10){
						var month = "0"+$(this).children(".month").html();
						} else {
							var month = $(this).children(".month").html();
						}
						
						if($(this).children(".day").html()<10){
							var day = "0"+$(this).children(".day").html();
						} else {
							var day = $(this).children(".day").html();
						};
						
							$("#selectedDate").val(year + month + day);
							
						dateCheck = true;
						if(movieCheck === true){
							allCheck = true;
						}
						//console.log("dateCheck:" + dateCheck);
						//console.log("allCheck: "+allCheck);
					}
				
				//console.log(year);
				//console.log(month);
				//console.log(day);
				
				//console.log("선택 날짜: " + $("#selectedDate").val());
				
				//console.log("loading...");
				
				
				if(dateCheck === true && allCheck === false) {
				//--------------getScheduleByDate-----------------------
				getScheduleByDate(function(list){
					
					var str = "";
					
					for(var i = 0, len = list.length||0; i<len; i++){
						//console.log(list[i]);//콘솔에 리스트 출력.
						
						var scheduleCode = list[i].scheduleCode;
									//console.log(scheduleCode);
						
						str += '<li class="movieSchedule"><span class="movieName" ';
						str += 'style="font-weight: bold; font-size: 160%">'+list[i].movieName+'</span>';
						str += '<span class="scheduleCode" style="visibility: hidden; font-size: 0%;">'+list[i].scheduleCode+'</span>';
						str += '<span class="movieCode" style="visibility: hidden; font-size: 0%;">'+list[i].movieCode+'</span>';
						str += '<span class="poster" style="visibility: hidden; font-size: 0%;">'+list[i].poster+'</span>';
						str += '<span style="float: right; font-size:110%; color:green; margin-left: 10px;">'+count(list[i].scheduleCode)+'석</span>';
						str += '<span style="float: right; font-size: 110%"><span ';
						str += 'class="startTime">'+list[i].startTime+'</span> ~ <span ';	
						str += 'class="endTime">'+list[i].endTime+'</span></span> <span ';		
						str += 'style="font-weight: bold; font-size: 110%; float: right; margin-right: 10px;"><span ';		
						str += 'class="theaterNumber">'+list[i].theaterCode+'</span>관</span></li>';	
					}
								
						$("#scheduleUL").html(str);
				});
				//------------getScheduleByDate-------------------------
				
				//------------getMovieByDate-------------------------
				getMovieByDate(function(list){
					
					var str = ""; 
					
					for(var i = 0, len = list.length||0; i<len; i++){
						//console.log(list[i]);//콘솔에 리스트 출력.
						
						str += '<li class="movieTitle">'+list[i].movieName+'</li>'
						
					}
					
					$("#movieListUL").html(str);
					
					});
				//------------getMovieByDate-------------------------
				
				
				} else if (allCheck === true){
					//------------getScheduleByAll-------------------------
					getScheduleByAll(function(list){
						
						var str = "";
						
						for(var i = 0, len = list.length||0; i<len; i++){
							//console.log(list[i]);//콘솔에 리스트 출력.
							
							var scheduleCode = list[i].scheduleCode;
									//console.log(scheduleCode);
							
							str += '<li class="movieSchedule"><span class="movieName" ';
							str += 'style="font-weight: bold; font-size: 160%">'+list[i].movieName+'</span>';
							str += '<span class="scheduleCode" style="visibility: hidden; font-size: 0%;">'+list[i].scheduleCode+'</span>';
							str += '<span class="movieCode" style="visibility: hidden; font-size: 0%;">'+list[i].movieCode+'</span>';
							str += '<span class="poster" style="visibility: hidden; font-size: 0%;">'+list[i].poster+'</span>';
							str += '<span style="float: right; font-size:110%; color:green; margin-left: 10px;">'+count(list[i].scheduleCode)+'석</span>';
							str += '<span style="float: right; font-size: 110%"><span ';
							str += 'class="startTime">'+list[i].startTime+'</span> ~ <span ';	
							str += 'class="endTime">'+list[i].endTime+'</span></span> <span ';		
							str += 'style="font-weight: bold; font-size: 110%; float: right; margin-right: 10px;"><span ';		
							str += 'class="theaterNumber">'+list[i].theaterCode+'</span>관</span></li>';	
						}
									
							$("#scheduleUL").html(str);
							//console.log("allCheck: "+allCheck);
					});
				//------------getScheduleByAll-------------------------
				}
				
				
			});
			//------------$(".date").on("click", function(e) {-------------------------
				
				

			//---------------$(document).on("click",".movieSchedule", function(e) {---------------------
			$(document).on("click",".movieSchedule", function(e) {
				//alert('스케쥴 클릭함');
				var movieName = $(this).find(".movieName").html();
				var theaterNumber = $(this).find(".theaterNumber").html();
				var startTime = $(this).find(".startTime").html();
				var endTime = $(this).find(".endTime").html();
				var scheduleCode = $(this).find(".scheduleCode").html();
				var movieCode = $(this).find(".movieCode").html();
				var poster = $(this).find(".poster").html();
				
				$(".movieSchedule").removeClass("selected");
				$(this).addClass("selected");

				$("#selectedMovie").val(movieName);
				$("#selectedTheaterNumber").val(theaterNumber);
				$("#selectedStartTime").val(startTime);
				$("#selectedEndTime").val(endTime);
				$("#selectedScheduleCode").val(scheduleCode);
				$("#selectedMovieCode").val(movieCode);
				$("#selectedPoster").val(poster);

				console.log("선택 영화: " + $("#selectedMovie").val());
				console.log("선택 영화코드: "+ $("#selectedMovieCode").val());
				console.log("선택 영화 포스터 파일: "+ $("#selectedPoster").val());
				console.log("선택 스케쥴코드: "+ $("#selectedScheduleCode").val());
				console.log("선택 날짜: " + $("#selectedDate").val());
				console.log("선택 상영관: " + $("#selectedTheaterNumber").val());
				console.log("선택 상영시작시간: " + $("#selectedStartTime").val());
				console.log("선택 상영끝시간: " + $("#selectedEndTime").val());
				if (confirm('선택하신 영화와 시간으로 예매를 진행하시겠습니까?')) {
					reservationFrm.submit();
				}
				
			});
			//----------$(document).on("click",".movieSchedule", function(e) {----------------

		}); //end $(document).ready
	//날짜 클릭시 스케쥴 얻어오기.
	//https://bin-repository.tistory.com/110?category=879445 참조.
			
	//------------------------------------------------------
	function getScheduleByDate(callback, error) {
		
		var date = $("#selectedDate").val();
		//console.log(date);

		$.getJSON("/getScheduleByDate/"+date+".json", //json을 얻어온다. AjaxController mapping
				function(data) {
					if (callback) {
						callback(data);
					}
				}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	};
	//------------------------------------------------------
	
	
	
	//------------------------------------------------------
	function getScheduleByName(callback, error) {
		
		var movieName = $("#selectedMovie").val();
		//console.log(movieName);

		$.getJSON("/getScheduleByName/"+movieName+".json", //json을 얻어온다. AjaxController mapping
				function(data) {
					if (callback) {
						callback(data);
					}
				}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	};
	//------------------------------------------------------
	function getScheduleByAll(callback, error) {
		
		var selectedDate = $("#selectedDate").val();
		var selectedMovieName = $("#selectedMovie").val();
		//console.log(selectedDate);
		//console.log(selectedMovieName);

		$.getJSON("/getScheduleByAll/"+selectedDate+"/"+selectedMovieName+".json", //json을 얻어온다. AjaxController mapping
				function(data) {
					if (callback) {
						callback(data);
					}
				}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	};
	//------------------------------------------------------
	function removeSchedule(){
		$("#scheduleUL").html("");
	}
	
	function getMovieByDate(callback, error){
		
		var selectedDate = $("#selectedDate").val();
		
		$.getJSON("/getMovieByDate/"+selectedDate+".json", //json을 얻어온다. AjaxController mapping
				function(data) {
					if (callback) {
						callback(data);
					}
				}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
	
	var count = function getRemainedSeatCount(scheduleCode, error){
		var seatCount;
		
			$.ajax({
					url: "/getRemainedSeatCount/"+scheduleCode+".json",
					type: 'get',
					dataType: 'text',
					async: false,
					success: function(data){
						seatCount =  data;
				}
			});
			return seatCount;
	}
	
	
	
