<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/recruit/searchHire.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="dtitle">
		<table style="width: 100%; height: 100%; margin: 2%">
			<tr>
				<td style="	font-size: 40px; height : 60%;">${list.rc_name}</td>
				<form action="${pageContext.request.contextPath}/apply.do"  method="POST" >
					<td rowspan="2">
					<input type="hidden" name="rc_num" value="${list.rc_num }">
					<input type="submit" value="지원하기" style="width: 80%;height: 60%;"></td>
				</form>
			</tr>
			<tr>
				<td style="font-size: 30px" height="40%">${list.rc_title}</td>
			</tr>
		</table>
	</div>
	<div id="dcontent">
		<img alt="hire" src="${pageContext.request.contextPath}/${list.rc_scrap}" width="100%">
	</div>
	<div id="dfoot">
		<table id="foottb">
			<tr>
				<td rowspan="5" width="30%"><img alt="hireLogo"
					src="${pageContext.request.contextPath}/${list.rc_content}" width="100%"></td>
			</tr>
			<tr>
				<td colspan="2">(주)신세계 푸드</td>
				<td><input type="button" value="관심기업 등록"></td>
			</tr>
			<tr>
				<td>홈페이지</td>
				<td><a href="${list.rc_link}">홈페이지 이동</a>
			</tr>
		</table>
	</div>
</body>
</html>