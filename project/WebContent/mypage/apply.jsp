<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/mypage/apply.css">


	<script type="text/javascript">
		function chk(){
			if(${result} == 1){
				alert("이미 접수한 공고입니다.");
				return false;
			}
		}
		
	</script>
</head>
<body>
<div id="text"><h2 style="font-size: 30px; font-family:"Do Hyeon";>지원할 이력서를 선택하세요</h2></div>
<div id="wrap">
	<form action="applyAdd.do" method="POST">
		<table id="re">
			<c:forEach var="resume" items="${resumeList}">
			<tr><td id="tr1"  style="height :30px; border-top: 2px solid #D5D5D5; border-left: 2px solid #D5D5D5; border-right: 2px solid #D5D5D5;
			 font-size: 20px;"> 지원이력서</td></tr>
				<tr id="tr2">
					<td height="100px;"  style="  border-top:1px solid #D5D5D5; border-bottom:2px solid #D5D5D5; border-left: 2px solid #D5D5D5; border-right: 2px solid #D5D5D5; font-size: 15px;"> ${resume.r_title} 
						<input type="hidden" name="rc_num" value="${rc_num }">
						<input type="hidden" name="r_num" value="${resume.r_num }">
						<input id="bttn" type="submit" onclick="return chk();"></td>
				</tr>
			<tr><td class="blank">&nbsp;</td></tr>
			</c:forEach>
		</table>
	</form>
</div>
</body>
</html>