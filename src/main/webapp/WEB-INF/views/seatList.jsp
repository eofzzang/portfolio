<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="/resources/simplex.css" rel="stylesheet">
<link href="/resources/seatList.css" rel="stylesheet">
</head>
<body>
	<!-- navbar start -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Navbar</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor02" aria-controls="navbarColor02"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor02">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Features</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Pricing</a></li>
				<li class="nav-item"><a class="nav-link" href="#">About</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" placeholder="Search">
				<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>
	<!-- navbar end -->
	<header>
		<div class="selectType"
			style="width: 900px; height: 45px; margin: 7px auto; font-size: 130%; padding: 0 20px; border-bottom: 1px solid gray;">
			<h1 style="text-align: left;">좌석선택</h1>
		</div>
	</header>

	<!-- selectType start -->
	<div class="selectType"
		style="width: 900px; height: 45px; margin: 7px auto; font-size: 130%; padding: 0 50px;">
		<div style="float: left; padding: 10px 5px; margin-right: 20px;">
			<span style="float: left; margin-right: 10px;">성인</span>
			<button type="button" style="float: left; height: 25px; width: 25px;"
				class="countButton adultCountDown">-</button>
			<div
				style="float: left; width: 30px; height: 30px; text-align: center;">
				<span class="peopleType adultType">0</span>
			</div>
			<button type="button" style="float: left; height: 25px; width: 25px;"
				class="countButton adultCountUp">+</button>
		</div>
		<div style="float: left; padding: 10px 5px; margin-right: 20px;">
			<span style="float: left; margin-right: 10px;">청소년</span>
			<button type="button" style="float: left; height: 25px; width: 25px;"
				class="countButton youthCountDown">-</button>
			<div
				style="float: left; width: 30px; height: 30px; text-align: center;">
				<span class="peopleType youthType">0</span>
			</div>
			<button type="button" style="float: left; height: 25px; width: 25px;"
				class="countButton youthCountUp">+</button>
		</div>
		<!-- <div style="float: left; padding: 10px 5px;">
            <span style="float: left; margin-right: 10px;">어린이</span>
            <button type="button" style="float: left; height: 25px; width: 25px;">-</button>
            <div style="float: left; width: 30px; height: 30px; text-align: center;">0</div>
            <button type="button" style="float: left; height: 25px; width: 25px;">+</button>
        </div> -->
		<div style="float: left; padding: 10px 5px; margin-right: 20px;">
			<span style="float: left; margin-right: 10px;">우대</span>
			<button type="button" style="float: left; height: 25px; width: 25px;"
				class="countButton preferentialCountDown">-</button>
			<div
				style="float: left; width: 30px; height: 30px; text-align: center;">
				<span class="peopleType preferentialType">0</span>
			</div>
			<button type="button" style="float: left; height: 25px; width: 25px;"
				class="countButton preferentialCountUp">+</button>
		</div>
	</div>
	<!-- selectType end -->

	<!-- reservationBox -->
	<form:form modelAttribute="SeatReservationVO" name="reservationFrm"
		action="/payment" method="post">
		<%-- <form name="seatFrm" action="/payment"> --%>
		<input type="hidden" name="adultType" value="0">
		<input type="hidden" name="youthType" value="0">
		<input type="hidden" name="preferentialType" value="0">
		<input type="hidden" name="totalPeople" value="0">
		<input type="hidden" name="payAmount" value="0">

		<%-- </form> --%>
	</form:form>
	<div class="reservationBox"
		style="margin: 0 auto; width: 900px; height: 555px;">


		<%
			String[] row = new String[]{"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"};
		%>

		<div class="seatRow"
			style="padding: 0 100px; width: 560px; height: 555px; background-color: rgb(80, 80, 80); float: left;">

			<h3 style="margin-left: 150px; color: white; margin-top: 30px;">SCREEN</h3>

			<!-- row start -->

			<%
				for (int j = 0; j < 10; j++) {
					if(j == 6 || j == 7){
						continue;
					}
			%>
			<button type="button" class="row-<%=row[j] %> represent"
				style="border: 2px solid black; left: 20px;"><%=row[j] %></button>
			<%
				for (int i = 0; i < 14; i++) {
				if (i == 2 || i == 3) {
				} else {
			%>
			<button type="button" class="row-<%=row[j]%> col-<%=i + 1%> seat"
				style="border: 2px solid black;" value="<%=row[j]%><%=i + 1%>"><%=i + 1%></button>
			<%
				}
			}
			}
			%>
			<!-- row A end -->

			<!-- row B start -->

			<!-- row B end -->

			<!-- row C start -->

			<!-- row C end -->

			<!-- row D start -->

			<!-- row D end -->

			<!-- row E start -->

			<!-- row E end -->

			<!-- row F start -->

			<!-- row F end -->

			<!-- row G start -->

			<!-- row G end -->

			<!-- row H start -->

			<!-- row H end -->

			<!-- row I start -->

			<!-- row I end -->

			<!-- row J start -->

			<!-- row J end -->

			<!-- row K start -->

			<!-- row K end -->

		</div>

		<div class="infoBox"
			style="background-color: rgb(51, 51, 51); width: 328px; height: 555px; float: left; margin-left: 10px; padding-top: 30px;">
			<div class="movieInfo">

				<div style="margin: 5px; padding: 0 30px; margin-bottom: 10px;">
					<div style="width: 250px; border-bottom: 1px solid darkgrey;">
						<h3>${schedule.selectedMovie }</h3>
					</div>
				</div>

				<div
					style="float: left; width: 328px; padding: 0 30px; margin-top: 10px;">
					<div
						style="width: 250px; height: 140px; border-bottom: 1px solid darkgrey; margin-left: 6px;">
						<ul
							style="list-style: none; float: left; margin-right: 15px; margin-left: 10px; padding: 10px 20px;">
							<li class="theaterInfo">가산시네마<span class="scheduleCode" style="font-size: 0%;">${schedule.selectedScheduleCode }</span></li>
							<li class="theaterInfo">${schedule.selectedTheaterNumber }관</li>
							<li class="theaterInfo">${schedule.selectedDate.substring(4, 6) }.${schedule.selectedDate.substring(6, 8) }
								(${dayOfWeek })</li>
							<li class="theaterInfo">${schedule.selectedStartTime }~
								${schedule.selectedEndTime }</li>
						</ul>
						<img src="/resources/images/${movie.selectedPoster }" width="90"
							height="120" style="margin-bottom: 0px; float: left;">
					</div>
				</div>

				<div>

					<h3 style="margin-left: 35px;">선택좌석</h3>
					<div
						style="width: 250px; height: 120px; margin: 0 auto; border-bottom: 1px solid darkgrey; padding: 0 10px;">
						<ul style="list-style: none; padding: 0px 15px;"
							id="selectedSeatList">
							<!-- <li class="finalSeat"><button class="selectedSeat"
									style="width: 40px; height: 40px; border: none;">A13</button></li>
							<li class="finalSeat"><button class="selectedSeat"
									style="width: 40px; height: 40px; border: none;">A7</button></li>
							<li class="finalSeat"><button class="selectedSeat"
									style="width: 40px; height: 40px; border: none;">B10</button></li>
							<li class="finalSeat"><button class="selectedSeat"
									style="width: 40px; height: 40px; border: none;">B8</button></li>
							<li class="finalSeat"><button class="selectedSeat"
									style="width: 40px; height: 40px; clear: both; border: none;">F8</button></li>
							<li class="finalSeat"><button class="selectedSeat"
									style="width: 40px; height: 40px; border: none;">F12</button></li>
							<li class="finalSeat"><button class="selectedSeat"
									style="width: 40px; height: 40px; border: none;">F8</button></li>
							<li class="finalSeat"><button class="selectedSeat"
									style="width: 40px; height: 40px; border: none;">F12</button></li> -->
						</ul>
					</div>
				</div>
				<div>
					<div style="float: left; margin-top: 25px; padding: 0 30px;">
						성인 <span class="adultType">0</span> 명 청소년 <span class="youthType">0</span>
						명 우대 <span class="preferentialType">0</span> 명
					</div>
					<div
						style="clear: both; padding: 0 30px; margin-top: 20px; font-size: 140%;">
						최종 결제금액 <span style="float: right;">원</span> <span
							style="float: right; color: cadetblue; font-size: 120%;"
							class="payment">0</span>
					</div>
				</div>
				<div class="buttonBox"
					style="text-align: center; clear: both; margin-top: 25px;">
					<button type="button" class="payBtn"
						style="width: 164px; height: 55px; float: left; z-index: 999; background-color: #029ACF; outline: none; border: none; color: white; font-size: 150%;">결제</button>
					<button type="button" class="cancelBtn"
						style="width: 164px; height: 55px; float: left; z-index: 999; background-color: rgb(120, 120, 120); outline: none; border: none; color: white; font-size: 150%;">취소</button>
				</div>
			</div>

		</div>

	</div>
	<!-- reservationBox end -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
		<script type="text/javascript" src="resources/js/seatList.js"></script>

</body>

</html>