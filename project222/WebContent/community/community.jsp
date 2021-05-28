<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/community/community.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Community Page</title>
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
				<h1 onclick="location.href='${pageContext.request.contextPath}/main.jsp'" style="cursor: pointer; text-align: center;
				font-size: 130px; color: #002266; margin-bottom: 40px;">다JOB아</h1>
			</div>
			<nav>
				<a href="#">채용공고</a>
				<a href="${pageContext.request.contextPath}/searchHire.jsp">회사검색</a>
				<a href="#">커뮤니티</a>
				<a href="#">마이페이지</a>
				<a href="#">로그인</a>
			</nav>
		</header>
		<div id="container">
			<section id="point">
				<article class="pt pt1">
					<table class="pt_tb">
						<thead>
							<th align="center">인기 정보 글</td>
						</thead>
						<tr>
							<td align="center"><a href="#">[HOT] 언택트 집.콕. 취준 꿀팁</a></td>
						</tr>
						<tr>
							<td align="center"><a href="#">기업별 연봉 인기순위 TOP 10</a></td>
						</tr>
						<tr>
							<td align="center"><a href="#">브랜드 홍보의 달인, 마케팅 기획자</a></td>
						</tr>
					</table>
				</article>
				<article class="pt pt2">
					<table class="pt_tb">
						<thead>
							<th align="center">인기 취준 톡톡</td>
						</thead>
						<tr>
							<td align="center"><a href="#">저 어떻하죠…</a></td>
						</tr>
						<tr>
							<td align="center"><a href="#">이력서 궁금한 점이 있는데요</a></td>
						</tr>
						<tr>
							<td align="center"><a href="#">이런 회사 어떨까요</a></td>
						</tr>
					</table>
				</article>
			</section>
			<section id="communityMainSearch">
				<article id="communityMainTag">
					<h2>HOT 태그</h2>
					<ul>
						<li><a href="#">#면접</a></li>
						<li> <a href="#">#기업</a></li>
						<li> <a href="#">#복지</a></li>
						<li> <a href="#">#뉴스</a></li>
						<li> <a href="#">#급여</a></li>
					</ul>
				</article>
				<article>
					<table id="searchBox">
						<tr>
							<td><input type="text" placeholder="Search" id="search">
							</td>
							<td><a href="#"><input type="image" src="${pageContext.request.contextPath}/image/search.png" id="searchimg"></a></td>
						</tr>
					</table>
				</article>
			</section>
			<section id="communityMainTable">
				<article>
					<table>
						<thead>
							<th>&nbsp;게시판&nbsp;</th>
							<th>&nbsp;제목&nbsp;</th>
							<th>&nbsp;작성자&nbsp;</th>
							<th>&nbsp;등록 날짜&nbsp;</th>
						</thead>
						<c:if test="${totCnt > 0 }">
							<c:forEach var="board" items="${list }">
								<tr>
									<td>${startNum }</td>
									<td>${board.subject }</td>
									<td>${board.m_id }</td>
									<td>${board.reg_date }</td>
								</tr>
								<c:set var="startNum" value="${startNum - 1 }" />
							</c:forEach>
						</c:if>
					</table>
					<div class="pageNum">
						<ul>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${currentPage == i}">
									<li><a href='${pageContext.request.contextPath}/list.do?pageNum=${i}' id="pageSelected">${i}</a></li>
								</c:if>
								<c:if test="${currentPage != i}">
									<li><a href='${pageContext.request.contextPath}/list.do?pageNum=${i}'>${i}</a></li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</article>
			</section>
		</div>
		<aside id="left">
			<ul>
				<li id="asideMenuCommunity"><a href="#">커뮤니티</a></li>
				<li id="asideMenuWrite"> <a href="#">글 작성하기</a></li>
				<li id="asideMenuInfo"> <a href="#">정보 공유</a></li>
				<li id="asideMenuToktok"> <a href="#">취준 톡톡</a></li>
				<li id="asideMenuMyTok"> <a href="#">&nbsp; ㄴ 내 질문 보기</a></li>
			</ul>
		</aside>
		<footer> Copyright & copy </footer>

	</div>
</body>

</html>