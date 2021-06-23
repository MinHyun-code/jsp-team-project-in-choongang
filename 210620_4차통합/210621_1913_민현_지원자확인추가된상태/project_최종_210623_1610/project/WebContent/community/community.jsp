<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Community Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/community/css/community.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/community/css/communityMain.css">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/community.js"></script>
</head>

<body>
	<div id="page">
		<header>
			<div id="re">
				<div id="top1">&nbsp;&nbsp;</div>
				<div id="top2">
					<a href="${pageContext.request.contextPath}/main.do" style="cursor: pointer; text-align: center; font-size: 130px; color: #002266; margin-bottom: 40px; text-decoration: none;">
						<b>다JOB아</b>
					</a>
				</div>
				<div id="top3">
					<div id="top3_1">
						<c:if test="${sessionID == null }">
							<a href="${pageContext.request.contextPath}/join.do" style="color: #002266;">
								<img alt="join.png" src="${pageContext.request.contextPath}/image/join.png" width="50px" height="50px"><br>JOIN
							</a>
						</c:if>
						<c:if test="${sessionID != null }">
							<a href="${pageContext.request.contextPath}/logout.do" style="color: #002266;">
								<img alt="logout.png" src="${pageContext.request.contextPath}/image/logout.png" width="50px" height="50px"><br>LOGOUT
							</a>
						</c:if>

					</div>
					<div id="top3_2">
						<c:if test="${sessionID == null }">
							<a href="${pageContext.request.contextPath}/log/login.jsp" style="color: #002266;">
								<img alt="login.png" src="${pageContext.request.contextPath}/image/login.png" width="50px" height="50px"><br>LOGIN
							</a>
						</c:if>
						<c:if test="${sessionM_TF == '1' }">
							<a href="${pageContext.request.contextPath}/mypage.do" style="color: #002266;">
								<img alt="my.png" src="${pageContext.request.contextPath}/image/my.png" width="50px" height="50px"><br>MY
							</a>
						</c:if>
					</div>
				</div>
			</div>
			<div id="nav">
				<nav>
					<ul id="main-menu">
						<li>
							<a href="${pageContext.request.contextPath}/rclist.do">채용공고</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/searchHire.do">채용검색</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/communityList.do">커뮤니티</a>
							<ul id="sub-menu">
								<li id="asideMenuCommunity">
									<a href="${pageContext.request.contextPath}/communityList.do">커뮤니티</a>
								</li>
								<li id="asideMenuWrite">
									<a href="${pageContext.request.contextPath}/communityWriteForm.do">글 작성하기</a>
								</li>
								<li id="asideMenuInfo">
									<a href="${pageContext.request.contextPath}/communityList.do?bd_code=1&pageNum=1">정보공유</a>
								</li>
								<li id="asideMenuToktok">
									<a href="${pageContext.request.contextPath}/communityList.do?bd_code=2&pageNum=1">취준톡톡</a>
								</li>
								<!-- 							<li id="asideMenuMyTok"><a href="#">내 질문 보기</a></li> -->
							</ul>
						</li>
							<c:if test="${ sessionID == 'admin' || sessionM_TF == '3' }">
								<li>
									<a href="${pageContext.request.contextPath}/adminMain.do" style="padding: 20px 50px;">관리자페이지</a>
								</li>
							</c:if>
							<c:if test="${sessionM_TF == '0' }">
								<li>
									<a href="${pageContext.request.contextPath}/hireList.do" style="padding: 20px 50px;">공고관리</a>
									<ul id="sub-menu">
									<li id="asideMenuMyTok">
											<a href="${pageContext.request.contextPath}/hireList.do" style="padding: 20px 50px;">공고관리</a>
									</li>
										<li id="asideMenuCommunity">
											<a href="${pageContext.request.contextPath}/recruit/hireAdd.jsp">공고등록</a>
									</li>
									</ul>
								</li>
						</c:if>
						<c:if test="${sessionM_TF == '1' }">
							<li>
								<a href="${pageContext.request.contextPath}/mypage.do">마이페이지</a>
								<ul id="sub-menu">
									<li id="asideMenuMyTok">
										<a href="${pageContext.request.contextPath}/mypage.do">마이페이지</a>
									</li>
									<li id="asideMenuCommunity">
										<a href="${pageContext.request.contextPath}/mypageApply.do">지원현황</a>
									</li>
									<li id="asideMenuWrite">
										<a href="${pageContext.request.contextPath}/preferList.do">관심공고</a>
									</li>
									<li id="asideMenuInfo">
										<a href="${pageContext.request.contextPath}/mypageSelect.do">회원정보 수정</a>
									</li>
									<li id="asideMenuToktok">
										<a href="${pageContext.request.contextPath}/resumeList.do">이력서 관리</a>
									</li>
									<li id="asideMenuMyTok">
										<a href="${pageContext.request.contextPath}/introduceList.do">자기소개서 관리</a>
									</li>
								</ul> 
							</li>
						</c:if>
						<c:if test="${sessionID != null }">
							<li>
								<a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
							</li>
						</c:if>
						<c:if test="${sessionID == null }">
							<li>
								<a href="${pageContext.request.contextPath}/log/login.jsp">로그인</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
		</header>
		<div id="container">
			<section id="point">
				<article class="pt pt1">
					<table class="pt_tb">
						<thead>
							<th align="center">인기 정보 글</th>
						</thead>
						<c:forEach var="board" items="${listPopularInfo}">
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
							<th align="center">인기 취준 톡톡</th>
						</thead>
						<c:forEach var="board" items="${listPopularQnA}">
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
					<table id="mainTitleTable">
						<tr>
							<c:if test="${bd_code == 0 }">
								<td>모든 카테고리&nbsp;</td>
							</c:if>
							<c:if test="${bd_code == 1 }">
								<td>정보공유&nbsp;</td>
							</c:if>
							<c:if test="${bd_code == 2 }">
								<td>취준톡톡</td>
							</c:if>
						</tr>
					</table>
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
									<td class="td_main_bd_num">${board.bd_num}</td>
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
									<td class="td_main_m_id">${board.m_id}</td>
									<td class="td_main_reg_date">
										<fmt:formatDate value="${board.reg_date}" pattern="YYYY-MM-dd" />
									</td>
									<td class="td_main_read_count">${board.read_count}</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
					<div class="pageNum">
						<ul>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${currentPage == i}">
									<li><a href='${pageContext.request.contextPath}/communityList.do?bd_code=${bd_code}&word=${word}&pageNum=${i}' id="pageSelected">${i}</a></li>
								</c:if>
								<c:if test="${currentPage != i}">
									<li><a href='${pageContext.request.contextPath}/communityList.do?bd_code=${bd_code}&word=${word}&pageNum=${i}'>${i}</a></li>
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