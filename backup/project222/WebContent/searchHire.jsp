<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="searchHire.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery.js"></script>	
<script type="text/javascript">
	function popUp() {
		window.open('popUpHire.jsp', 'Hire', 'width=800, height=1600');
	}
</script>
</head>
<body>
	<div id="page">
		<header>
			<div>
				<h1 onclick="location.href='main.jsp'"
					style="cursor: pointer; text-align: center; font-size: 130px; color: #002266; margin-bottom: 40px;">다JOB아</h1>
			</div>
			<nav>
				<a href="#">채용공고</a> 
				<a href="${pageContext.request.contextPath}/searchHire.jsp">회사검색</a> 
				<a href="${pageContext.request.contextPath}/communityList.do">커뮤니티</a> 
				<a href="${pageContext.request.contextPath}/mypage.jsp">마이페이지</a> 
				<c:if test="${sessionID != null }">
					<a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
				</c:if>
				<c:if test="${sessionID == null }">
					<a href="${pageContext.request.contextPath}/log/login.jsp">로그인</a>
				</c:if>
			</nav>
			<table id="searchBox">
				<tr>
					<td><input type="text" placeholder="Search" id="search">
					</td>
					<td><a href="#"><input type="image"
							src="./image/search.png" id="searchimg"></a></td>
				</tr>
			</table>
		</header>
		<div id="container">
			<div class="search_area">
				<form action="/webservlet 주소" method="get" id="searchForm">
					<div class="search_div1">
						<table id="search_tb">
							<tr>
								<td>경력</td>
								<td><input type="checkbox" id="r1" name="area" value="2001" />
								<label for="r1">신입</label></td>
								<td><input type="checkbox" id="r2" name="area" value="2005" />
								<label for="r2">경력</label></td>
							</tr>
							<tr>
								<td>지역</td>
								<td><input type="checkbox" id="r1" name="area" value="2001" />
								<label for="r1">서울</label></td>
								<td><input type="checkbox" id="r2" name="area" value="2005" />
								<label for="r2">인천</label></td>
								<td><input type="checkbox" id="r3" name="area" value="2009" />
								<label for="r3">대전</label></td>
								<td><input type="checkbox" id="r4" name="area" value="2002" />
								<label for="r4">광주</label></td>
								<td><input type="checkbox" id="r5" name="area" value="2006" />
								<label for="r5">부산</label></td>
								<td><input type="checkbox" id="r6" name="area" value="2010" />
								<label for="r6">대구</label></td>
								<td><input type="checkbox" id="r7" name="area" value="2003" />
								<label for="r7">경기</label></td>
								<td><input type="checkbox" id="r8" name="area" value="2007" />
								<label for="r8">강원</label></td>
								<td><input type="checkbox" id="r9" name="area" value="2011" />
								<label for="r9">충청</label></td>
								<td><input type="checkbox" id="r10" name="area" value="2004" />
								<label for="r10">호남</label></td>
								<td><input type="checkbox" id="r11" name="area" value="2008" />
								<label for="r11">영남</label></td>
								<td><input type="checkbox" id="r12" name="area" value="2012" />
								<label for="r12">제주</label></td>
							</tr>
							<tr>
								<td>업종</td>
								<td><input type="checkbox" id="r1" name="area" value="2001" />
								<label for="r1">IT</label></td>
								<td><input type="checkbox" id="r2" name="area" value="2005" />
								<label for="r2">금융</label></td>
								<td><input type="checkbox" id="r2" name="area" value="2005" />
								<label for="r2">의료</label></td>
								<td><input type="checkbox" id="r2" name="area" value="2005" />
								<label for="r2">서비스</label></td>
							</tr>
							<tr>
								<td>근무형태&nbsp &nbsp</td>
								<td><input type="checkbox" id="r1" name="area" value="2001" />
								<label for="r1">정규직</label></td>
								<td><input type="checkbox" id="r2" name="area" value="2005" />
								<label for="r2">인턴</label></td>
								<td><input type="checkbox" id="r2" name="area" value="2005" />
								<label for="r2">계약직</label></td>
							</tr>
							<tr>
								<td>기업형태</td>
								<td><input type="checkbox" id="r1" name="area" value="2001" />
								<label for="r1">중소기업</label></td>
								<td><input type="checkbox" id="r2" name="area" value="2005" />
								<label for="r2">중견기업</label></td>
								<td><input type="checkbox" id="r2" name="area" value="2005" />
								<label for="r2">대기업</label></td>
								<td><input type="checkbox" id="r2" name="area" value="2005" />
								<label for="r2">공기업</label></td>
								<td><input type="checkbox" id="r2" name="area" value="2005" />
								<label for="r2">공공기관</label></td>
							</tr>	
						</table>
					</div>
					<!-- search_ctn END -->
					<!-- 			<div class="search_box"> -->
					<!-- 				<select name="searchType"> -->
					<!-- 					<option>선택</option> -->
					<!-- 					<option value="id">ID</option> -->
					<!-- 					<option value="title">제목</option> -->
					<!-- 				</select> <input type="text" class="searchbox" name="searchWord" /> -->

					<!-- 				<button class="btn" type="submit"> -->
					<!-- 					<i class="fas fa-search-plus" style="color: skyblue"></i> -->
					<!-- 				</button> -->
					<!-- 			</div> -->
					<!-- search_box END-->
				</form>
			</div>
			<article id="content">
				<section class="ct">
					<table border="1" class="ct_tb">
						<tr>
							<td align="center"><img alt="logo" src="./image/hireLogo.png" onclick="popUp()" style="cursor: pointer;" width="270px" height="160px">
								안전관리자 계약/정규직 채용</td>
						</tr>
					</table>
				</section>
				<section class="ct">
					<table border="1" class="ct_tb">
						<tr>
							<td align="center">채용 공고 2</td>
						</tr>
					</table>
				</section>
				<section class="ct">
					<table border="1" class="ct_tb">
						<tr>
							<td align="center">채용 공고 3</td>
						</tr>
					</table>
				</section>
				<section class="ct">
					<table border="1" class="ct_tb">
						<tr>
							<td align="center">채용 공고 4</td>
						</tr>
					</table>
				</section>
				<section class="ct">
					<table border="1" class="ct_tb">
						<tr>
							<td align="center">채용 공고 5</td>
						</tr>
					</table>
				</section>
				<section class="ct">
					<table border="1" class="ct_tb">
						<tr>
							<td align="center">채용 공고 6</td>
						</tr>
					</table>
				</section>
				<section class="ct">
					<table border="1" class="ct_tb">
						<tr>
							<td align="center">채용 공고 6</td>
						</tr>
					</table>
				</section>
				<section class="ct">
					<table border="1" class="ct_tb">
						<tr>
							<td align="center">채용 공고 6</td>
						</tr>
					</table>
				</section>
			</article>
		</div>
		<aside id="right">
			<ul>
				<li><a href="#">마이페이지</a></li>
				<li><a href="#">이력서 관리</a></li>
				<li><a href="#">커뮤니티</a></li>
				<li><a href="#">관심채용</a></li>
			</ul>
		</aside>
		<footer> Copyright & copy </footer>

	</div>
</body>
</html>