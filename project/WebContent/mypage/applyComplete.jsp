<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#text {
	position: relative;
}

#img {
	float: right;
	position: relative;
}

#txt {
	font-size: 20px; width : 80%;
	height: 100px;
	width: 800px;
}

#recuit {
	padding-top: 10%;
	text-align: center;
	width: 100%;
	height: 500px;
	font-size: 20px;
	font-weight: bold;
	background: #e3eaed91;
	color: #4374D9;
}

#wrap {
 width:260px;
	margin-right: 90%;
}
#img2{
	margin: 0auto;
   margin-left: 18%;
}
</style>
</head>
<body>

	<div id="wrap">
		<div id="img">
			<img alt="" src="${pageContext.request.contextPath}/image/plane.png"
				width="50" height="50">
		</div>
		<div id="txt">
			<h2 id="text" style="color: #4374D9;">
				입사지원 <span style="color: black;">&nbsp;완료</span>
			</h2>
		</div>
	</div>
	<div id="recuit">
		좋은결과 있으시길 바랍니다.<br><br> <span style="color: black;">
		합격 결과는 지원한결과에 따라 개별적으로 나타냅니다.</span>


		<div id="img2">
			<img alt="" src="${pageContext.request.contextPath}/image/flyman.png"
				style="width: 600px; height :400px; margin-right: 200px;">
		</div>
	</div>
</body>
</html>