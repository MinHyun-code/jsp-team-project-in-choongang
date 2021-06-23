<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resume/resumeSelect.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dropDown.css">
<style>
.submit_list{

    border-radius: 100px / 100px;
    cursor: pointer;

    width: 100px;
    height: 50px;
    font-size: 20px;
    border: 3px solid #EAEAEA;
    color: black;
    position: relative;
    font-size: 25px;
    text-align: center;
    background: #EAEAEA;
    margin-right: 30px;
    font-family: "Do Hyeon";
    float: right;
    margin-top: 39px;
    margin-bottom: 75px;
    margin-right: 1px;



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
			<section class="plus">
				<form id="inform"
					action="${pageContext.request.contextPath}/resumeList.do"
					method="post">
					<article id="point">
						<h2>이력서 확인</h2>
					</article>
					<article class="tb_point">
						<p>기본정보</p>
					</article>
					<table class="tb">
						<tr>
							<td id="td1">이름</td>
							<td id="td2"><input type="text" class="input" disabled
								placeholder="이름" name="m_name" value="${member.m_name }"></td>
							<td id="td3" rowspan="2"><input type="image" name="r_pic"
								src="${resume.r_pic }" style="height: 200px; width: 160px;"></td>
						</tr>
						<tr>
							<td id="td1">생년월일</td>
							<td id="td2"><input type="text" class="input" disabled
								placeholder="생년월일" name="m_birth" value="${member.m_birth }"></td>
							<td id="td3" style="width: 700px"></td>
						</tr>
						<tr>
							<td id="td1">이메일</td>
							<td id="td2"><input type="text" class="input" disabled
								placeholder="이메일" name="m_email" value="${member.m_email }"></td>
							<c:if test="${member.m_gender == 'female' }">
								<td id="td3" class="select"><input type="radio" id="select"
									name="shop"><label for="select">남자</label> <input
									type="radio" id="select2" name="shop" checked="checked"><label
									for="select2">여자</label></td>
							</c:if>
							<c:if test="${member.m_gender == 'male' }">
								<td id="td3" class="select"><input type="radio" id="select"
									name="shop" checked="checked"><label for="select">남자</label>
									<input type="radio" id="select2" name="shop"><label
									for="select2">여자</label></td>
							</c:if>
						</tr>
						<tr>
							<td id="td1">휴대폰</td>
							<td id="td2"><input type="text" class="input" disabled
								placeholder="휴대폰" name="m_phone" value="${member.m_phone }"></td>
						</tr>
						<tr>
							<td id="td1">주소</td>
							<td id="td2"><input type="text" class="input" disabled
								placeholder="주소" name="m_addr" value="${member.m_addr }"></td>
						</tr>
						<tr>
							<td id="td1">첨부파일</td>
							<td id="td2"><a class="btn1" href="${resume.r_file }"
								download style="text-decoration: none;">다운로드</a></td>
						</tr>
					</table>
					<article class="tb_point">
						<p>학력사항</p>
					</article>
					<table class="tb">
						<c:forEach var="edu_list" items="${edu_list }">
							<tr>
								<td id="td1">학교명</td>
								<td id="td2"><input type="text" class="input" disabled
									placeholder="학교명" name="edu_school"
									value="${edu_list.edu_school }"></td>
								<td id="td3" style="width: 700px;"></td>
							</tr>
							<tr>
								<td id="td1">전공</td>
								<td id="td2"><input type="text" class="input" disabled
									placeholder="전공" name="edu_job" value="${edu_list.edu_job }"></td>
							</tr>
							<tr>
								<td id="td1">재학기간</td>
								<td id="td2"><input type="text" class="input" disabled
									placeholder="입학" name="myedu_sdate"
									value="${edu_list.myedu_sdate }"></td>
								<td id="td3"><input type="text" class="input" disabled
									placeholder="졸업" name="myedu_edate"
									value="${edu_list.myedu_edate }"></td>
							</tr>
							<tr>
								<td id="td1">졸업구분</td>
								<td id="td2"><c:if test="${edu_list.edu_type == '1' }">
										<input type="text" class="input" disabled placeholder="졸업구분"
											name="edu_type" value="졸업">
									</c:if> <c:if test="${edu_list.edu_type == '2' }">
										<input type="text" class="input" disabled placeholder="졸업구분"
											name="edu_type" value="졸업예정">
									</c:if> <c:if test="${edu_list.edu_type == '3' }">
										<input type="text" class="input" disabled placeholder="졸업구분"
											name="edu_type" value="재학">
									</c:if> <c:if test="${edu_list.edu_type == '4' }">
										<input type="text" class="input" disabled placeholder="졸업구분"
											name="edu_type" value="휴학">
									</c:if>
							</tr>
							<tr>
							</tr>
						</c:forEach>
					</table>
					<article class="tb_point">
						<p>경력사항</p>
					</article>
					<table class="tb">
						<c:forEach var="career_list" items="${career_list }">
							<tr>
								<td id="td1">회사명</td>
								<td id="td2"><input type="text" class="input" disabled
									placeholder="회사명" name="cr_name"
									value="${career_list.cr_name }"></td>
								<td id="td3" style="width: 700px;"></td>
							</tr>
							<tr>
								<td id="td1">직급</td>
								<td id="td2"><input type="text" class="input" disabled
									placeholder="직급" name="cr_grade"
									value="${career_list.cr_grade }"></td>
							</tr>
							<tr>
								<td id="td1">연봉</td>
								<td id="td2"><input type="text" class="input" disabled
									placeholder="연봉" name="cr_salary"
									value="${career_list.cr_salary }"></td>
							</tr>
							<tr>
								<td id="td1">담당업무</td>
								<td id="td2"><input type="text" class="input" disabled
									placeholder="담당업무" name="cr_job"
									value="${career_list.cr_job }"></td>
							</tr>
							<tr>
								<td id="td1">입사기간</td>
								<td id="td2"><input type="text" class="input" disabled
									placeholder="입사날짜" name="cr_sdate"
									value="${career_list.cr_sdate }"></td>
								<td id="td2"><input type="text" class="input" disabled
									placeholder="퇴사날짜" name="cr_edate"
									value="${career_list.cr_edate }"></td>
							</tr>
							<tr>
								
							</tr>
							<tr>
							</tr>
						</c:forEach>
					</table>
					<article class="tb_point">
						<p>자격증</p>
					</article>
					<table class="tb">
						<c:forEach var="licence_list" items="${licence_list }">
							<tr>
								<td id="td1">자격증명</td>
								<td id="td2"><input type="text" class="input" disabled
									placeholder="자격증명" name="lc_name"
									value="${licence_list.lc_name }"></td>
								<td id="td3" style="width: 700px;"></td>
							</tr>
							<tr>
								<td id="td1">관리기관</td>
								<td id="td2"><input type="text" class="input" disabled
									placeholder="관리기관" name="lc_organ"
									value="${licence_list.lc_organ }"></td>
							</tr>
							<tr>
								<td id="td1">취득날짜</td>
								<td id="td2"><input type="text" class="input" disabled
									placeholder="취득날짜" name="mylc_date"
									value="${licence_list.mylc_date }"></td>
							</tr>
							<tr>
							</tr>
						</c:forEach>
					</table>
					<article class="tb_point">
						<p>자기소개서</p>
					</article>
					<table class="tb">
						<c:forEach var="intro_list" items="${intro_list }">
							<tr>
								<td id="td1">질문</td>
								<td id="td2"><input type="text" class="input" disabled
									placeholder="질문" name="si_ques" value="${intro_list.si_ques }"
									style="width: 800px"></td>
								<td id="td3" style="width: 700px;"></td>
							</tr>
							<tr>
								<td id="td1">내용</td>
								<td id="td2"><textarea disabled placeholder="내용"
										id="content" name="si_content">
									${intro_list.si_content }</textarea></td>
							</tr>
							<tr>
							</tr>
						</c:forEach>
					</table>
					<input type="submit" value="목록" class="submit_list">
				</form>
			</section>
		</div>
		<footer> Copyright & copy </footer>
	</div>
</body>
</html>