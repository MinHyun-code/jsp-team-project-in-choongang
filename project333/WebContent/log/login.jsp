<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link link rel="stylesheet" href="${pageContext.request.contextPath}/log/login.css">
<title>Insert title here</title>

<c:if test="${ loginResult == -1 || loginResult == 0 }">
	<script>
		alert("아이디 혹은 비밀번호가 틀렸습니다.");
	</script>
</c:if>
<script type="text/javascript" src="../js/jquery.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	window.Kakao.init("5d25b14933932d1f0479d57932869cd7");
	
	function kakaoLogin() { 
		window.Kakao.Auth.login({
			scope:'	profile, account_email, gender, birthday',
			success: function(authObj) {
				console.log(authObj);
				window.Kakao.API.request({
					url:'/v2/user/me',
					success: res =>{
						const Kakao_account = res.kakao_account;
						 console.log('authObj-->' , authObj);
						 console.log('Kakao_account-->', Kakao_account);
						 console.log('Kakao_account-->', Kakao_account.birthday);
						 
						 var m_id = Kakao_account.email;
						 var m_pass = Kakao_account;
						 var m_birth = Kakao_account.birthday;
						 var m_email = Kakao_account.email;
						 var m_gender = Kakao_account.gender;
						 
							$.ajax({
								url:"${pageContext.request.contextPath}/kakaoJoin.do",  
								data:{m_id : m_id , m_gender : m_gender, m_email : m_email},
								dataType:'text',
								success:function(data){
									 alert("로그인 되었습니다.");
									 location.href="../main.jsp";
								}
							});
						 
						 
					}
				});
			}
		});
	}
	   function popUp() {
		      window.open('${pageContext.request.contextPath}/log/findId.jsp', 'findId', 'width=600, height=1200');      
		   }
		   function popUp1() {
			      window.open('${pageContext.request.contextPath}/log/findPass.jsp', 'findPass', 'width=600, height=1200');      
			   }

	</script>

</head>
<body onload="bodyOnloadFunc()">
	<div>
		<h1
			onclick="location.href='${pageContext.request.contextPath}/main.jsp'"
			style="cursor: pointer; text-align: center; font-size: 130px; color: #002266; margin-bottom: 40px;">다JOB아</h1>
		<div>
			<article>
				<section>
					<form id="form"
						action="${pageContext.request.contextPath}/login.do" method="post">
						<table>
							<tr>
								<td tabindex="1" colspan="2"><input id="id" type="text" name="m_id" placeholder="id"
									title="id" style="font-size: 25px"></td>
								<td tabindex="3" rowspan="2"><input id="lg_bt" type="submit" value="로그인"
									class="submit-btn"></td>
							</tr>
							<tr>
								<td tabindex="2" colspan="2"><input id="pw" type="password" name="m_pass"
									placeholder="password" title="비밀번호입력" style="font-size: 25px"></td>
							</tr>
							<tr>
								<td><input type="checkbox" id="chk_id"
									onclick="rememberCheck(this)"><label for="chk_id">&nbsp;아이디저장</label></td>
								<td></td>
								<td><a
									href="${pageContext.request.contextPath}/log/join.jsp"
									style="text-decoration: none; color: #646464">회원가입</a> <a
									href="${pageContext.request.contextPath}/log/login.jsp"
									onclick="return popUp()"
									style="text-decoration: none; color: #646464">아이디찾기</a> <a
									href="${pageContext.request.contextPath}/log/login.jsp"
									onclick="return popUp1()"
									style="text-decoration: none; color: #646464">비밀번호 찾기</a></td>

							</tr>
							<tr>
								<td id="naver_id_login">
								<img alt=""
									src="${pageContext.request.contextPath}/image/네이버.png" 
									width="200" height="50"> 
								</td>
								<td><img alt=""
									src="${pageContext.request.contextPath}/image/카카오.png"
									width="200" height="45" onclick="kakaoLogin()"
									style="cursor: pointer;"></td>
							</tr>
						</table>
<script type="text/javascript"
      src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
      charset="utf-8"></script>

<script type="text/javascript">
      var clientId = "cLLZTZYCqNI24QF1fnjE";
      var callbackUrl = "http://localhost:8484/project/naver.jsp";
      var naver_id_login = new naver_id_login(clientId, callbackUrl);
      var state = naver_id_login.getUniqState();
      naver_id_login.setButton("white" , 3, 45);
      naver_id_login.setDomain("localhost:8484/project/main.jsp");
      naver_id_login.setState(state);
      naver_id_login.setPopup();
      naver_id_login.init_naver_id_login();
</script>
					</form>
				</section>
			</article>
		</div>

		<div style="overflow: auto; width: 500px; height: 150px;"></div>
		<footer> Copyright & copy </footer>
	</div>
	<script type="text/javascript">
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