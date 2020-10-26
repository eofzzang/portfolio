<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="header.jsp"%>

<table class="table table-hover">
	<thead>
		<tr>
			<th><img src="${img }" /></th>
			<th>${mNm}(${mNmEn}),${year}년 ${open}</th>
			<th>상영시간:${showTm}분, ${grade }<br>장르:${genre} ,
				상영일자:${openDt}
			</th>
		</tr>
	</thead>
	<tr>
		<td></td>
		<td colspan="2"> <c:forEach items="${list}" var="list">
				<c:set var="name" value="${list.cast}" />
				<a href="result2?img=${img}&Nm=${list.peopleNm}&title=${mNm}">${list.peopleNm}</a>
				<c:choose>
					<c:when test="${name eq ''}" />
					<c:otherwise>
						<c:out value="(${list.cast })" />
					</c:otherwise>
				</c:choose>
				<a href="${movieCd}"><c:out value="${list.movieNm}" /></a>

			</c:forEach>
			</td>
	</tr>
	<tr>
		<td>줄거리</td>
		<td colspan="2"><br>${plot }</td>
	</tr>
</table>

