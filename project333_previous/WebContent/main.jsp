<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/main.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Main Page</title>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/community/js/community.js"></script>
<script src="${pageContext.request.contextPath}/main.js"></script>
<script type="text/javascript">
	function popUp() {
		window.open('popUpHire.jsp', 'Hire', 'width=800, height=1600');
	}
</script>
</head>
<body>
	<div id="page">
		<header>
			<div>
				<h1 onclick="location.href='main.do'" style="cursor: pointer; text-align: center; font-size: 130px; color: #002266; margin-bottom: 40px;">다JOB아</h1>
			</div>
			<nav>
				<a href="${pageContext.request.contextPath}/rclist.do">채용공고</a>
				<a href="${pageContext.request.contextPath}/searchHire.do">회사검색</a>
				<a href="${pageContext.request.contextPath}/communityList.do">커뮤니티</a>
				<a href="${pageContext.request.contextPath}/mypage/mypage.jsp">마이페이지</a>
				<c:if test="${sessionID != null }">
					<a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
				</c:if>
				<c:if test="${sessionID == null }">
					<a href="${pageContext.request.contextPath}/log/login.jsp">로그인</a>
				</c:if>

			</nav>
			<table id="searchBox">
				<tr>
					<td>
						<input type="text" placeholder="Search" id="search">
					</td>
					<td>
						<a href="#">
							<input type="image" src="./image/search.png" id="searchimg">
						</a>
					</td>
				</tr>
			</table>
		</header>
		<div id="container">
			<article id="point">
				<section id="pt_community_info" class="pt_community">
					<h2 align="center">커뮤니티 인기글</h2>
					<table id="pt_tb_community_info" class="pt_tb">
						<c:set var="popular_i" value="0" />
						<c:forEach var="board" items="${listPopular_info}">
							<c:set var="popular_i" value="${popular_i + 1}" />
							<tr class="community_info_${popular_i}_subject">
								<td align="center">
									<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${board.bd_code}&bd_num=${board.bd_num}">${board.subject}</a>
								</td>
								<td class="community_info_${popular_i}_content_triangle">
									▲
								</td>
							</tr>
							<tr class="community_info_${popular_i}_content">
								<td  class="community_info_content" align="center">
									<c:choose>
										<c:when test="${fn:length(board.content) gt 150}">
											<c:out value="${fn:substring(board.content, 0, 150)} ${'...'}"></c:out>
										</c:when>
										<c:otherwise>
											<c:out value="${board.content}"></c:out>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</table>
				</section>
				<section id="pt_community_QnA" class="pt_community">
					<h2 align="center">뉴스</h2>
					<table border="1" class="pt_tb">
						<tr>
							<td align="center">뉴스</td>
						</tr>

					</table>
				</section>
			</article>
			<article id="content">
				<section class="ct">
					<table border="1" class="ct_tb">
						<tr>
							<td align="center">
								<img alt="logo" src="./image/hireLogo.png" onclick="popUp()" style="cursor: pointer;" width="270px" height="160px"> 안전관리자 계약/정규직 채용
							</td>
						</tr>
					</table>
				</section>
				<section class="ct">
					<table border="1" class="ct_tb">
						<tr>
							<td align="center">채용 공고 2</td>
						</tr>
					</table>
				</section>
				<section class="ct">
					<table border="1" class="ct_tb">
						<tr>
							<td align="center">채용 공고 3</td>
						</tr>
					</table>
				</section>
				<section class="ct">
					<table border="1" class="ct_tb">
						<tr>
							<td align="center">채용 공고 4</td>
						</tr>
					</table>
				</section>
				<section class="ct">
					<table border="1" class="ct_tb">
						<tr>
							<td align="center">채용 공고 5</td>
						</tr>
					</table>
				</section>
				<section class="ct">
					<table border="1" class="ct_tb">
						<tr>
							<td align="center">채용 공고 6</td>
						</tr>
					</table>
				</section>
			</article>
		</div>
		<aside id="right">
			<ul>
				<li><a href="#">마이페이지</a></li>
				<li><a href="#">이력서 관리</a></li>
				<li><a href="#">커뮤니티</a></li>
				<li><a href="#">관심채용</a></li>
			</ul>
		</aside>
		<footer> Copyright & copy </footer>

	</div>
</body>
</html>