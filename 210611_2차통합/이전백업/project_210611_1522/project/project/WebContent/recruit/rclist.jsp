<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/recruit/searchHire.css">
<head>
<meta charset="UTF-8">
<style type="text/css">
 .ct:hover{
   -webkit-transform:scale(1.2);
 }
</style>
<title>rclist.jsp</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>	
<script type="text/javascript">
	
</script>
</head>
<body>
	<div id="page">
		<header>
			<div>
				<h1 onclick="location.href='main.jsp'"
					style="cursor: pointer; text-align: center; font-size: 130px; color: #002266; margin-bottom: 40px;">다JOB아</h1>
			</div>
			<nav>
				<a href="${pageContext.request.contextPath}/searchHire.do">채용검색</a> 
				<a href="${pageContext.request.contextPath}/rclist.do" style="bgcolor: #235594">채용공고</a> 
				<a href="${pageContext.request.contextPath}/communityList.do">커뮤니티</a> 
				<a href="mypage.jsp">마이페이지</a> 
				<c:if test="${sessionID != null }">
					<a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
				</c:if>
				<c:if test="${sessionID == null }">
					<a href="${pageContext.request.contextPath}/log/login.jsp">로그인</a>
				</c:if>
			</nav>
</header>			
			
			
			
<!-- ==================================================================================================================== -->	
		    <c:forEach items="${list}" var="rdt">
 	      		<section class="ct">
 	      		<div id="double">
 	      		<div id="mm">
<%-- 				   <a href="${pageContext.request.contextPath}/popUpHireUnion.do?union=${rdt.rc_name}"  --%>
<!-- 				    height="5" width="10" target="_blank"> -->
<%-- 					<img src="${rdt.rc_content}"> --%>
<!-- 					</a>   -->
					<a href="#" target="_blank"
					    onclick="window.open('${pageContext.request.contextPath}/popUpHireUnion.do?union=${rdt.rc_name}','name','resizable=no width=600 height=500');
					    return false">
					    <img src="${rdt.rc_content}" style="width: 200px; height: 150px">
					    
					</a>
					
					
			    </div>
				<div id="text">${rdt.rc_title}</div>
				</div>
				</section>
            </c:forEach>



		<aside id="right">
			<ul>
				<li><a href="#">마이페이지</a></li>
				<li><a href="#">이력서 관리</a></li>
				<li><a href="#">커뮤니티</a></li>
				<li><a href="#">관심채용</a></li>
			</ul>
		</aside>
		
		<footer> Copyright & copy </footer>

	</div>
</body>
</html>