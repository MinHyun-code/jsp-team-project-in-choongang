<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dropDown.css">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script defer src="${pageContext.request.contextPath}/mainCarousel.js"></script>
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
						<c:if test="${sessionID != null }">
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
			<div id="mainUpperPart">
				<div id="mainUpperPart_left">
					<div class="slide_box">
						<div class="slide_list">
							<div id="lastClone" class="slide_item">5</div>
							<div class="slide_item">최신공고<br>${listRc[0].rc_name}</div>
							<div class="slide_item">인기정보글<br>${listPopularInfo[0].subject}</div>
							<div class="slide_item">추천공고<br>${listRc[4].rc_name}</div>
							<div class="slide_item">추천공고<br>${listRc[7].rc_name}</div>
							<div class="slide_item">궁금해요<br>${listPopularQnA[0].subject}</div>
							<div id="firstClone" class="slide_item">최신공고<br>${listRc[0].rc_name}</div>
						</div>
					</div>
					<button class="slideBtn prevBtn">prev</button>
					<button class="slideBtn nextBtn">next</button>
					<button class="slideBtn playBtn">
						<svg width="6px" height="6px" viewBox="0 0 6 6" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="btn">
					        <title>슬라이드 정지 버튼</title>
					        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
					            <g transform="translate(-615.000000, -536.000000)" fill="black" fill-rule="nonzero">
					                <g transform="translate(330.000000, 192.000000)">
					                    <g transform="translate(229.000000, 344.000000)">
					                        <g transform="translate(56.000000, 0.000000)">
					                            <rect x="0" y="0" width="1.5" height="6"></rect>
					                            <rect x="4.5" y="0" width="1.5" height="6"></rect>
					                        </g>
					                    </g>
					                </g>
					            </g>
					        </g>
					    </svg>
					</button>
				</div>
				<div id="mainUpperPart_center">
					<div class="slide_box_center">
						<div class="slide_list_center">
							<div id="lastClone_center" class="slide_item_center">5</div>
							<div class="slide_item_center">1</div>
							<div class="slide_item_center">2</div>
							<div class="slide_item_center">3</div>
							<div class="slide_item_center">4</div>
							<div class="slide_item_center">5</div>
							<div id="firstClone_center" class="slide_item_center">1</div>
						</div>
					</div>
					<button class="slideBtn_center prevBtn_center">prev</button>
					<button class="slideBtn_center nextBtn_center">next</button>
				</div>
				<div id="mainUpperPart_right"></div>
			</div>

			<!-- 채용공고 -->
			<div id="recruit_recommend_container">
				<div class="recruit_recommend_title">최신 공고</div>
				<c:forEach items="${listRc}" var="rdt" begin="0" end="9">
					<div class="recruit_recommend_division">
						<div class="recruit_recommend_block">
							<div class="recruit_recommend_block_img">
								<a href="#" target="_blank" onclick="window.open('${pageContext.request.contextPath}/popUpHireUnion.do?union=${rdt.rc_name}','name','resizable=no width=600 height=500'); return false">
									<img src="${rdt.rc_content}" style="width: 200px; height: 150px">
								</a>
							</div>
							<div class="recruit_recommend_block_title">${rdt.rc_title}&nbsp;</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- 커뮤니티 -->
			<div id="community_popular_container">
				<div id="community_popular_info" class="community_popular_part">
					<div class="community_popular_title">커뮤니티 인기글</div>
					<c:forEach var="board" items="${listPopularInfo}">
						<table>
							<tr>
								<td rowspan="3" class="community_popular_table_pic">
									<input type="image" name="file_pic" src="${board.file_name }" class="community_popular_table_pic">
								</td>
								<td class="community_popular_table_subject">
									<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${board.bd_code}&bd_num=${board.bd_num}">${board.subject}</a>
								</td>
							</tr>
							<tr>
								<td class="community_popular_table_content">
									<c:choose>
										<c:when test="${fn:length(board.content) gt 150}">
											<c:out value="${fn:substring(board.content, 0, 150)} ${'...'}"></c:out>
										</c:when>
										<c:otherwise>
											<c:out value="${board.content}" />
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="community_popular_table_tags">${board.tags}</td>
							</tr>
						</table>
					</c:forEach>
				</div>
				<div id="community_popular_QnA" class="community_popular_part">
					<div class="community_popular_title">취준톡톡 인기글</div>
					<c:forEach var="board" items="${listPopularQnA}">
						<table>
							<tr>
								<td rowspan="3" class="community_popular_table_pic">
									<input type="image" name="file_pic" src="${board.file_name }" class="community_popular_table_pic">
								</td>
								<td class="community_popular_table_subject">
									<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${board.bd_code}&bd_num=${board.bd_num}">${board.subject}</a>
								</td>
							</tr>
							<tr>
								<td class="community_popular_table_content">
									<c:choose>
										<c:when test="${fn:length(board.content) gt 150}">
											<c:out value="${fn:substring(board.content, 0, 150)} ${'...'}"></c:out>
										</c:when>
										<c:otherwise>
											<c:out value="${board.content}" />
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="community_popular_table_tags">${board.tags}</td>
							</tr>
						</table>
					</c:forEach>
				</div>
			</div>



		</div>
		<footer> Copyright & copy </footer>
</body>
</html>