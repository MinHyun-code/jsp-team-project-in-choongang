<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<style>
	#result {
		color: yellow;
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
				name : "apple",
				age : 14
			}

			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/temp/ajax/ajax004.jsp",
				data : params,
				success : function(res) {
					$('#show').html($(res));
					$("#result").css("background-color","blue");
					$("#result").css("height","150px");
				},
			})

		});
	</script>
</body>
</html>