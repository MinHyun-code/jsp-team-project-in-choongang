<!doctype html>
<html lang="utf-8">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var clientId = "cLLZTZYCqNI24QF1fnjE";
  var callbackUrl = "http://localhost:8484/project/naver.jsp";
  var naver_id_login = new naver_id_login(clientId, callbackUrl);
  alert(naver_id_login.oauthParams.access_token);
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  function naverSignInCallback() {
		 var m_id = Kakao_account.email;
		 var m_email = Kakao_account.email;
		 
			$.ajax({
				url:"${pageContext.request.contextPath}/kakaoJoin.do",  
				data:{m_id : m_id , m_email : m_email},
				dataType:'text',
				success:function(data){
					 alert("로그인 되었습니다.");
					 location.href="../main.jsp";
				}
			});
  }
</script>
</body>
</html>