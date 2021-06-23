<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/log/login.css">

<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script defer src="${pageContext.request.contextPath}/log/login.js"></script>
</head>
<body onload="bodyOnloadFunc()">
	<div>
		<h1 onclick="location.href='${pageContext.request.contextPath}/main.do'" style="cursor: pointer; text-align: center; font-size: 130px; color: #002266; margin-bottom: 40px;">다JOB아</h1>
		<div>
			<article>
				<section>
					<form id="form" action="${pageContext.request.contextPath}/login.do" method="post" onsubmit="return chk()">
						<table>
							<tr>
								<td colspan="2"><input id="id" type="text" tabindex="1" name="m_id" placeholder="id" title="id" style="font-size: 25px"></td>
								<td rowspan="2"><input id="lg_bt" type="submit" tabindex="3" value="로그인" class="submit-btn" style="cursor: pointer;"></td>
							</tr>
							<tr>
								<td colspan="2"><input id="pw" type="password" tabindex="2" name="m_pass" placeholder="password" title="비밀번호입력" style="font-size: 25px"></td>
							</tr>
							<tr>
								<td><input type="checkbox" id="chk_id" onclick="rememberCheck(this)"><label for="chk_id">&nbsp;아이디저장</label></td>
								<td></td>
								<td><a href="${pageContext.request.contextPath}/log/join.jsp" style="text-decoration: none; color: #646464">회원가입</a> <a href="${pageContext.request.contextPath}/log/login.jsp" onclick="return popUp()" style="text-decoration: none; color: #646464">아이디찾기</a> <a href="${pageContext.request.contextPath}/log/login.jsp" onclick="return popUp1()" style="text-decoration: none; color: #646464">비밀번호 찾기</a></td>

							</tr>
							<tr>
								<td>
									<div id="naver_id_login"></div>
								</td>
								<td><a href="javascript:kakaoLogin();"><img alt="" src="${pageContext.request.contextPath}/image/카카오.png" width="190" height="44"></a></td>
							</tr>

						</table>
					</form>
				</section>
			</article>
		</div>
		<div style="overflow: auto; width: 500px; height: 150px;"></div>
		<footer> Copyright & copy </footer>
	</div>
<script type="text/javascript">
		var a;
		var list;
		function chk(){
			var function_result = true;
			$.ajax({
				url:'${pageContext.request.contextPath}/login.do',
				data:{m_id : document.getElementById('form').m_id.value, m_pass : document.getElementById('form').m_pass.value},
				dataType:'html',
				async: false, //비동기함수를 동기함수로 변환(이걸 적어줘야 순차적으로 실행)
				success: (result) => {					
					a = result;
					list = $.parseHTML(a); //parse=오브젝트 형태로 변환
					for(var key in list) {
						if(list[key].innerText=="Main Page") {
							function_result = true;
							break;
						} else {
							function_result = false;
						}
						console.log("in for");
					}
					
					if(function_result) {
						alert('로그인 되었습니다.');
					} else {
						alert('아이디 혹은 비밀번호가 틀렸습니다.');
					}
				}
			})
			return function_result;
		}
		
		//카카오
		window.Kakao.init("5d25b14933932d1f0479d57932869cd7");

		function kakaoLogin() {
			window.Kakao.Auth.login({
				scope: '	profile, account_email, gender, birthday',
				success: function(authObj) {
					console.log(authObj);
					window.Kakao.API.request({
						url: '/v2/user/me',
						success: res => {
							const Kakao_account = res.kakao_account;
							console.log('authObj-->', authObj);
							console.log('Kakao_account-->', Kakao_account);
							console.log('Kakao_account-->', Kakao_account.birthday);

							var m_id = Kakao_account.email;
							var m_pass = Kakao_account;
							var m_birth = Kakao_account.birthday;
							var m_email = Kakao_account.email;
							var m_gender = Kakao_account.gender;

							$.ajax({
								url: "${pageContext.request.contextPath}/kakaoJoin.do",
								data: { m_id: m_id, m_gender: m_gender, m_email: m_email },
								dataType: 'text',
								success: function(data) {
									alert("로그인 되었습니다.");
									location.href = "${pageContext.request.contextPath}/main.do";
								}
							});


						}
					});
				}
			});
		}
		
		function popUp() {
			window.open('${pageContext.request.contextPath}/log/findId.jsp', 'findId', 'width=850, height=1200');
		}
		function popUp1() {
			window.open('${pageContext.request.contextPath}/log/findPass.jsp', 'findPass', 'width=850, height=1200');
		}

		
</script>	
<script>
//네이버
var clientId = "cLLZTZYCqNI24QF1fnjE";
var callbackUrl = "http://localhost:8484/project/naver.jsp";
var naver_id_login = new naver_id_login(clientId, callbackUrl);
var state = naver_id_login.getUniqState();
naver_id_login.setButton("white", 3, 45);
naver_id_login.setDomain("localhost:8484/project/main.do");
naver_id_login.setState(state);
naver_id_login.setPopup();
naver_id_login.init_naver_id_login();
</script>
</body>
</html>