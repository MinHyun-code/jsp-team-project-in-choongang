<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="mypage.css">
</head>
<body>
	<div id="page">
		<header>
			<div>
				<h1 onclick="location.href='main.jsp'" style="cursor: pointer; text-align: center;
				font-size: 130px; color:  #002266; margin-bottom: 40px;">다JOB아</h1>
			</div>
			<nav>
				<a href="#">채용공고</a> 
				<a href="searchHire.jsp">회사검색</a> 
				<a href="${pageContext.request.contextPath}/list.do">커뮤니티</a> 
				<a href="mypage.jsp" style="background-color: #235594">마이페이지</a> 
			</nav>
		</header>
		<div id="container">
		</div>
		<aside id="right">
			<ul>
				<li><a href="introduce.jsp">자기소개서 관리</a></li>
				<li><a href="resume.jsp">이력서 관리</a></li>
				<li><a href="#">입사지원 현황</a></li>
				<li><a href="#">관심공고</a></li>
				<li style="background-color: #235594"><a href="mypageUpdate.jsp">회원정보 수정</a></li>
			</ul>
		</aside>
		<footer> Copyright & copy </footer>
	</div>
</body>
</html>