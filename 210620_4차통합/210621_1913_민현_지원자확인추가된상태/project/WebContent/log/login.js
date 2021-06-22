



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
