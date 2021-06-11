<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/recruit/searchHire.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   #ang{
     margin-top: 20px;
     margin-bottom:40px;
     padding: 5px;
   }
   
   #ang1{
     background-color:  #002266;
     color:  white; 
   }
   
   #ang2:hover{
      background-color: aqua;
   }
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>	
<script type="text/javascript">

</script>
</head>
<body>
<div id="page">
		<header>
			 <div>
				 <h1 onclick="location.href='${pageContext.request.contextPath}/main.jsp'"
					 style="cursor: pointer; 
					        text-align: center; 
					        font-size: 130px; 
					        color: #002266; 
					        margin-bottom: 40px;">다JOB아</h1>
			 </div>
			 <nav>
				<a href="${pageContext.request.contextPath}/searchHire.do">회사검색</a> 
				<a href="${pageContext.request.contextPath}/rclist.do" style="bgcolor: #235594">채용공고</a> 
				<a href="${pageContext.request.contextPath}/communityList.do">커뮤니티</a> 
				<a href="${pageContext.request.contextPath}/mypage/mypage.jsp">마이페이지</a> 
				<a href="${pageContext.request.contextPath}/log/login.jsp">로그인</a>
			</nav>
		</header>	
</div>
			
			
		<table id="searchBox">			
				<tr>
					<td>
					<select name="f">
					   <option value ='10'>지역
					   <option value ='20'>근무형태
					   <option value ='30'>업종
					 </select>
					 </td>
					  <td> 
					    <input type="text" name="search" value="" placeholder="Search" size="100">
					</td>
					<td>
					  <input type="submit" value=" 검색 ">
					</td>
				</tr>
			</table>
			
			      <div id="ang">
					<table  border="1" >
					  <tr id="ang1">
					   <th>채용번호</th>
					   <th>기업이름</th>
					   <th>채용제목</th> 
					   <th>채용내용</th> <!-- rc_scrap -->
					   <th> &nbsp;연봉 &nbsp;</th>
					   <th>공고일</th> <!-- rc_date -->
					  </tr>
					  
					   <c:forEach items="${list}" var="rdt">
					   <tr id ="ang2">
					      <td> &nbsp; ${rdt.rc_num} &nbsp; </td>
					      <td> &nbsp; ${rdt.rc_name}  &nbsp;</td>
					      <td> &nbsp; ${rdt.rc_title} &nbsp; </td>
					      <td><a href="#" target="_blank"
					             onclick="window.open('${pageContext.request.contextPath}/popUpHireUnion.do?union=${rdt.rc_name}',
					                       'name','resizable=no width=600 height=500');return false">
					                &nbsp;${rdt.rc_name} 채용 세부사항 &nbsp;</a>
					      </td>
					      <td> &nbsp; ${rdt.rc_salary } &nbsp;</td>
					      <td> &nbsp; ${rdt.rc_date}  &nbsp;</td>
					      </tr>
				        </c:forEach>
					  
	    			</table>
			</div>
		
    <div>
		<aside id="right">
			<ul>
				<li><a href="#">마이페이지</a></li>
				<li><a href="#">이력서 관리</a></li>
				<li><a href="#">커뮤니티</a></li> 
			</ul>
		</aside>
		<footer> Copyright & copy </footer>
  </div>
</body>
</html>