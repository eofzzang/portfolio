<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="header.jsp"%>

<table class="table table-hover">
	<thead>
		<tr>
			<th><img src="${fn:split(img,'|')[0]}" /></th>
			<th>${mNm.replaceAll('!HS','').replaceAll('!HE','').replaceAll(' ','')}(${mNmEn}),${year}년 ${open}</th>
			<th>상영시간:${showTm}분, ${grade }<br>장르:${genre} ,
				상영일자:${openDt}
			</th>
		</tr>
	</thead>
	<tr>
		<td></td>
		<td colspan="2"> <c:forEach items="${list}" var="list">
				<a href="result2?img=${fn:split(img,'|')[0]}&Nm=${list.actorNm}&title=${mNm.replaceAll('!HS','').replaceAll('!HE','').replaceAll(' ','')}">${list.actorNm}</a>
				<a href="${movieCd}"><c:out value="${list.movieNm}" /></a><!-- ????? -->

			</c:forEach>
			</td>
	</tr>
	<tr>
		<td>줄거리</td>
		<td colspan="2"><br>${plot }</td>
	</tr>
</table>

