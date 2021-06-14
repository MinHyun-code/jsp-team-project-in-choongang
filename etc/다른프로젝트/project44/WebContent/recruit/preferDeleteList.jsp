<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("관심공고에서 삭제 되었습니다.");
 		location.href="${pageContext.request.contextPath}/preferList.do?m_id=asd";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("삭제가 되지 않았습니다. 관리자에게 문의 바랍니다.");
		location.href="${pageContext.request.contextPath}/preferList.do?m_id=asd";
	</script>
</c:if>
</head>
<body>

	
</body>
</html>