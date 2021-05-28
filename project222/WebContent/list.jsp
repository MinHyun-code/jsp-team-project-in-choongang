<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String context = request.getContextPath();
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css"> 
table {
	width: 100%;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

function getDeptName(Vnum){
	//console.log(Vnum);
	//alert("num->"+Vnum); 
	$.ajax({
		url:"<%=context%>/ajaxTest1.do",  
		data:{num : Vnum},
		dataType:'text',
		success:function(data){
			 // alert(".ajax Data"+data);
			 $('#deptName').val(data);     /*  input Tag */
			 /*$('#msg').html(data);         span  id Tag */
		}
	});
}


</script>
</head>
<body>
	<h2>게시판</h2>
	<table>
		<tr>
			<td><a href="writeForm.do">글쓰기</a></td>
		</tr>
	</table>
	<table>
		<tr>
			<th>번호</th>	<th>제목</th><th>작성자</th><th>이메일</th><th>IP</th><th>작성일</th><th>조회수</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="board" items="${list }">
				<tr>
					<td>${startNum }</td>
					<td class="left" width=200>
					        <c:if test="${board.read_count > 20}">
						         	<img src='images/hot.gif' onmouseover="getDeptName(${board.bd_num})" >
						   </c:if>
						    <c:if test="${board.re_level > 0}">
						        	<img src='images/level.gif' width="${board.re_level*10}"> 
						             <%--       	board.re_level  ${board.re_level} --%>
					        		<img src='images/re.gif'>
						   </c:if>
						 <a href='content.do?num=${board.bd_num}&pageNum=${currentPage}'>
							${board.subject}</a>
					</td>
					<td>${board.m_id}</td>
					<td><%-- <a href="mailto:${board.email}">${board.email}</a> --%></td>
					<td><%-- ${board.ip} --%></td>
					<td>${board.reg_date}</td>
					<td>${board.read_count}</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1 }" />
			</c:forEach>
		</c:if>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=7>데이터가 없네</td>
			</tr>
		</c:if>
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
	
	<p>deptName:  <input type="text" id="deptName"  readonly="readonly"><p>
</body>
</html>