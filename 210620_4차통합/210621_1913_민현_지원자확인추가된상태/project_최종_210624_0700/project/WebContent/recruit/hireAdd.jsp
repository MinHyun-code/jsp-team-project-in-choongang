<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/recruit/hireAdd.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dropDown.css">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input {
	padding-left: 19px;
}
</style>
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
		<form id="inform"
			action="${pageContext.request.contextPath}/hireAdd1.do" method="post"
			name="frm" enctype="multipart/form-data">
			<div id="content">
				<table>
					<tr>
						<td style="padding-left: 110px; font-size: 30px;">공고 제목</td>
						<td colspan="2"><input type="text" name="rc_title"
							id="rc_title" required="required"></td>

					</tr>
					<tr>
						<td style="padding-left: 110px; font-size: 30px;">기업 로고</td>
						<td colspan="2"><input type="file" name="rc_content" id="rc_content" style="width: 600px; padding-top: 26px; height: 74px; border: none;"></td>
					</tr>
					<tr>
						<td style="padding-left: 110px; font-size: 30px;">공고 스크랩</td>
						<td colspan="2"><input type="file" name="rc_scrap" id="rc_scrap" style="width: 600px; padding-top: 26px; height: 74px; border: none;"></td>
					</tr>
					<tr>
						<td style="padding-left: 110px; font-size: 30px;">채용 연봉 (만원)</td>
						<td colspan="3"><input type="text" name="rc_salary"
							id="rc_salary" required="required"></td>
					</tr>
					<tr>
						<td style="padding-left: 110px; font-size: 30px;">홈페이지 주소</td>
						<td colspan="3"><input type="text" name="rc_link"
							id="rc_link" required="required"></td>
					</tr>
					<tr>
						<td style="padding-left: 110px; font-size: 30px;">지도좌표</td>
						<td colspan="3"><input type="text" name="rc_view"
							id="rc_view" required="required" placeholder="예시: 37.5N 127.3E" style="padding-left: 19px;"></td>
					</tr>
					<tr>
					
						<td>
							<div id="code">
								<select name="code1" style="margin-left: 67px; margin-top: 50px;">
									<option>지역</option>
									<option value="10 10">서울</option>
									<option value="10 11">대전</option>
									<option value="10 12">대구</option>
									<option value="10 13">부산</option>
									<option value="10 14">광주</option>
									<option value="10 15">경기</option>
									<option value="10 16">강원</option>
									<option value="10 17">충청</option>
									<option value="10 18">호남</option>
									<option value="10 19">영남</option>
									<option value="10 20">제주</option>
								</select>
							</div>
						</td>
						<td>
							<div id="code">
								<select name="code2" style="margin-top: 50px;">
									<option>업종</option>
									<option value="20 10">IT</option>
									<option value="20 11">금융</option>
									<option value="20 12">의료</option>
									<option value="20 13">서비스</option>
								</select>
							</div>
						</td>
						<td>
							<div id="code">
								<select name="code3" style="margin-top: 50px;">
									<option>근무형태</option>
									<option value="30 10">정규직</option>
									<option value="30 11">인턴</option>
									<option value="30 12">계약</option>
								</select>
							</div>
						</td>
					</tr>
				</table>

			</div>
			<div id="bttn" style="width: 1200px; margin: 0 auto;">
				<button type="submit">공 고 등 록</button>
			</div>
		</form>
		<footer> Copyright & copy </footer>
	</div>
	<script>
	let inform = document.getElementById('inform');
	inform.addEventListener('submit', convertToRc_viewFormat);
	function convertToRc_viewFormat(){
		inform.rc_view.value = inform.rc_view.value.replaceAll(/[NE,]/gi," ").replaceAll(/ +/gi, " ").replace(/^\s\s*/, '').replace(/\s\s*$/, '');
		let rc_views = inform.rc_view.value.split(" ");
		for(let i = 0; i < 2; i++) {
			let rc_view_temp = rc_views[i].replaceAll(/[.]/gi,"");
			for(let j = 0; j < 9+i; j++) {
				if (j >= rc_view_temp.length) {
					rc_view_temp = rc_view_temp +"0";
				}
			}
			rc_views[i] = rc_view_temp;
		}
		inform.rc_view.value = Number(rc_views[0] + rc_views[1]); 
	};
	</script>
</body>
</html>