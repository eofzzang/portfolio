<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	.layer{
		position : absolute;
		text-align : center;
		width : 100%;
		height : 100%;
		top : 0;
		left : 0;	
	}
	.layer .content{
		/* height : 100%; */
		display : inline-block;
		vertical-align : middle	
	}
	.layer .blank{
		display:inline-block;
		width:0;
		height:100%;
		vertical-align:middle
	}
</style>
<body onload="javascript:window_onload()">

<div class="layer">
<span class="content">	
<h1> 앗! 빠른 시일내로 수정하겠습니다..</h1>
<img src="https://t1.daumcdn.net/cfile/blog/24775D5058AFA70F37"/>
</span>
<span class="b"></span>
<span class="blank"></span>
</div>
<script>
function window_onload(){

	setInterval(a,1000),
    setTimeout('go_url()',3000)  // 5초후 go_url() 함수를 호출한다.
		
}
function a(){
	$(".b").html("아니?!");
}
function go_url(){

    location.href="/main"  // 페이지 이동...

 }
</script>
</body>
