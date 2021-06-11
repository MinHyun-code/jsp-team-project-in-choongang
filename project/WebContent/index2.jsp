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
 
 
<p id="demo">여기가 id demo 입니다</p>
<button>버튼</button>
 
<script type="text/javascript">
$(function () {
    
    $("button").click(function () {
        $("#demo").load("NewFile.html", function (data,status,xhr) { //function (d,s,x) 이렇게해도 되는데 3개의 파라미터가 자동적으로 넘어옴
                                                                    //데이터를 정상적으로 읽어 왔는지 확인하는 가인수들
                                                                    
             if(status == "success")  //이렇게 달아놓으면 무조건 성공할 떄만 이 message 가 나온다.
            {                      
        //데이터를 성공적으로 받아왔을 때 data 는 받아온 data 값이 들어가고 status 는 success 로 return 되고
        //xhr.status 는 return 으로 200 이 들어오고  
        //xhr.statusText 는 해당 값을 text 로 받아준다. 

          
             $("#demo").append("data : " + data + "<br>");
             $("#demo").append("status = " + status + "<br>"); // 모두 정상이라면 success
             $("#demo").append("xhr.status = " + xhr.status + "<br>"); // 성공하면 나오는 페이지 200
             $("#demo").append("xhr.statusText = " + xhr.statusText + "<br>"); // 200 나오면 success
 
            }
        });        
    });
    
    
    
});
 
 
 
 
 
</script>
 
 
</body>
</html>
