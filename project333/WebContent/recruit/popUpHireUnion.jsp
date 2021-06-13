<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/recruit/searchHire.css">
<head>
<meta charset="UTF-8">
<title>popUpHireUnion.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/recruit/kakaoMap.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fe0e9f03162b4483b8714cec0d96833e&libraries=services,clusterer,drawing"></script>
<script defer src="${pageContext.request.contextPath}/recruit/kakaoMap.js"></script>
<style type="text/css">
#btn {
	width: 100px;
	height: 45px;
	border: 0;
	border-radius: 15px;
	font-size: 15px;
	font-weight: 600;
	color: #235594
}

#btn:hover {
	background-color: #1F96B8;
	color: white;
}

#s {
	text-align: center;
}
}
</style>
<script type="text/javascript">
var rc_name = '${list.rc_name}';
var rc_view = '${list.rc_view}';

var company_lan = rc_view[0]+rc_view[1]+".";
for (var i = 2; i<9; i++) {
	company_lan += rc_view[i];
}
company_lan = Number(company_lan);

var company_lon = rc_view[9]+rc_view[10]+rc_view[11]+".";
for (var i = 12; i<rc_view.length; i++) {
	company_lon += rc_view[i];
}
company_lon = Number(company_lon);

console.log('${list.rc_view}');
console.log(company_lan);
console.log(company_lon);

</script>
</head>
<body>
	<div class="dtitle">
		<form action="${pageContext.request.contextPath}/apply.do" method="POST">
			<table style="width: 100%; height: 100%; margin: 2%">
				<tr>
					<td style="font-size: 40px; height: 60%;">${list.rc_name}</td>
					<td rowspan="2">
						<input type="hidden" name="rc_num" value="${list.rc_num }">
						<input type="submit" value="지원하기" style="width: 80%; height: 60%;">
					</td>
				</tr>
				<tr>
					<td style="font-size: 30px" height="40%">${list.rc_title}</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dcontent">
		<img alt="hire" src="${pageContext.request.contextPath}/${list.rc_scrap}" width="100%">
	</div>
	<div id="dfoot">
		<table id="foottb">
			<tr>
				<td rowspan="5" width="30%">
					<img alt="hireLogo" src="${pageContext.request.contextPath}/${list.rc_content}" width="100%">
				</td>
			</tr>
			<tr>
				<td id="s">${list.rc_name}</td>
				<td id="s" colspan="2">공고일 : ${list.rc_date}</td>

				<c:if test="${sessionID != null }">
					<%-- 	     	<td><input type="image" src="${pageContext.request.contextPath}/image/heart.png" width="40px" height= "30px" onclick="location.href='${pageContext.request.contextPath}/likeCompany.do?rc_num=${list.rc_num}&m_id=${sessionID}'"></td> --%>
					<td>
						<input id="btn" type="submit" value="스크랩" onclick="location.href='${pageContext.request.contextPath}/likeCompany.do?rc_num=${list.rc_num}&m_id=${sessionID}'">
				</c:if>
				<c:if test="${sessionID == null }">
					<td>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</td>
				</c:if>
			</tr>
			<tr>
				<td id="s">홈페이지</td>
				<td id="s">
					<a href="${list.rc_link}"> 해당 페이지로 이동 하기 </a>
			</tr>
		</table>
		<div id="map" style="width: 100%; height: 350px;"></div>
	</div>
</body>
</html>