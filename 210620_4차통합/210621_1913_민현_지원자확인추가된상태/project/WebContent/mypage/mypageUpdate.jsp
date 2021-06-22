<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/mypage/mypageUpdate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dropDown.css">
<meta charset="UTF-8">
<title>Insert title here</title>
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
		</div>
		<section class="plus">
			<form id="inform" action="${pageContext.request.contextPath}/mypageUpdatePro.do"
					method="post">
			<article id="point">
				<h2>회원정보 수정</h2>
			</article>
				<table>
					<tr>
						<td id="td1" style="background-color: #FFFFFF;">이름</td>
						<td style="background-color: #FFFFFF;"><input type="text"
							placeholder="name" title="name" name="m_name"
							value="${member.m_name }"></td>
					</tr>
					<tr>
						<td id="td1" style="width: 20%; background-color: #EAEAEA;">아이디</td>
						<td style="background-color: #EAEAEA;"><input type="text"
							disabled placeholder="id" title="name" name="m_id"
							value="${member.m_id}" style="width: 500px"></td>

					</tr>
					<tr>
						<td id="td1" style="background-color: #FFFFFF;">비밀번호</td>
						<td style="background-color: #FFFFFF;"><input type="password"
							placeholder="password" title="name" name="m_pass"
							value="${member.m_pass }"></td>
					</tr>

					<tr>
						<td id="td1" style="background-color: #EAEAEA;">이메일</td>
						<td style="background-color: #EAEAEA;"><input type="email"
							placeholder="e-mail" title="name" name="m_email" style="width: 300px"
							value="${member.m_email }"></td>
					</tr>
					<tr>
						<td id="td1" style="background-color: #FFFFFF;">휴대폰 번호</td>
						<td style="background-color: #FFFFFF;"><input type="tel"
							placeholder="number" title="name" name="m_phone"
							value="${member.m_phone }"></td>
					</tr>
					<tr>
						<td id="td1" style="background-color: #EAEAEA;">주소</td>
						<td style="background-color: #EAEAEA;"><input type="text" style="width: 600px"
							placeholder="address" name="m_addr" value="${member.m_addr }">
						</td>
					</tr>
					<tr>
						<td id="td1" style="background-color: #FFFFFF;">성별</td>
						<td>
						<c:if test="${member.m_gender == 'male' }">
						<input type="text"
							disabled placeholder="gender" title="name" name="m_gender"
							value="남자" style="background-color: #FFFFFF; border:none;">
							</c:if>
						<c:if test="${member.m_gender == 'female' }">
						<input type="text"
							disabled placeholder="gender" title="name" name="m_gender"
							value="여자" style="background-color: #FFFFFF; border:none;">
						</c:if>
						</td>
					</tr>
					<tr>
						<td id="td1" style="background-color: #EAEAEA;">생년월일</td>
						<td style="background-color: #EAEAEA;"><input type="text" name="m_birth1"
							maxlength="4" placeholder="년(4자)" >
							<select name="m_birth2" >
								<option>월</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
						</select> <input type="text" maxlength="2" placeholder="일" name="m_birth3" ></td>
					</tr>
				</table>
						<div id="save">
			<input type="submit" value="저장">
		</div>
		<div id="save2">
			<input type="reset" value="취소">
		</div>
			</form>
		</section>
	</div>
	<footer> Copyright & copy </footer>
</body>
</html>