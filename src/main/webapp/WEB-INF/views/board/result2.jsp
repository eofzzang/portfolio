<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="header.jsp"%>


<table class="table table-hover">
	<thead>
		<tr>
			<th>${imgUrl }</th>
			<th>${profile }</th>
			<%-- <th>${Nm}(${NmEn})</th> --%>
			<%-- <th>${sex}${RoleNm}</th> --%>
		</tr>
	</thead>
	<tr>
		<td colspan="2"><c:forEach items="${list}" var="list">
			<a href="result4?mNm=${list.movieNm.replaceAll(' ','')}&dNm=${n}&img=${img}&movieCd=${list.movieCd}">
			<c:out value="${list.movieNm}" /></a>

			</c:forEach></td>
	</tr>
</table>
