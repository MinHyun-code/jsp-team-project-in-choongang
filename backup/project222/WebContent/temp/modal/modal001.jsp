<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<style>
body {
	background-color:green;
}
.modal {
	position: absolute;
	width: 400px;
	height: 400px;
	background: rgba(0, 0, 0, 0.5);
	top: 100px;
	left: 500px;
	display: none;
	color: white;
}
</style>
</head>
<body>
	<button>모달창</button>
	<div class="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			여기에 모달창 내용을 적어줍니다.<br> 이미지여도 좋고 글이어도 좋습니다.
		</div>
	</div>
	
	<script>
		$(function() {
			$("button").click(function() {
				$(".modal").fadeIn();
			});
			$(".modal_content").click(function() {
				$(".modal").fadeOut();
			});
		});
	</script>
</body>
</html>