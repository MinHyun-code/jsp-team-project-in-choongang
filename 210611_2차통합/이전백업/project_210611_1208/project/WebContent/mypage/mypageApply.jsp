<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/mypage/mypageApply.css">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
</head>

<body>
	<div id="page">
		<header>
			<div>
				<h1 onclick="location.href='${pageContext.request.contextPath}/main.jsp'" style="cursor: pointer; text-align: center;
				font-size: 130px; color: #002266; margin-bottom: 40px;">다JOB아</h1>
			</div>
			<nav>
				<a href="#">채용공고</a> 
				<a href="${pageContext.request.contextPath}/searchHire.jsp">회사검색</a> 
				<a href="${pageContext.request.contextPath}/communityList.do">커뮤니티</a> 
				<a href="${pageContext.request.contextPath}/mypage.jsp">마이페이지</a> 
				<c:if test="${sessionID != null }">
					<a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
				</c:if>
				<c:if test="${sessionID == null }">
					<a href="${pageContext.request.contextPath}/log/login.jsp">로그인</a>
				</c:if>
			</nav>
		</header>
	<div id="apply3">${member.m_name}님의 지원현황입니다.</div>	
		<div id="apply">
	<div id="apply1">
	<br>지원완료<br>
	  ${applyCnt}
	  </div>
	<div id="apply2">
	<br>지원취소<br>
	  ${ ap_cnt}
	</div>
	</div>
	<div id="main">
					<table>
						<thead>
							<th>&nbsp;지원날짜&nbsp;</th>
							<th>&nbsp;기업이름&nbsp;</th>
							<th>&nbsp;공고제목&nbsp;</th>
						</thead>
			<c:forEach var="allist" items="${list}">
				<tr>
					<td>${allist.a_date}</td>
					<td><a href="#" target="_blank"
						onclick="window.open('${pageContext.request.contextPath}/popUpHireUnion.do?union=	${allist.rc_name} ',
					                       'name','resizable=no width=600 height=500');return false">${allist.rc_name}
					</a></td>

					<td>${allist.rc_title}</td>
				</tr>
			</c:forEach>

		</table>
		</div>
		</div>
		<footer> Copyright & copy </footer>
</body>

</html>