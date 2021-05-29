<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/community/community.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/community/communityContent.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>${board.subject}</title>
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
		
		
		<div id="container">
			<section id="point">
				<article class="pt pt1">
					<table class="pt_tb">
						<tr>
							<td><h1>${board.subject}</td>
						</tr>
						<tr>
							<td>${board.m_id }</td>
							<td><fmt:formatDate value="${board.reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>						
						<tr>
							<td colspan="100"><hr></td>
						</tr>
						<tr>
							<td>${board.content}</td>
						</tr>
						<tr>
						<c:if test="${sessionID == board.m_id}">
							<td>
								<form action="${pageContext.request.contextPath}/communityDeletePro.do" method="post">
									<input type="hidden" name="bd_code" value="${board.bd_code}">
									<input type="hidden" name="bd_num" value="${board.bd_num}">
									<input type="hidden" name="m_id" value="${sessionID}">
									<button type="submit" class="delete_btn">삭제</button>
								</form>
							</td>
						</c:if>
						</tr>
					</table>
				</article>
			</section>
			<section id="">
				<article id="">
				</article>
				<article>
				</article>
			</section>
			<section id="">
				<article>
				</article>
			</section>
		</div>
		
		
		<aside id="right">
			<ul>
				<li id="asideMenuCommunity"><a href="#">커뮤니티</a></li>
				<li id="asideMenuWrite"> <a href="${pageContext.request.contextPath}/communityWriteForm.do">글 작성하기</a></li>
				<li id="asideMenuInfo"> <a href="#">정보 공유</a></li>
				<li id="asideMenuToktok"> <a href="#">취준 톡톡</a></li>
				<li id="asideMenuMyTok"> <a href="#">내 질문 보기</a></li>
			</ul>
		</aside>
		<footer> Copyright & copy </footer>

	</div>
</body>

</html>