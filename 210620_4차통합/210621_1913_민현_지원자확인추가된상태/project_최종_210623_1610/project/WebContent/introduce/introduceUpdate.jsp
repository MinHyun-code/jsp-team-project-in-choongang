<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/introduce/introduceAdd.css">
	<script type="text/javascript" src="./js/jquery.js"></script>
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dropDown.css">
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
				<form id="inform"
					action="${pageContext.request.contextPath}/introduceUpdate.do"
					method="post">
					<div id="point">
						<h2>자기소개서 수정</h2>
						<span style="color: #aaa;" id="counter">글자 수 (0)</span>
						</div>
					<table style="margin-bottom: 50px;">
						<tr style="display: none;">
							<td><input type="text"
								style=" width: 770px border: 3px solid #EAEAEA;" name="si_num" value="${self.si_num }"></td>
						</tr>
						<tr style="display: none;">
							<td><input type="text"
								style="width: 700px" name="m_id" value="${self.m_id }"></td>
						</tr>
						<tr>
							<td id="td1">제목</td>
							<td><input id="title" type="text"
								style="width: 770px border: 3px solid #EAEAEA;"  name="si_ques" value="${self.si_ques }"></td>
						</tr>
						<tr style="height: 500px">
							<td id="td1" style="width: 20%;">내용</td>
							<td><textarea class="DOC_TEXT" id="si_content" name="si_content" style="width: 674px; max-width: 700px; min-width: 600px;
                        max-height: 400px; min-height: 400px;">${self.si_content }</textarea></td>
						</tr>
					</table>
					<input type="submit" value="저장하기">
				</form>
				<script type="text/javascript">
				$('#si_content').keyup(function (e){
				    var content = $(this).val();
				    $('#counter').html("(글자 수 "+content.length+")");  
				
				    if (content.length > 1000){
				        alert("최대 1000자까지 입력 가능합니다.");
				        $(this).val(content.substring(0, 1000));
				        $('#counter').html(content.length);
				    }
				});

</script>
		</div>

		<aside id="right">
			<ul>
				<li style="background-color: #235594"><a
					href="${pageContext.request.contextPath}/introduceList.do">자기소개서
						관리</a></li>
				<li><a href="${pageContext.request.contextPath}/resumeList.do">이력서
						관리</a></li>
				<li><a href="#">입사지원 현황</a></li>
				<li><a href="#">관심공고</a></li>
				<li><a
					href="${pageContext.request.contextPath}/mypageSelect.do">회원정보
						수정</a></li>
			</ul>
		</aside>
		<footer> Copyright & copy </footer>
	</div>
</body>
</html>