<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/introduce/introduceSelect2.css">
</head>
<body>
	<div id="page">
		<div id="container">
			<section class="plus">
				<form id="inform"
					method="post">
					<table>
						<tr>
							<td id="td1" style="width: 8%; background-color: #EAEAEA;">제목</td>
							<td style="background-color: #EAEAEA;"><input type="text" disabled placeholder="id"
								style="width: 500px; background-color: white" name="si_ques" value="${self.si_ques }"></td>
						</tr>
						<tr style="height: 400px">
							<td id="td1" style="width: 8%; background-color: #EAEAEA;">내용</td>
							<td style="background-color: #EAEAEA;"><textarea disabled placeholder="id"
									id="content" name="si_content" style="width: 600px; background-color: white">${self.si_content }</textarea></td>
						</tr>
					</table>
					<input type="submit" value="목록" style="float: left;">
				</form>
			</section>
		</div>
	</div>
</body>
</html>