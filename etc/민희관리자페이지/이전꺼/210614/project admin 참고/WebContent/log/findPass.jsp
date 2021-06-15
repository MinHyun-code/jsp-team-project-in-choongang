<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

tr td #m_name{
	width:  400px;
	height: 60px;
	margin-bottom: 5%;
	   margin-top: 5%;
  background-color: #D5D5D5;
   border: #EAEAEA 2px;
}

tr td #m_id {
	width:  400px;
	height: 60px;
	   margin-top: 15%;
  background-color: #D5D5D5;
   border: #EAEAEA 2px;
}

tr td #m_email {
	width:  400px;
	height: 60px;
   background-color: #D5D5D5;
   border: #EAEAEA 2px;
   	margin-bottom: 5%;
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
<body>
<div>
		<h1 style="cursor: pointer; text-align: center; font-size: 80px; margin-bottom: 40px text-decoration: none;">비밀번호찾기</h1>
			<hr style="border: solid 1px; width: 80%">
				<p style="text-align: center;" > 비밀번호는 ${m_pass }입니다.<p>
		<div>
			<article>
				<section>
					<form action="${pageContext.request.contextPath}/findPass.do" method="post">
						<div id="box">
						<table>
							<tr>
								<td><input id="m_id" type="text" name="m_id" placeholder="아이디"
									title="id" style="font-size: 20px;" id="userId"></td>
							</tr>
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
									class="submit-btn"><a href="log/findPassAfter.jsp"></a></td></tr>
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