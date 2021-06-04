<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/log/login.css">
	<c:if test="${sessionID != null }">
		<script type="text/javascript">
			alert("이미 로그인 중입니다.");
			location.href = "${pageContext.request.contextPath}/main.jsp";
		</script>
	</c:if>
	<c:if test="${ loginResult == -1 || loginResult == 0 }">
		<script>
			alert("아이디 혹은 비밀번호가 틀렸습니다.");
		</script>
	</c:if>
</head>
<body onload="bodyOnloadFunc()">
	<div>
		<h1 onclick="location.href='${pageContext.request.contextPath}/main.jsp'"
			style="cursor: pointer; text-align: center; font-size: 130px; color: #002266; margin-bottom: 40px;">다JOB아</h1>
		<div>
			<article>
				<section>
					<form id="form" action="${pageContext.request.contextPath}/login.do" method="post">
						<table>
							<tr>
								<td><input id="id" type="text" name="m_id" placeholder="id"
									title="id"></td>
								<td rowspan="2"><input id="lg_bt" type="submit" value="로그인"
									class="submit-btn"></td>
							</tr>
							<tr>
								<td><input id="pw" type="password" name="m_pass"
									placeholder="비밀번호" title="비밀번호입력"></td>
							</tr>
							<tr>
								<td><input type="checkbox" id="chk_id"  onclick="rememberCheck(this)"><label
									for="chk_id">&nbsp;아이디저장</label></td>
								<td><a href="${pageContext.request.contextPath}/log/join.jsp">회원가입</a> <a href="">아이디찾기</a> <a
									href="">비밀번호 찾기</a></td>

							</tr>
							<tr>
								<td><img alt="" src="${pageContext.request.contextPath}/image/네이버.png" width="200" height="50">
									<img alt="" src="${pageContext.request.contextPath}/image/카카오.png" width="200" height="50"></td>
							</tr>
						</table>
					</form>
				</section>
			</article>
		</div>

		<div style="overflow: auto; width: 500px; height: 150px;"></div>
		<footer> Copyright & copy </footer>
	</div>
	<script>
	
		var form = document.getElementById('form');
		form.addEventListener('submit', saveCookieId);
		
        function bodyOnloadFunc() {
        	var chk_id = document.getElementById('chk_id');
        	if(getCookie("idCheckBox")=="true") {
        		form.chk_id.checked = "true";
        		form.m_id.value = getCookie("savedId");
        	}
        }
        
        function rememberCheck() {
        	setCookie("idCheckBox", form.chk_id.checked, "1");
        	console.log("rememberCheck: "+getCookie("idCheckBox"));
        }
        
        
		function saveCookieId(event) {
			if(getCookie("idCheckBox")=="true"){
				setCookie("savedId", form.m_id.value, "1");
			}
			console.log(form.m_id.value);
			//event.preventDefault();
	    }
		
	    function setCookie(cName, cValue, cDay) {
	        var expire = new Date();
	        expire.setDate(expire.getDate() + cDay);
	        cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
	        if (typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
	        document.cookie = cookies;
	    }
	    
        function getCookie(cName) {
            cName = cName + '=';
            var cookieData = document.cookie;
            var start = cookieData.indexOf(cName);
            var cValue = '';
            if (start != -1) {
                start += cName.length;
                var end = cookieData.indexOf(';', start);
                if (end == -1) end = cookieData.length;
                cValue = cookieData.substring(start, end);
            }
            return unescape(cValue);
        }
	</script>
</body>
</head>
<body>

</body>
</html>