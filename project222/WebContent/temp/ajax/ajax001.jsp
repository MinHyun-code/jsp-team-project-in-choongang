<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<style>
#show {
	height: 100px;
	background-color: green;
}
</style>
</head>
<body>
	<input type="button" id="request" value="requestt" />
	<br>
	<div id="show"></div>
	<br>


	<script>
		$("#request").click(function() {

			var params = {
				name : "한글",
				age : 14
			}

			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/communityList.do",
				data : params,
				success : function(res) {
					var list = $.parseHTML(res);
					$("#show").append(list);
				},
			})

		});
	</script>
</body>
</html>