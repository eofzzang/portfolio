<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="header.jsp"%>


<table class="table table-hover">
	<thead>
		<tr>
			<th scope="col">포스터</th>
			<th scope="col">제목</th>
			<th scope="col">감독</th>
			<th scope="col">배우</th>
			<th scope="col">평점</th>
		</tr>
	</thead>

	<c:forEach items="${list}" var="list">
		<tr class="table-default">
			<td><a
				href="result3?img=${list.image}&dNm=${fn:split(list.director,'|')[0].replaceAll(' ','')}&mNm=${list.title.replaceAll('\\<.*?\\>','').replaceAll(' ','')}"><img
					src="${list.image}" /></a></td>
			<td><a
				href="result3?img=${list.image}&dNm=${fn:split(list.director,'|')[0].replaceAll(' ','')}&mNm=${list.title.replaceAll('\\<.*?\\>','').replaceAll(' ','')}">
					<c:out value="${list.title}" escapeXml="false" />
					<!-- <b>태그 활성화 --> <c:set var="name" value="${list.subtitle}" /> <c:choose>
						<c:when test="${name eq ''}" />
						<c:otherwise>
							<c:out value="(${list.subtitle })" escapeXml="false" />
						</c:otherwise>
					</c:choose>
			</a></td>
			<td><c:forTokens items="${list.director}" delims="|" var="i">
					<a
						href="result2?img=${list.image}&Nm=${i}&title=${list.title.replaceAll('\\<.*?\\>','').replaceAll(' ','')}"><c:out
							value="${i}" /></a>
				</c:forTokens></td>
			<td><c:forTokens items="${list.actor}" delims="|" var="i">
					<a
						href="result2?img=${list.image}&Nm=${i.replaceAll('\\<.*?\\>','').replaceAll(' ','')}&title=${list.title.replaceAll('\\<.*?\\>','').replaceAll(' ','')}"><c:out
							value="${i}" escapeXml="false"/></a>
				</c:forTokens></td>

			<td><c:out value="${list.userRating}" /></td>
		</tr>
	</c:forEach>
</table>

<div class="breadcrumb">
	<div class='breadcrumb-item active'>
		${tot} 건의 결과가 검색됨<br>
	</div>
</div>

<%-- <div class='pull-right'>
					<ul class="pagination">

						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a href="${pageMaker.startPage -1}">Previous</a>
							</li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} "><a href="${num}">${num}</a></li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a href="${pageMaker.endPage +1}">Next</a></li>
						</c:if>
					</ul>
				</div> --%>
