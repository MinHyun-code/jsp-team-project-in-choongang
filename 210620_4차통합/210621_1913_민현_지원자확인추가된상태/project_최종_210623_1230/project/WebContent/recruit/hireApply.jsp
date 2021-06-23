<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/mypage/mypageApply.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dropDown.css">
</head>
<body>
	<div id="page">
		<div id="main">
			
		<div id="apply3"  style="margin-left: 30%; margin-bottom: 5%;">
			<h2 style="font-weight: normal;">지원현황</h2>
		</div>
			<table id="table_apply">
				<thead>
					<tr>
						<th>&nbsp;아이디&nbsp;</th>
						<th>&nbsp;이력서&nbsp;</th>
						<th>&nbsp;지원날짜&nbsp;</th>
					</tr>
				</thead>
				<c:forEach var="allist" items="${list}">
					<tr>
						<td>${allist.m_id}</td>
						<td><input class="btn" style="width: 130px;" type="button"  
						onclick="location.href='${pageContext.request.contextPath}/hireApplyResume.do?r_num=${allist.r_num }&m_id=${allist.m_id }'" value="이력서 보기"></td>
						<td>${allist.a_date}</td>
					</tr>
				</c:forEach>
			</table>

		</div>
	</div>
</body>
</html>