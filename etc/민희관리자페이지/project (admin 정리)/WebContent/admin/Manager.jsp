<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<table border="1">
			<tr>
				<td>no</td>
				<td>아이디</td>
				<td>이름</td>
				<td>생년월일</td>
				<td>성별</td>
				<td>이메일</td>
				<td>전화번호</td>
				<td>주소</td>
				<td>가입현황</td>
		<c:if test="${totCnt > 0 }">
		<c:forEach var="mb" items="${list }">
			<tr>
				<td>${mb.rn}</td>
				<td>${mb.m_id }</td>
				<td>${mb.m_name }</td>
				<td>${mb.m_birth }</td>
				<td>${mb.m_gender }</td>
				<td>${mb.m_email }</td>
				<td>${mb.m_phone }</td>
				<td>${mb.m_addr }</td>
				<c:if test="${mb.m_tf==1 }">
					<td><button type="button" onclick="location.href='${pageContext.request.contextPath}/tfupdate.do?m_id=${mb.m_id }';">탈퇴</button></td>
				</c:if>
				<c:if test="${mb.m_tf==2 }">
					<td>탈퇴</td>
				</c:if>
			</tr>
		</c:forEach>
		</c:if>
	</table>
	<div class="pageNum">
		<ul>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${currentPage == i }">
					<li><a href="${pageContext.request.contextPath}/manager.do?pageNum=${i}" id="pageSelected">${i}</a></li>
				</c:if>
				<c:if test="${currentPage != i}">
					<li><a href="${pageContext.request.contextPath}/manager.do?pageNum=${i}">${i}</a></li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</body>
</html>