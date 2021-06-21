

//네이버
var clientId = "cLLZTZYCqNI24QF1fnjE";
var callbackUrl = "http://localhost:8484/project/naver.jsp";
var naver_id_login = new naver_id_login(clientId, callbackUrl);
var state = naver_id_login.getUniqState();
naver_id_login.setButton("white", 3, 45);
naver_id_login.setDomain("localhost:8484/project/main.jsp");
naver_id_login.setState(state);
naver_id_login.setPopup();
naver_id_login.init_naver_id_login();

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
							location.href = "../main.jsp";
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


//쿠키
var form = document.getElementById('form');
form.addEventListener('submit', saveCookieId);

function bodyOnloadFunc() {
	var chk_id = document.getElementById('chk_id');
	if (getCookie("idCheckBox") == "true") {
		form.chk_id.checked = "true";
		form.m_id.value = getCookie("savedId");
	}
}

function rememberCheck() {
	setCookie("idCheckBox", form.chk_id.checked, "1");
	console.log("rememberCheck: " + getCookie("idCheckBox"));
}


function saveCookieId(event) {
	if (getCookie("idCheckBox") == "true") {
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
