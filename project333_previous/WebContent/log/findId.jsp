<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
@font-face {
	font-family: "Do Hyeon";
	src: url("../image/DoHyeon-Regular.ttf") format("truetype");
	font-style: normal;
	font-weight: normal;
}

body {
	margin: 0 auto;
	padding: 0px;
	font-family: "Do Hyeon";
	font-size: 20px;
	background-color: white;
}

header {
	margin-top: 30px;
	padding: 5px;
	display: flex;
	display: block;
}
#box{
width: 70%;
height: 400px;
border: 2px solid #BDBDBD;
position: relative;
margin: auto;
}
table {
	position: relative;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	display: flex;
	align-items: center;
	justify-content: center;
}

tr td #m_name {
	width:  100%;
	height: 60px;
	margin-bottom: 10%;
	   margin-top: 10%;
  background-color: #D5D5D5;
   border: #EAEAEA 2px;
}

tr td #m_email {
	width:   100%;
	height: 60px;
   background-color: #D5D5D5;
   border: #EAEAEA 2px;
   	margin-bottom: 10%;
}

tr td #lg_bt {
	width: 400px;
	height: 60px;
	background: #002266;
	border: 1px;
	font-size: 25px;
	color: white;
	font-weight: bold;
}

nav {
	display: flex;
	background-color: #002266;
}

footer {
	clear: both;
	background-color: #D5D5D5;
	color: white;
	text-align: center;
	padding: 1em 0px;
}
</style>
</head>
<script type="text/javascript">
	function chk() {
		if (!frm.m_name.value) {
			alert("이름을 입력하세요");
			frm.m_name.focus();
			return;
		if (!frm.m_email.value) {
			alert("이메일을 입력하세요");
			frm.email.focus();
			return;
			}
		}
	}
	
	
</script>
<body>

<div>
		<h1 style="cursor: pointer; text-align: center; font-size: 80px; margin-bottom: 40px text-decoration: none;">아이디찾기</h1>
			<hr style="border: solid 1px; width: 80%">
				<p style="text-align: center;" >회원가입 시 등록하신 이메일로 아이디를 확인하실 수 있습니다.</p>
		<div>
			<article>
				<section>
					<form action="${pageContext.request.contextPath}/findId.do" method="post"  name="frm" >
						<div id="box">
						<table>
							<tr>
								<td><input id="m_name" type="text" name="m_name" placeholder="이름"
									title="id" style="font-size: 20px;" id="userId"></td>
							</tr>
							<tr>
								<td><input id="m_email" type="text" name="m_email"
									placeholder="email" title="이메일을 입력" style="font-size: 20px;"></td>
							</tr>
							<tr>
							<td><input id="lg_bt" type="submit" value="찾기"
									class="submit-btn"><a href="log/findIdAfter.jsp"></a></td></tr>
						</table>
						</div>
					</form>
				</section>
			</article>
		</div>

		<div style="overflow: auto; width: 500px; height: 150px;"></div>
		<footer> Copyright & copy </footer>
		</div>
</body>
</html>