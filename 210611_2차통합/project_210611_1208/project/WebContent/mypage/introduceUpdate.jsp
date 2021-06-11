<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/mypage/introduceUpdate.css">
	<script type="text/javascript" src="./js/jquery.js"></script>
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
					action="${pageContext.request.contextPath}/introduceUpdate.do"
					method="post">
					<article id="point">
						<h2>자기소개서 수정</h2>
						<span style="color: #aaa;" id="counter">글자 수 (0)</span>
					</article>
					<table>
						<tr style="display: none;">
							<td style="background-color: #EAEAEA;"><input type="text"
								style="width: 700px" name="si_num" value="${self.si_num }"></td>
						</tr>
						<tr style="display: none;">
							<td style="background-color: #EAEAEA;"><input type="text"
								style="width: 700px" name="m_id" value="${self.m_id }"></td>
						</tr>
						<tr>
							<td id="td1" style="width: 20%; background-color: #EAEAEA;">제목</td>
							<td style="background-color: #EAEAEA;"><input type="text"
								style="width: 700px" name="si_ques" value="${self.si_ques }"></td>
						</tr>
						<tr style="height: 600px">
							<td id="td1" style="width: 20%; background-color: #EAEAEA;">내용</td>
							<td style="background-color: #EAEAEA; width: 1200px;"><textarea
								class="DOC_TEXT" id="si_content" name="si_content" style="width: 800px">${self.si_content }</textarea></td>
						</tr>
					</table>
					<input type="submit" value="저장" style="float: left;">
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
			</section>
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