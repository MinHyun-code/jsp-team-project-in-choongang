<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/recruit/searchHire.css">
<head>
<meta charset="UTF-8">
<title>searchHire.jsp</title>
<style type="text/css">
    #ang{
     margin-top: 20px;
     margin-bottom:40px;
     padding: 5px;
         
   }
   
   #line{ 
            border-top: 1px solid black;
            border-bottom: 1px solid pink;   }
 
   #ang2:hover{
      text-decoration: underline 1px solid pink ;
   }
   #ang2:nth-child(even)  { background-color: white; }
   #ang2:nth-child(odd)   { background-color: #DDF6F4; }
      
   
   #btn{ 
     width:50px;
     height: 40px;
     border : 0;
     border-radius: 15px;
	 font-size: 20px;
	 font-weight: 600;
     color : #235594
}

#btn:hover{ 
   background-color:#1F96B8;
   color: white;
}

#option{
   border : 0;
   font-family: "Do Hyeon"; 
   src:url("../image/DoHyeon-Regular.ttf") format("truetype"); 
   font-size: 20px;
   color : #235594
}
  #search{
    outline: none;
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
				<a href="${pageContext.request.contextPath}/searchHire.do">채용검색</a> 
				<a href="${pageContext.request.contextPath}/rclist.do" style="bgcolor: #235594">채용공고</a> 
				<a href="${pageContext.request.contextPath}/communityList.do">커뮤니티</a> 
				<a href="${pageContext.request.contextPath}/mypage/mypage.jsp">마이페이지</a> 
				<c:if test="${sessionID != null }">
					<a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
				</c:if>
				<c:if test="${sessionID == null }">
					<a href="${pageContext.request.contextPath}/log/login.jsp">로그인</a>
				</c:if>
			</nav>
		</header>	
</div>
			
		<form action="${pageContext.request.contextPath}/searching.do">
		  <table id="searchBox">			
				<tr>
					<td>
					<select id="option" name="standard">
					   <option ${(param.standard == "clvalue1")?"selected":"" } value ='clvalue1'>지역
					   <option ${(param.standard == "clvalue2")?"selected":"" } value ='clvalue2'>근무형태
					   <option ${(param.standard == "clvalue3")?"selected":"" } value ='clvalue3'>업종
					   <option ${(param.standard == "rc_name")?"selected":"" } value ='rc_name'>회사이름
					 </select>
					 </td>
					  <td> 
					    <input id="search" type="text" name="name" value="${param.name}" placeholder="Search" size="100">
					</td>
					<td>
					  <input id="btn" type="submit" value=" 검색 ">
					</td>
				</tr>
			</table>
		</form>	
		
			
			      <div id="ang">
					<table id="line" >
					<thead>
					<tr id ="ang1">
					   <th>채용번호</th>
					   <th>기업이름</th>
					   <th>채용제목</th> 
					   <th>채용내용</th> <!-- rc_scrap -->
					   <th> &nbsp;연봉 &nbsp;</th>
					   <th>공고일</th> <!-- rc_date -->
					  </tr>
					</thead>
					<tbody>
					  
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
					</tbody>
				</table>
				<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href='list.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='list.do?pageNum=${i}'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='list.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div>
			  </div>
		
    <div>
		
		<footer> Copyright & copy </footer>
  </div>
</body>
</html>