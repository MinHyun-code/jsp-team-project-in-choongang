<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section id="communityMainTable">
	<article>
		<table class="communityListTable">
			<thead>
				<th>&nbsp;NO&nbsp;</th>
				<th>&nbsp;회사&nbsp;</th>
				<th>&nbsp;공고명&nbsp;</th>
				<th>&nbsp;등록 날짜&nbsp;</th>
				<th>&nbsp;평균 연봉&nbsp;</th>
			</thead>
			<c:if test="${totCnt > 0 }">
				<c:forEach var="recruit" items="${list }">
					<tr>
						<td>${recruit.rc_num}</td>
							<td class="td_main_subject">
								<a href='${pageContext.request.contextPath}/communityContent.do?bd_code=${board.bd_code}&bd_num=${board.bd_num}&pageNum=${currentPage}'>${recruit.rc_name}</a>
							</td>
						<td>${recruit.rc_title}</td>
						<td>
							<fmt:formatDate value="${recruit.rc_date}" pattern="YYYY-MM-dd" />
						</td>
						<td>${recruit.rc_salary}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div class="pageNum">
			<ul>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${currentPage == i}">
						<li><a href='#' class="recruit_page" id="pageSelected" data-value="${i}">${i}</a></li>
					</c:if>
					<c:if test="${currentPage != i}">
						<li><a href='#' class="recruit_page" data-value="${i}">${i}</a></li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</article>
</section>
