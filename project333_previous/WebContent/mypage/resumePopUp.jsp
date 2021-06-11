<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/mypage/introduceList.css">
</head>
<body>
	<div id="page">
		<div id="container">
			<section class="plus">
				<form id="inform">
					<article id="point">
						<h2>자기소개서 관리</h2>
					</article>
					<table>
						<c:if test="${introCnt > 0 }">
							<c:forEach var="self_intro" items="${list }">
								<tr>
									<td style="text-align: center; font-size: 30px; width: 600px">${self_intro.si_ques}</td>
									<td>
									</td>
								</tr>
								<tr style="height: 30px">
								</tr>
								<c:set var="startNum" value="${startNum - 1 }"/>
							</c:forEach>
						</c:if>

						<c:if test="${introCnt == 0 }">

							<h1>데이터가 없네</h1>
						</c:if>
					</table>
					<input type="button"
						onclick="location.href='${pageContext.request.contextPath}/mypage/introduceAdd.jsp'"
						value="추가" class="btn">
				</form>
			</section>
		</div>
               <div class="pageNum">
                  <ul>
                     <c:forEach var="i" begin="${startPage}" end="${endPage}">
                        <c:if test="${currentPage == i}">
                           <li><a href='${pageContext.request.contextPath}/introduceList.do?pageNum=${i}' id="pageSelected">${i}</a></li>
                        </c:if>
                        <c:if test="${currentPage != i}">
                           <li><a href='${pageContext.request.contextPath}/introduceList.do?pageNum=${i}'>${i}</a></li>
                        </c:if>
                     </c:forEach>
                  </ul>
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