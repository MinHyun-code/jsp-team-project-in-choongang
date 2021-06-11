<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/mypage/resumeSelect.css">
</head>
<body>
	<div id="page">
		<header>
			<div>
				<h1
					onclick="location.href='${pageContext.request.contextPath}/main.jsp'"
					style="cursor: pointer; text-align: center; font-size: 130px; color: #002266; margin-bottom: 40px;">다JOB아</h1>
			</div>
			<nav>
				<a href="#">채용공고</a> <a href="searchHire.jsp">회사검색</a> <a
					href="${pageContext.request.contextPath}/communityList.do">커뮤니티</a>
				<a href="mypage.jsp" style="background-color: #235594">마이페이지</a>
				<c:if test="${sessionID != null }">
					<a href="logout.do">로그아웃</a>
				</c:if>
			</nav>
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
					<input type="submit" value="목록" style="float: left;">
				</form>
			</section>
		</div>
		<footer> Copyright & copy </footer>
	</div>
</body>
</html>