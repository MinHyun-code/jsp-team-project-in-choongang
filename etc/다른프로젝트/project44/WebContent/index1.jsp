<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
 
입력 : <input type="text" id="data"> <!-- 입력된 값 다른곳에 저장하고 여기로 가져와서 보여준다. -->
 
<p id="demo">여기가 id demo 입니다</p>
<button>버튼</button>
 
<script type="text/javascript">
 
$(function () {
    /* $("button").click(function (){
        $("#demo").load("NewFile.jsp", "t1=" +$("#data").val()  + "&t2=World"); //값 넘겨주고 값 바꾸고 다시 가져와서 위에 demo 에 띄어줌
    }); */
    $("button").click(function (){
        $("#demo").load("NewFile.jsp",{t1:"ABC", t2:"DBD" }); //Json 방식으로 넘겨줌
        //데이터가 json 방식을 짜여있고 이 데이터를 보내고 NewFile.jsp 파일에서 값을 getParameter 로 데이터를 받아온다. t1 ,t2 는 name 이라고 생각하면 된다.
        
    });
});
 
 
 
 
 
</script>
 
 
</body>
</html>
