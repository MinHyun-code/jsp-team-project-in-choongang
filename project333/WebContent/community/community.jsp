<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Community Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/community/css/community.css">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/community.js"></script>
</head>

<body>
	<div id="page">
		<header>
			<div>
				<h1 onclick="location.href='${pageContext.request.contextPath}/main.jsp'" style="cursor: pointer; text-align: center; font-size: 130px; color: #002266; margin-bottom: 40px;">다JOB아</h1>
			</div>
			<nav>
				<ul id="main-menu">
					<li><a href="#">채용공고</a></li>
					<li><a href="${pageContext.request.contextPath}/searchHire.jsp">회사검색</a></li>
					<li><a href="${pageContext.request.contextPath}/communityList.do">커뮤니티</a>
						<ul id="sub-menu">
							<li id="asideMenuCommunity"><a href="${pageContext.request.contextPath}/communityList.do">커뮤니티</a></li>
							<li id="asideMenuWrite"><a href="${pageContext.request.contextPath}/communityWriteForm.do">글 작성하기</a></li>
							<li id="asideMenuInfo"><a href="#">정보 공유</a></li>
							<li id="asideMenuToktok"><a href="#">취준 톡톡</a></li>
							<li id="asideMenuMyTok"><a href="#">내 질문 보기</a></li>
						</ul></li>
					<li><a href="${pageContext.request.contextPath}/mypage.jsp">마이페이지</a></li>
					<c:if test="${sessionID != null }">
						<li><a href="${pageContext.request.contextPath}/logout.do">로그아웃</a></li>
					</c:if>
					<c:if test="${sessionID == null }">
						<li><a href="${pageContext.request.contextPath}/log/login.jsp">로그인</a></li>
					</c:if>
				</ul>
			</nav>
		</header>
		<div id="container">
			<section id="point">
				<article class="pt pt1">
					<table class="pt_tb">
						<thead>
							<th align="center">인기 정보 글
							</td>
						</thead>
						<c:forEach var="board" items="${listPopular1}">
							<tr>
								<td align="center">
									<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${board.bd_code}&bd_num=${board.bd_num}">${board.subject}</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</article>
				<article class="pt pt2">
					<table class="pt_tb">
						<thead>
							<th align="center">인기 취준 톡톡
							</td>
						</thead>
						<c:forEach var="board" items="${listPopular2}">
							<tr>
								<td align="center">
									<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${board.bd_code}&bd_num=${board.bd_num}">${board.subject}</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</article>
			</section>
			<section id="communityMainSearch">
				<article id="communityMainTag">
					<h2>HOT 태그</h2>
					<ul>
						<li><a href="${pageContext.request.contextPath}/communityList.do?word=%23면접">#면접</a></li>
						<li><a href="${pageContext.request.contextPath}/communityList.do?word=%23기업">#기업</a></li>
						<li><a href="${pageContext.request.contextPath}/communityList.do?word=%23복지">#복지</a></li>
						<li><a href="${pageContext.request.contextPath}/communityList.do?word=%23뉴스">#뉴스</a></li>
						<li><a href="${pageContext.request.contextPath}/communityList.do?word=%23인터뷰">#인터뷰</a></li>
					</ul>
				</article>
				<article>
					<form method="GET">
						<table id="searchBox">
							<tr>
								<td>
									<input type="text" placeholder="Search" name="word" id="search">
								</td>
								<td>
									<input type="submit" value="검색" class="btn btn_search" formaction="${pageContext.request.contextPath}/communityList.do">
								</td>
							</tr>
						</table>
					</form>
				</article>
			</section>
			<section id="communityMainTable">
				<article>
					<table class="communityListTable">
						<thead>
							<th>&nbsp;NO&nbsp;</th>
							<th>&nbsp;제목&nbsp;</th>
							<th>&nbsp;작성자&nbsp;</th>
							<th>&nbsp;등록 날짜&nbsp;</th>
							<th>&nbsp;조회수&nbsp;</th>
						</thead>
						<c:if test="${totCnt > 0 }">
							<c:forEach var="board" items="${list }">
								<tr>
									<%-- <td>${startNum }</td> --%>

									<td>${board.bd_num}</td>
									<c:if test="${board.bd_code == 1 }">
										<td class="td_main_subject">
											<span class="bd_code">[정보공유]&nbsp;</span>
											<a href='${pageContext.request.contextPath}/communityContent.do?bd_code=${board.bd_code}&bd_num=${board.bd_num}&pageNum=${currentPage}'>${board.subject}</a>
										</td>
									</c:if>
									<c:if test="${board.bd_code == 2 }">
										<td class="td_main_subject">
											<span class="bd_code">[취준톡톡]&nbsp;</span>
											<a href='${pageContext.request.contextPath}/communityContent.do?bd_code=${board.bd_code}&bd_num=${board.bd_num}&pageNum=${currentPage}'>${board.subject}</a>
										</td>
									</c:if>
									<td>${board.m_id}</td>
									<td>
										<fmt:formatDate value="${board.reg_date}" pattern="YYYY-MM-dd" />
									</td>
									<td>${board.read_count}</td>
								</tr>
								<c:set var="startNum" value="${startNum - 1 }" />
							</c:forEach>
						</c:if>
					</table>
					<div class="pageNum">
						<ul>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${currentPage == i}">
									<li><a href='${pageContext.request.contextPath}/communityList.do?word=${word}&pageNum=${i}' id="pageSelected">${i}</a></li>
								</c:if>
								<c:if test="${currentPage != i}">
									<li><a href='${pageContext.request.contextPath}/communityList.do?word=${word}&pageNum=${i}'>${i}</a></li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</article>
			</section>
		</div>
		<aside id="right">
			<ul>
				<li id="asideMenuCommunity"><a href="#">커뮤니티</a></li>
				<li id="asideMenuWrite"><a href="${pageContext.request.contextPath}/communityWriteForm.do">글 작성하기</a></li>
				<li id="asideMenuInfo"><a href="#">정보 공유</a></li>
				<li id="asideMenuToktok"><a href="#">취준 톡톡</a></li>
				<li id="asideMenuMyTok"><a href="#">내 질문 보기</a></li>
			</ul>
		</aside>
		<footer> Copyright & copy </footer>

	</div>
</body>

</html>