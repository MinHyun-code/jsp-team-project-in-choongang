<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("cLLZTZYCqNI24QF1fnjE", "http://localhost:8484/project/naver.jsp");
  // 접근 토큰 값 출력
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    
    var m_id = naver_id_login.getProfileData('email');	
    var m_gender = naver_id_login.getProfileData('gender');	
    var m_email = naver_id_login.getProfileData('email');

    
    $.ajax({
		url:"${pageContext.request.contextPath}/kakaoJoin.do",  
		data:{m_id : m_id , m_email : m_email},
		dataType:'text',
		success:function(data){
			 alert("로그인 되었습니다.");
			 window.opener.location.href="${pageContext.request.contextPath}/main.do";
				self.close();
		}
	});
  }
</script>
</body>
</html>