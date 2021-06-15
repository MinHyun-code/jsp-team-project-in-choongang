<!doctype html>
<html lang="utf-8">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<div id="naver_id_login"></div>
<script type="text/javascript"
      src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
      charset="utf-8"></script>

<script type="text/javascript">
      var clientId = "cLLZTZYCqNI24QF1fnjE";
      var callbackUrl = "http://localhost:8484/project/naver.jsp";
      var naver_id_login = new naver_id_login(clientId, callbackUrl);
      var state = naver_id_login.getUniqState();
      naver_id_login.setButton("white", 3, 40);
      naver_id_login.setDomain("localhost:8484/project/main.jsp");
      naver_id_login.setState(state);
      naver_id_login.setPopup();
      naver_id_login.init_naver_id_login();
</script>
</body>
</html>