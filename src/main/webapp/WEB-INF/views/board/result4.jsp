<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">영화 상세페이지</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				
				<!-- /.panel-heading -->
				<!-- <button id="regBtn" type="button" class="btn btn-xs pull-right">글쓰기</button> -->
			</div>
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
					<hr>
						<tr>
							<th><img src="${fn:split(img,'|')[0]}"/></th>
							<th>${mNm}(${mNmEn}),  ${year}년 ${open}</th>
							<th>상영시간:${showTm}분, ${grade }<br>장르:${genre} , 상영일자:${openDt}</th>
						</tr>
					</thead>
						<tr><td></td><td colspan="2"><hr>
					<c:forEach items="${list}" var="list">
						<c:set var="name" value="${list.cast}"/>
						<a href="result2?img=${fn:split(img,'|')[0]}&Nm=${list.peopleNm}&title=${mNm}">${list.peopleNm}</a>
							<c:choose>
								<c:when test="${name eq ''}"/>
								<c:otherwise>
								<c:out value="(${list.cast })"/>
								</c:otherwise>
							</c:choose>
							<a href="${movieCd}"><c:out value="${list.movieNm}" /></a>
							<%-- <td><a class='move' href='<c:out value="${result.subtitle }"/>'>
									<c:out value="${board.title}" />
									<c:out value="${result.subtitle}" />
									<b>[<c:out value="${board.replyCnt}"/>]</b>
							</a></td> --%>
							
							<%-- <td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updateDate}" /></td> --%>
						
					</c:forEach><hr>
						</td></tr>
						<tr>
							<td>줄거리</td><td colspan="2"><br>${plot }</td>
						</tr>
				</table>
			</div>
		</div>
	</div>
</div>
				
				