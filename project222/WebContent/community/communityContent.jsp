<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>communityContent</h1>
${board.subject}<br>
${board.reg_date}<br>
<fmt:formatDate value="${board.reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/><br>
</body>
</html>