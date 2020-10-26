<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
	<!-- <link href="http://img.cgv.co.kr/R2014/css/reset.css" rel="stylesheet"> -->
	<link href="/resources/cgv.css" rel="stylesheet">
	<link href="/resources/simplex.css" rel="stylesheet">

	<style>
      .jbFixed {
        width : 100%;
        position: fixed;
        top: 0px;
        z-index : 1;
      }
    </style>

</head>

<body>

	

</body>
        
    <div class="display-5">
        <ul>
            <li><a href="/customLogin">로그인</a></li>
            <li><a href="/customSignup">회원가입</a></li>
        </ul>
    </div>

    <div class="jumbotron">
        <a href="/main"><h1 class="display-3">CINEMA</h1></a>
    </div>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarColor02">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <a class="nav-link" href="#">영화 <span class="sr-only">(current)</span></a>
                <ul class="sub-menu">
                    <li><a href="/movieChart">무비 차트</a></li>
                    <li><a href="#">무비 파인더</a></li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">예매 <span class="sr-only">(current)</span></a>
                  <ul class="sub-menu">
                      <li><a href="#">빠른예매</a></li>
                      <li><a href="#">상영시간표</a></li>
                  </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">이벤트<span class="sr-only">(current)</span></a>
                    <ul class="sub-menu">
                        <li><a href="#">영화</a></li>
                        <li><a href="#">시사회</a></li>
                        <li><a href="#">제휴할인</a></li>
                    </ul>
            </li>
          </ul>
          <form class="form-inline my-2 my-lg-0" action="/board/result" method='get'>
            <input class="form-control mr-sm-2" type="text" name="sear" placeholder="영화 검색">
            <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
          </form>
        </div>
      </nav>     
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        
        <script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
        <script>
      $( document ).ready( function() {
        var jbOffset = $( '.navbar' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.navbar' ).addClass( 'jbFixed' );
          }
          else {
            $( '.navbar' ).removeClass( 'jbFixed' );
          }
        });
      } );
    </script>

</html>        