<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- <link rel="stylesheet" href="/resources/simplex.css"> -->
<link rel="stylesheet" href="/resources/user_join.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>회원가입</title>


</head>
<body>
<%@ include file="board/header.jsp" %>
	<div class="container">
		<form role="form" method='post' action="/customSignup" id="regForm">
			<fieldset>
				<legend>회원가입</legend>
				<h4 style="font-weight: 600;">회원정보입력</h4>
				<hr color="black">
				<div class="form-group row">
					<label for="userid" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-10">
						<input style="width: 400px; height: 40px; float: left;"
							type="text" class="form-control" id="userid" name="userid"
							placeholder="아이디를 입력해주세요.">
						<button class="btn btn-dark" style="margin-left: 10px;"
							type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>

					</div>
				</div>
				<hr color="lightgray">
				<div class="form-group row">
					<label for="password" class="col-sm-2 col-form-label">비밀번호</label>
					<div class="col-sm-10">
						<input style="width: 400px; height: 40px; display: block;"
							type="password" class="form-control" id="userpw" name="userpw"
							placeholder="비밀번호를 입력해주세요."> <span
							style="font-size: small; color: red;">8-15자리의 영문/숫자/특수문자를
							함께 입력해주세요.</span>
					</div>
					<label style="margin-top: 10px;" for="passwordChk"
						class="col-sm-2 col-form-label">비밀번호 확인</label>
					<div class="col-sm-10">
						<input style="width: 400px; height: 40px; margin-top: 10px;"
							type="password" class="form-control" id="userPasswordChk"
							name="userPasswordChk" placeholder="입력하신 비밀번호를 다시 입력해주세요.">
					</div>
					<div class="alert alert-success" style="margin: -43px 0 0 600px;"
						id="alert-success">비밀번호가 일치합니다.</div>
					<div class="alert alert-danger" style="margin: -43px 0 0 600px;"
						id="alert-danger">비밀번호가 일치하지 않습니다.</div>
				</div>
				<hr color="lightgray">
				<div class="form-group row">
					<label for="email" class="col-sm-2 col-form-label">이메일</label>
					<div class="col-sm-10">
						<input style="width: 400px; height: 40px; float: left;"
							type="text" class="form-control" id="userEmail" name="userEmail"
							placeholder="이메일을 입력해주세요.">
						<button type="button" id="emailBtn" style="margin-left: 10px;"
							class="btn btn-dark">메일발송</button>
					</div>
				
				</div>
				<hr color="lightgray">
				<div class="form-group row">
					<label for="userEmailAuth" class="col-sm-2 col-form-label">인증번호</label>
					<div class="col-sm-10">
						<input style="width: 400px; height: 40px; float: left;"
							type="text" class="form-control" id="userEmailAuth"
							name="userEmailAuth" placeholder="전송된 이메일을 확인하신 후 인증번호를 입력해주세요.">
						<button type="button" id="emailAuthBtn" style="margin-left: 10px;"
							class="btn btn-dark">인증확인</button>
					</div>
					<%-- <input type="hidden" path="random" id="random" value="${random}" /> --%>
				</div>
				<hr color="lightgray">

				<div class="form-group row">
					<label for="gender" class="col-sm-2 col-form-label">이름</label>
					<div class="col-sm-10">
						<input style="width: 400px; height: 40px; float: left;"
							type="text" class="form-control" id="userName" name="userName"
							placeholder="이름을 입력해주세요.">
					</div>

				</div>
				<hr color="lightgray">

				<div class="form-group row">
					<label for="gender" class="col-sm-2 col-form-label">성별</label>
					<div class="col-sm-10">
						<input type="radio" style="margin: 12px 5px 0 0;" id="userGender"
							name="userGender" value="male"><span
							style="font-size: medium; margin-right: 15px;">남성</span> <input
							type="radio" style="margin: 12px 5px 0 0;" id="userGender"
							name="userGender" value="female"><span
							style="font-size: medium;">여성</span>
					</div>
				</div>
				<hr color="lightgray">
				<div class="form-group row">
					<label for="phone" class="col-sm-2 col-form-label">휴대폰 번호</label>
					<div class="col-sm-10">
						<input style="width: 400px; height: 40px; float: left;"
							type="phone" class="form-control" id="userPhone" name="userPhone"
							placeholder="(-)없이 번호만 입력해주세요.">
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
							사항입니다. 선택 시 원하는 영화의 정보를 더욱 빠르게 추천받으실 수 있습니다.</span> <input
							style="margin: 15px 5px 0 0;" id="userGenre" name="userGenre"
							type="checkbox" value="sport"><span
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
						class="btn btn-primary btn-lg" id="submit">회원가입</button>
					<button type="button" class="cencle btn btn-danger"
						style="width: 100px;" class="btn btn-default btn-lg">취소</button>
				</div>
			</fieldset>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	</div>


	<!-- jQuery -->
	<script src="/resources/js/jquery-3.5.1.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			// 취소
			$(".cencle").on("click", function() {
				location.href = "/";
			});

			$("#submit").on("click", function() {
				if ($("#userid").val() == "") {
					alert("아이디를 입력해주세요.");
					$("#userid").focus();
					return false;
				}
				if ($("#userpw").val() == "") {
					alert("비밀번호를 입력해주세요.");
					$("#userpw").focus();
					return false;
				}
				if ($("#userEmail").val() == "") {
					alert("이메일을 입력해주세요.");
					$("#userEmil").focus();
					return false;
				}
				if ($("#userName").val() == "") {
					alert("이름을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				
				if ($("#userGender").val() == "") {
					alert("성별을 선택해주세요.");
					$("#userGender").focus();
					return false;
				}
				if ($("#userGender").val() == "") {
					alert("성별을 선택해주세요.");
					$("#userGender").focus();
					return false;
				}
				if ($("#userPhone").val() == "") {
					alert("휴대폰 번호를 입력해주세요.");
					$("#userPhone").focus();
					return false;
				}
				if ($("#userBirth").val() == "") {
					alert("생년월일을 입력해주세요.");
					$("#userBirth").focus();
					return false;
				}
				
				
				
				var idChkVal = $("#idChk").val();
				if (idChkVal == "N") {
					alert("중복확인 버튼을 눌러주세요.");
					return false;
				} else if (idChkVal == "Y") {
					
					alert("회원가입을 축하드립니다. 이메일을 확인해주세요.");
					$("#regForm").submit();
					
				}
			});
			  
		});

		function fn_idChk(){
			
			$.ajax({
				url : "/idChk",
				type : "get",
				dataType: "json",
				data : { userid : $("#userid").val()},
				success : function(data) {
				console.log('data:' + data);
					if(data == 1) {
						alert("중복된 아이디입니다.");
					} else {
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.")
					}
				}
			}); // ajax 끝

		}
	</script>
	<script type="text/javascript">
	
	//비밀번호 일치 여부 검사
	$(function(){
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("#userPasswordChk").keyup(function(){
			var userpw = $("#userpw").val();
			var userPasswordChk = $("#userPasswordChk").val();
			if(userpw != "" || userPasswordChk != "") {
				if(userpw == userPasswordChk) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				}else{
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	});
	
	function chkPW(){

		 var pw = $("#userpw").val();
		 var num = pw.search(/[0-9]/g);
		 var eng = pw.search(/[a-z]/ig);
		 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		 if(pw.length < 8 || pw.length > 20){

		  alert("8자리 ~ 20자리 이내로 입력해주세요.");
		  return false;
		 }else if(pw.search(/\s/) != -1){
		  alert("비밀번호는 공백 없이 입력해주세요.");
		  return false;
		 }else if(num < 0 || eng < 0 || spe < 0 ){
		  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
		  return false;
		 }else {
			console.log("통과"); 
		    return true;
		 }

		}
	
	</script>

	

</body>

</html>