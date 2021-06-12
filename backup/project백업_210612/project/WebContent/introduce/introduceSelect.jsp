<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/introduce/introduceSelect.css">
</head>
<body>
	<div id="page">
		<header>
			<div>
				<h1
					onclick="location.href='${pageContext.request.contextPath}/main.jsp'"
					style="cursor: pointer; text-align: center; font-size: 130px; color: #002266; margin-bottom: 40px;">다JOB아</h1>
			</div>
			<nav>
				<a href="#">채용공고</a> <a href="searchHire.jsp">회사검색</a> <a
					href="${pageContext.request.contextPath}/communityList.do">커뮤니티</a> <a href="mypage.jsp"
					style="background-color: #235594">마이페이지</a>
				<c:if test="${sessionID != null }">
					<a href="logout.do">로그아웃</a>
				</c:if>
			</nav>
		</header>
		<div id="container">
			<section class="plus">
				<form id="inform"
					action="${pageContext.request.contextPath}/introduceList.do"
					method="post">
					<article id="point">
						<h2>자기소개서 확인</h2>
					</article>
					<table>
						<tr>
							<td id="td1" style="width: 20%; background-color: #EAEAEA;">제목</td>
							<td style="background-color: #EAEAEA;"><input type="text" disabled placeholder="id"
								style="width: 700px; background-color: white" name="si_ques" value="${self.si_ques }"></td>
						</tr>
						<tr style="height: 600px">
							<td id="td1" style="width: 20%; background-color: #EAEAEA;">내용</td>
							<td style="background-color: #EAEAEA; width: 1200px;"><textarea disabled placeholder="id"
									id="content" name="si_content" style="width: 800px; background-color: white">${self.si_content }</textarea></td>
						</tr>
					</table>
					<input type="submit" value="목록" style="float: left;">
				</form>
			</section>
		</div>

		<aside id="right">
			<ul>
				<li style="background-color: #235594"><a
					href="${pageContext.request.contextPath}/introduceList.do">자기소개서
						관리</a></li>
				<li><a href="${pageContext.request.contextPath}/resumeList.do">이력서
						관리</a></li>
				<li><a href="#">입사지원 현황</a></li>
				<li><a href="#">관심공고</a></li>
				<li><a
					href="${pageContext.request.contextPath}/mypageSelect.do">회원정보
						수정</a></li>
			</ul>
		</aside>
		<footer> Copyright & copy </footer>
	</div>
</body>
</html>