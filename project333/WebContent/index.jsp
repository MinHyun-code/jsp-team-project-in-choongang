<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<script>
		location.href = "${pageContext.request.contextPath}/main.do";
	</script>


	Ajax : Asynchronous Java Script Xml (비동기) 데이터를 넘겨주지만 페이지는 바뀌지 않는다..!!!!!! . XML , Json (json 을 많이 씀) 을 생성해서 사용하는 경우가 많다. Ajax 는 JQuery 소속


	<p id="demo">여기가 id demo 입니다</p>
	<button>버튼</button>

	<script type="text/javascript">
		//비동기 - 페이지는 유지하면서 값만 가져올 때
		//현재 장면은 안변하는데 외부에서 data 를 가져올 때 밑에처럼 씀(  외부파일은 NewFile.html 임)
		$(document).ready(function() {
			$("button").click(function() { //id 등록이 안됨
				//$("#demo").load("NewFile.html");

				$("#demo").load("NewFile.html #session01"); //이러면 외부파일에서 선택한 아이디의 태그를 가져온다
				//해당 태그의 id 가 있는 곳에 load 하는데 그 load할 데이터는 NewFile 에 있는 해당 아이디가 있는 태그의 value 값을 가지고 온다 

			});

			/* $("button").on("click",function(){ //id 등록이 됨
			    
			}); */
		});
	</script>



</body>
</html>
