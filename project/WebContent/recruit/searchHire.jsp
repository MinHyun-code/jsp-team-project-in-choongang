<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/recruit/searchHire.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dropDown.css">
<head>
<meta charset="UTF-8">
<title>searching.jsp</title>
<style type="text/css">
#ang {
	margin-top: 20px;
	margin-bottom: 40px;
	padding: 5px;
}

#tda1 {
	background-color: #f2f2f2;
	height: 80px;
}
/*    th */
.line {
	width: 60%;
	border-top: 4px solid #EAEAEA;
	/*             border-bottom: 1px solid black;   */
	text-align: center;
}

}
.tda2:hover {
	background-color: rgba(35, 85, 148, 0.1);
}

.tda2:nth-child(even) {
	background-color: rgb(242 215 250/ 10%);
}

.tda2:nth-child(odd) {
	background-color: white;
}

#btn {
	width: 50px;
	height: 40px;
	border: 0;
	border-radius: 15px;
	/*      font-family: "Do Hyeon"; */
	/* 	 src:url("../image/DoHyeon-Regular.ttf") format("truetype"); */
	font-size: 20px;
	font-weight: 600;
	color: #235594
}

#btn:hover {
	background-color: #1F96B8;
	color: white;
}

#option {
	border: 0;
	font-family: "Do Hyeon";
	src: url("../image/DoHyeon-Regular.ttf") format("truetype");
	font-size: 20px;
	color: #235594
}

#search {
	outline: none;
}

.tda2 {
	height: 80px;
} /*    td */
.under {
	border-bottom: 1px solid #EAEAEA;
} /*    td */
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">

</script>
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
	<form action="${pageContext.request.contextPath}/searching.do">
		<table id="searchBox">
			<tr>
				<td><select id="option" name="standard">
						<option ${(param.standard == "clvalue1")?"selected":"" }
							value='clvalue1'>지역
						<option ${(param.standard == "clvalue2")?"selected":"" }
							value='clvalue2'>근무형태
						<option ${(param.standard == "clvalue3")?"selected":"" }
							value='clvalue3'>업종
						<option ${(param.standard == "rc_name")?"selected":"" }
							value='rc_name'>회사이름
				</select></td>
				<td><input id="search" type="text" name="name"
					value="${param.name}" placeholder="Search" size="100"></td>
				<td><input type="submit" id="btn" value=" 검색 "></td>
			</tr>
		</table>
	</form>



	<div id="ang">
		<table class="line">
			<thead>
				<tr id="tda1">

					<th>기업이름</th>
					<th>채용제목</th>
					<th>채용내용</th>
					<!-- rc_scrap -->
					<th>&nbsp;연봉 &nbsp;</th>
					<th>공고일</th>
					<!-- rc_date -->
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${list}" var="rdt">
					<tr class="tda2">

						<td class="under">&nbsp; ${rdt.rc_name} &nbsp;</td>
						<td class="under">&nbsp; ${rdt.rc_title} &nbsp;</td>
						<td class="under" style="width: 400px;"><a href="#" target="_blank" id="hyper"
							onclick="window.open('${pageContext.request.contextPath}/popUpHireUnion.do?rc_num=${rdt.rc_num}',
					                       'name','resizable=no width=1050 height=1200');return false"
							style="text-decoration: none; color: black;">
								&nbsp;${rdt.rc_name} 채용 세부사항 &nbsp;</a></td>
						<td class="under">&nbsp; ${rdt.rc_salary }만원 &nbsp;</td>
						<td class="under">&nbsp; ${rdt.rc_date} &nbsp;</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div style="text-align: center;">
			<c:if test="${startPage > blockSize }">
				<a
					href='${pageContext.request.contextPath}/searchHire.do?pageNum=${startPage-blockSize}' style="color: Gray; text-decoration: none; padding: 5px 10px;">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a
					href='${pageContext.request.contextPath}/searchHire.do?pageNum=${i}' style="color: Gray; text-decoration: none; padding: 5px 10px;">[${i}]</a>
			</c:forEach>
			<c:if test="${endPage < pageCnt }">
				<a
					href='${pageContext.request.contextPath}/searchHire.do?pageNum=${startPage+blockSize}' style="color: Gray; text-decoration: none; padding: 5px 10px;">[다음]</a>
			</c:if>
		</div>

	</div>


	<div>

		<footer> Copyright & copy </footer>
	</div>
</body>
</html>