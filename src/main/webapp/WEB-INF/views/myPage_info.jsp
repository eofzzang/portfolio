<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="/resources/simplex.css">
<link rel="stylesheet" href="/resources/my_page.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<!-- jQuery -->
	<script src="/resources/js/jquery-3.5.1.min.js"></script>
<title>회원정보</title>
</head>
<body>
	<div class="nav_container" style="margin-left: 510px;">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link"
				style="text-align: center; width: 300px;" data-toggle="tab"
				href="my_page_booking.html">예매내역</a></li>
			<li class="nav-item"><a class="nav-link"
				style="text-align: center; width: 300px;" data-toggle="tab"
				href="my_page_board.html">게시글정보</a></li>
			<li class="nav-item"><a class="nav-link active"
				style="text-align: center; width: 300px;" data-toggle="tab"
				href="/myPage_info">회원정보수정</a></li>
		</ul>
		
		
		
		<sec:authorize access="isAuthenticated()">

       	<sec:authentication property="principal.username" var="userid" />
       	<sec:authentication property="principal.member.userName" var="userName"/>
       	<sec:authentication property="principal.member.userEmail" var="userEmail"/>


		<form action="/memberUpdate" method="post">
			<fieldset>
				<h4 style="font-weight: 600; margin-top: 100px;">회원정보수정</h4>
				<hr color="black">
				<div class="form-group row">
					<label for="userid" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-10">
						<input class="form-control-plaintext"
							style="width: 400px; height: 40px; float: left; font-size: 15px;"
							type="text" class="form-control" id="userid" name="userid"
							value="${userid}" readonly>
					</div>
				</div>
				<hr color="lightgray">
				<div class="form-group row">
					<label for="userpw" class="col-sm-2 col-form-label">비밀번호 변경</label>
					<div class="col-sm-10">
						<input style="width: 400px; height: 40px; display: block;"
							type="password" class="form-control" id="userpw" name="userpw"
							placeholder="변경할 비밀번호를 입력해주세요."> <span
							style="font-size: small; color: red;">8-15자리의 영문/숫자/특수문자를
							함께 입력해주세요.</span>
					</div>
					<label style="margin-top: 10px;" for="userPasswordChk"
						class="col-sm-2 col-form-label">비밀번호 확인</label>
					<div class="col-sm-10">
						<input style="width: 400px; height: 40px; margin-top: 10px;"
							type="password" class="form-control" id="userPasswordChk"
							name="userPasswordChk" placeholder="입력하신 비밀번호를 다시 입력해주세요.">
					</div>
				</div>
				<hr color="lightgray">
				<div class="form-group row">
					<label for="email" class="col-sm-2 col-form-label">이메일</label>
					<div class="col-sm-10">
						<input class="form-control-plaintext"
							style="width: 400px; height: 40px; float: left; font-size: 15px;"
							type="text" class="form-control" id="userEmail" name="userEmail"
							value="${userEmail}" readonly>			
					</div>
				</div>
				<hr color="lightgray">

				<div class="form-group row">
					<label for="gender" class="col-sm-2 col-form-label">이름</label>
					<div class="col-sm-10">
							<input class="form-control-plaintext"
							style="width: 400px; height: 40px; float: left; font-size: 15px;"
							type="text" class="form-control" id="userEmail" name="userEmail"
							value="${userName}" readonly>
					</div>

				</div>
			
				<hr color="lightgray">
				<div class="form-group row">
					<label for="phone" class="col-sm-2 col-form-label">휴대폰 번호</label>
					<div class="col-sm-10">
						<input style="width: 400px; height: 40px; float: left;"
							type="phone" class="form-control" id="userPhone" name="userPhone"
							placeholder="(-)는 빼고 입력해주세요.">
					</div>
				</div>
				<hr color="lightgray">
				<div class="form-group row">
					<label for="birth" class="col-sm-2 col-form-label">생년월일</label>
					<div class="col-sm-10">
						<input style="width: 400px; height: 40px; float: left;"
							type="text" class="form-control" id="userBirth" name="userBirth"
							placeholder="ex) 20200101">
					</div>
				</div>
				<hr color="lightgray">
				<div class="form-group row">
					<label for="userGenre" class="col-sm-2 col-form-label">관심장르</label>
					<div class="col-sm-10">
						<span style="display: block; margin-bottom: 10px;">※ 선택
							사항입니다. 선택 시 원하는 영화의 정보를 더욱 빠르게 추천받으실 수 있습니다.</span> <span
							style="display: block; margin: 0 0 10px 14px;">선택하지 않는 경우
							기존 선택에서 바뀌지 않습니다.</span> <input style="margin: 15px 5px 0 0;"
							id="userGenre" name="userGenre" type="checkbox" value="sport"><span
							style="font-size: medium; margin-right: 50px;">스포츠</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" value="crime"><span
							style="font-size: medium; margin-right: 50px;">범죄</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" value="drama"><span
							style="font-size: medium; margin-right: 50px;">드라마</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" value="comedy"><span
							style="font-size: medium; margin-right: 50px;">코미디</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" value="romelo"><span
							style="font-size: medium;">로맨스/멜로</span> <br> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" value="thriller"><span
							style="font-size: medium; margin-right: 50px;">스릴러</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" value="family"><span
							style="font-size: medium; margin-right: 50px;">가족</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" value="fear"><span
							style="font-size: medium; margin-right: 65px;">공포</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" value="war"><span
							style="font-size: medium; margin-right: 67px;">전쟁</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" value="rocomedy"><span
							style="font-size: medium;">로맨스/코미디</span> <br> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" value="fantasy"><span
							style="font-size: medium; margin-right: 50px;">판타지</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" value="action"><span
							style="font-size: medium; margin-right: 50px;">액션</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" value="sf"><span
							style="font-size: medium; margin-right: 80px;">SF</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" value="animation"><span
							style="font-size: medium; margin-right: 19px;">애니메이션</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" value="documentary"><span
							style="font-size: medium;">다큐멘터리</span>

					</div>
				</div>
				<hr color="lightgray">

				<div align="center" class="buttonbox">
					<button type="submit" style="margin-right: 150px;"
						class="btn btn-primary btn-lg" id="submit">정보수정</button>
					<button style="width: 100px;" class="cancle btn-primary btn-lg">취소</button>
				</div>
			</fieldset>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
		</sec:authorize>
	</div>

</body>
</html>

	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/";
						    
			});
		});
	</script>