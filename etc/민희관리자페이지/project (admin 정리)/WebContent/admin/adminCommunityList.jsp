<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section id="communityMainTable">
	<article>
		<table class="communityListTable">
			<thead>
				<th>&nbsp;NO&nbsp;</th>
				<th>&nbsp;제목&nbsp;</th>
				<th>&nbsp;작성자&nbsp;</th>
				<th>&nbsp;등록 날짜&nbsp;</th>
				<th>&nbsp;조회수&nbsp;</th>
			</thead>
			<c:if test="${totCnt > 0 }">
				<c:forEach var="board" items="${list }">
					<tr>
						<td>${board.bd_num}</td>
						<c:if test="${board.bd_code == 1 }">
							<td class="td_main_subject">
								<span class="bd_code">[정보공유]&nbsp;</span>
								<a href='${pageContext.request.contextPath}/communityContent.do?bd_code=${board.bd_code}&bd_num=${board.bd_num}&pageNum=${currentPage}'>${board.subject}</a>
							</td>
						</c:if>
						<c:if test="${board.bd_code == 2 }">
							<td class="td_main_subject">
								<span class="bd_code">[취준톡톡]&nbsp;</span>
								<a href='${pageContext.request.contextPath}/communityContent.do?bd_code=${board.bd_code}&bd_num=${board.bd_num}&pageNum=${currentPage}'>${board.subject}</a>
							</td>
						</c:if>
						<td>${board.m_id}</td>
						<td>
							<fmt:formatDate value="${board.reg_date}" pattern="YYYY-MM-dd" />
						</td>
						<td>${board.read_count}</td>
						<td><button class="button_delete_community" data-bd_code="${board.bd_code}" data-bd_num="${board.bd_num}" data-m_id="${board.m_id}" data-current_page="${currentPage}">delete</button></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div class="pageNum">
			<ul>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${currentPage == i}">
						<li><a class="community_page" id="pageSelected" data-value="${i}">${i}</a></li>
					</c:if>
					<c:if test="${currentPage != i}">
						<li><a class="community_page" data-value="${i}">${i}</a></li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</article>
</section>
