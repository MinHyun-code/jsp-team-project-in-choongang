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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dropDown.css">
</head>
<body>
	<div id="page">
		<header>
			<div id="re">
				<div id="top1">
						&nbsp;&nbsp;
				</div>
				<div id="top2">
					<a href="${pageContext.request.contextPath}/main.jsp" style="cursor: pointer; text-align: center;
					font-size: 130px; color:#002266; margin-bottom: 40px; text-decoration: none;"><b>다JOB아</b></a>
				</div>
				<div id="top3">
					<div id="top3_1">
						<c:if test="${sessionID == null }">
							<a href="${pageContext.request.contextPath}/join.do" style="color:#002266;"><img alt="join.png" src="${pageContext.request.contextPath}/image/join.png" width="50px" height="50px"><br>JOIN</a>
						</c:if>
						<c:if test="${sessionID != null }">
							<a href="${pageContext.request.contextPath}/logout.do" style="color:#002266;"><img alt="logout.png" src="${pageContext.request.contextPath}/image/logout.png" width="50px" height="50px"><br>LOGOUT</a>
						</c:if>
						
					</div>
					<div id="top3_2">
						<c:if test="${sessionID == null }">
							<a href="${pageContext.request.contextPath}/log/login.jsp" style="color:#002266;"><img alt="login.png" src="${pageContext.request.contextPath}/image/login.png" width="50px" height="50px"><br>LOGIN</a>
						</c:if>
						<c:if test="${sessionID != null }"> 
							<a href="${pageContext.request.contextPath}/mypage.do" style="color:#002266;"><img alt="my.png" src="${pageContext.request.contextPath}/image/my.png" width="50px" height="50px"><br>MY</a>
						</c:if>
					</div>
				</div>
			</div>
			<div id="nav">
			<nav>
				<ul id="main-menu">
					<li><a href="${pageContext.request.contextPath}/rclist.do">채용공고</a></li>
					<li><a href="${pageContext.request.contextPath}/searchHire.do">채용검색</a></li>
					<li><a href="${pageContext.request.contextPath}/communityList.do">커뮤니티</a>
						<ul id="sub-menu">
							<li id="asideMenuCommunity"><a href="${pageContext.request.contextPath}/communityList.do">커뮤니티</a></li>
							<li id="asideMenuWrite"><a href="${pageContext.request.contextPath}/communityWriteForm.do">글 작성하기</a></li>
							<li id="asideMenuInfo"><a href="${pageContext.request.contextPath}/communityList.do?bd_code=1&pageNum=1">정보공유</a></li>
							<li id="asideMenuToktok"><a href="${pageContext.request.contextPath}/communityList.do?bd_code=2&pageNum=1">취준톡톡</a></li>
<!-- 							<li id="asideMenuMyTok"><a href="#">내 질문 보기</a></li> -->
						</ul></li>
					<li><a href="${pageContext.request.contextPath}/mypage.do">마이페이지</a>
						<ul id="sub-menu">
							<li id="asideMenuMyTok"><a href="${pageContext.request.contextPath}/mypage.do">마이페이지</a></li>
							<li id="asideMenuCommunity"><a href="${pageContext.request.contextPath}/mypageApply.do">지원현황</a></li>
							<li id="asideMenuWrite"><a href="${pageContext.request.contextPath}/preferList.do">관심공고</a></li>
							<li id="asideMenuInfo"><a href="${pageContext.request.contextPath}/mypageSelect.do">회원정보 수정</a></li>
							<li id="asideMenuToktok"><a href="${pageContext.request.contextPath}/resumeList.do">이력서 관리</a></li>
							<li id="asideMenuMyTok"><a href="${pageContext.request.contextPath}/introduceList.do">자기소개서 관리</a></li>
						</ul></li>
					<c:if test="${sessionID != null }">
						<li><a href="${pageContext.request.contextPath}/logout.do">로그아웃</a></li>
					</c:if>
					<c:if test="${sessionID == null }">
						<li><a href="${pageContext.request.contextPath}/log/login.jsp">로그인</a></li>
					</c:if>
				</ul>
			</nav>
			</div>
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
		<footer> Copyright & copy </footer>
	</div>
</body>
</html>