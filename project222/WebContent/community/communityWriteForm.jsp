<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/community/community.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/community/communityWriteForm.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>${board.subject}</title>
<c:if test="${sessionID == null }">
	<script type="text/javascript">
		alert("로그인이 필요합니다.");
		location.href = "${pageContext.request.contextPath}/log/login.jsp";
	</script>
</c:if>
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
			<form action="${pageContext.request.contextPath}/communityWritePro.do" method="post">
				<input type="hidden" name="m_id" value="${sessionID}">
			<section id="point">
				<article class="pt pt1">
					<table class="pt_tb">
					<tr>
						<td>
							<select name="bd_code">
								<option value="1">정보공유</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><input type="text" name="subject" placeholder="글 제목">
					</tr>
					<tr>
						<td><textarea name="content" placeholder="글 내용"></textarea>
					</tr>
					<tr>
						<td><input type="submit" value="작성하기"></td>
					</tr>
					</table>
				</article>
			</section>
			</form>
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