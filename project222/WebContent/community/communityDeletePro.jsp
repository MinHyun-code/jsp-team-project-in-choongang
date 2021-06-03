<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("삭제 완료");  
		location.href="${pageContext.request.contextPath}/communityList.do";
	</script>
</c:if>
<c:if test="${result <= 0 }">  
	<script type="text/javascript">
		alert("삭제 오류 (result: ${result})");  
		location.href="${pageContext.request.contextPath}/communityList.do";
	</script>
</c:if>
</body>
</html>