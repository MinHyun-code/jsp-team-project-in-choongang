<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#t{
color: blue;
padding-left: 10%;
}

#f{
color: red;
padding-left: 10%;
}
</style>
</head>
<body>
	<c:if test="${ result == 0 }">
    <p id="t">사용할 수 있는 ID입니다</p>
	</c:if>
	<c:if test="${ result != 0 }">
	<p id="f">이미 있는 아이디니 다른 것을 사용하세요</p>
</c:if>
</body>
</html>