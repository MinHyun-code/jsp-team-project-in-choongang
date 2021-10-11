<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/recruit/searchHire.css">
<head>
<meta charset="UTF-8">
<title>LikeCompany.jsp</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>	
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript"> 
		alert("관심 목록에 저장 되었습니다. 마이페이지의 관심공고에서 확인하세요");
		//location.href="popUphireUnion.do?union=${rdt.rc_name}";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("이미 관심 목록에 저장된 공고입니다.");
			//location.href="popUphireUnion.do?union=${rdt.rc_name}";
			
		</script>
	</c:if>
			
					
		
</body>
</html>