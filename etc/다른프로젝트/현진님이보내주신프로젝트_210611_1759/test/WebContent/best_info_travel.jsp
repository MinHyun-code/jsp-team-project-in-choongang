<%@page import="dao.Post"%>
<%@page import="java.util.List"%>
<%@page import="dao.Post_dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/post_style.css" type="text/css">
</head>
<body>
<form action="">
	<div id="mark">
		<a href="main.do"><img src="images/mark.png"></a> 
	</div>
	
	<div id= "menu">
		<ul>
			<li><a href="info_travel.do">여행지 정보 제공</a></li>
			<li><a href="matching.do">매칭</a></li>
			<li><a href="market.do">장터</a></li>
			<li><a href="best_info_travel.do">베스트여행지</a></li>
			<li><a href="searchForm.do">통합검색</a></li>
		</ul>
	</div>
	
	<div id="login">
		<a href="login.do"><input type="button" id="log_but" value="로그인"></a>
	</div>

		<div id="post_title">
			<a href='best_info_travel.do'>베스트여행지</a>
	</div>
	
	<div class="content">
		<div>
			<table class="post_st center">
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
				</tr>
					<c:if test="${totCnt > 0 }">
						<c:forEach var="postmember" items="${list }">
							<tr>
								<td class="left">
									<c:if test="${postmember.recommend >= 20 }">
										<img src="images/hot.gif">
									</c:if>
									<a href='m_content.do?board_no=${postmember.board_no}&post_no=${postmember.post_no }&pageNum=${currentPage}'>
									${postmember.post_title }</a>
								</td>
								<td>${postmember.nickname }</td>
								<td>${postmember.hits }</td>
							</tr>
							<c:set var="startNum" value="${startNum - 1 }" />
						</c:forEach>	
					</c:if>
					<c:if test="${totCnt == 0 }">
						<tr>
							<td>데이터가 없음</td>
						</tr>
					</c:if>
			</table>
		</div>
		
		<div style="text-align: center;">
			<table class="post_st">
				<tr>
					<td>
						<c:if test="${startPage > blockSize }">
							<a href='matching.do?pageNum=${startPage-blockSize}'>[이전]</a>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<a href='matching.do?pageNum=${i}'>${i} </a>
						</c:forEach>
						<c:if test="${endPage < pageCnt }">
							<a href='matching.do?pageNum=${startPage+blockSize}'>[다음]</a>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
	</div>
</form>
</body>
</html>