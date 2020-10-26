<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="board/header.jsp"%>

<html>
<head>
	<title>메인화면</title>

</head>
<body>


<div id="container">
	<div id="contents">
	<ol>
		<c:forEach items="${list}" var="list">
		<li>
		<div class="box-image">
			<strong class="rank">${list.ranks}</strong>
			<span class="thumb-image">
				<a href="/board/result5?title=${list.movieTitles.replaceAll(' ','')}&rel=${list.movieOpenDates.replaceAll('\\.','').replaceAll('개봉','')}"><img src="${list.imgs}"></a>
				<c:set var="name" value="${list.movieAges}" /> 
					<c:choose>
						<c:when test="${name eq '전체'}" >
							<span class="ico-grade grade-all"></span>
						</c:when>
						<c:when test="${name eq '청소'}">
							<span class="ico-grade grade-19"></span>
						</c:when>
						<c:when test="${name eq '미정'}">
							<span class="ico-grade grade-none"></span>
						</c:when>
						<c:otherwise>
							<span class="ico-grade grade-${list.movieAges}"></span>
						</c:otherwise>
					</c:choose>
			</span>
		</div>
		<div class="box-contents">
			<strong class="title">
				${list.movieTitles}
			</strong>
			<div class="score">
				<strong class="percent">
					예매율 <span>${list.movieRates}</span>
				</strong>
			</div>
			<span class="txt-info">
				<strong>${list.movieOpenDates}</strong>
			</span>
			<span class="like">
				<a class="link-reservation" href="#">예매</a>
			</span>
		</div>
		</li>
		</c:forEach>
	</ol>
	</div>
</div>

</body>
</html>
