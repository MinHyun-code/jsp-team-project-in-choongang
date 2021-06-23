//회원가입 동의
function agree_chk() {

	if (!frm.agree1.checked == false) {
		frm.agree1.focus();
		return;
	}
	if (!frm.agree2.checked == false) {
		frm.agree2.focus();
		return;
	}
}



//동의란 숨기기
function doShow() { 
    if ($('#scroll').is(":visible")) { 
        $('#scroll').hide(); 
        $('.button1').text('내용보기▼'); 
    } else { 
        $('#scroll').show(); 
        $('.button1').text('숨기기▼'); 
    } 
} 
function doShow2() { 
    if ($('#scroll2').is(":visible")) { 
        $('#scroll2').hide();
        $('.button2').text('내용보기▼'); 
    } else { 
        $('#scroll2').show(); 
        $('.button2').text('숨기기▼'); 
    } 
} 

//비밀번호유효성검사
function m_pass() {
	var m_pass = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}$/;
	if(!m_pass.test(frm.m_pass.value)) {
	
	//     alert("비밀번호는 영어,숫자,특수문자 조합으로 해주세요.(글자수는 6~12)")
		var msg = '비밀번호는 영어,숫자,특수문자 조합으로 해주세요.(글자수는 6~12)'
	    document.getElementById('checkMsg_pass').innerHTML = msg;
		document.getElementById('checkMsg_pass').style.color = 'red';
		document.getElementById('checkMsg_pass').style.paddingLeft = '10%';
	    frm.m_pass.focus();
	    return false;
	} else {
		document.getElementById('checkMsg_pass').innerHTML = "사용 가능한 비밀번호입니다.";
		document.getElementById('checkMsg_pass').style.color = 'blue';
		document.getElementById('checkMsg_pass').style.paddingLeft = '10%';
	}
}

$(function() {
	$('#pwCheck').on("keyup", function() {
		m_pass();
	});
}); 
