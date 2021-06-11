<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/mypage/mypageUpdate.css">
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<a href="#">채용공고</a> <a href="#">회사검색</a> <a href="#">커뮤니티</a> <a
					href="${pageContext.request.contextPath}/mypage/mypage.jsp">마이페이지</a>
				<c:if test="${sessionID != null }">
					<a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
				</c:if>
			</nav>
		</header>
		<aside id="right">
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/introduceList.do">자기소개서
						관리</a></li>
				<li><a href="${pageContext.request.contextPath}/resumeList.do">이력서
						관리</a></li>
				<li><a href="#">입사지원 현황</a></li>
				<li><a href="#">관심공고</a></li>
				<li style="background-color: #235594"><a
					href="${pageContext.request.contextPath}/mypageSelect.do">회원정보
						수정</a></li>
			</ul>
		</aside>
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
							placeholder="pawwsord" title="name" name="m_pass"
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