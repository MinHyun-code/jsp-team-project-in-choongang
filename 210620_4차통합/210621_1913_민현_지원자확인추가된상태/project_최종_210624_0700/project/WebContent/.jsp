<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<script type="text/javascript" src="./js/jquery.js"></script>
</head>
<body>
<textarea style="width:600px;" class="DOC_TEXT" name="DOC_TEXT" >
</textarea>
<br />
<span style="color:#aaa;" id="counter">글자 수 (0)</span>
<script type="text/javascript">
$('.DOC_TEXT').keyup(function (e){
    var content = $(this).val();
    $('#counter').html("(글자 수 "+content.length+")");  

    if (content.length > 200){
        alert("최대 200자까지 입력 가능합니다.");
        $(this).val(content.substring(0, 200));
        $('#counter').html("(200 / 최대 200자)");
    }
});
</script>
</body>
</html>