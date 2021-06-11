<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/*         #r_pic { */
/*             width: 300px; */
/*             margin-top: 50px; */
/*         } */
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resume/resumeAdd.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	var sel_file;
	$(document).ready(function() {
		$("#r_pic").on("change", handleImgFileSelect);
	});

	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}

			sel_file = f;

			var reader = new FileReader();
			reader.onload = function(e) {
				$("#resume_pic").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}

	function popup1() {
		var url = "${pageContext.request.contextPath}/resumePopUp1.do";
		var name = "popup1";
		var option = "width = 600, height = 500, top = 100, left = 200, location = no"
		window.open(url, name, option);
	}

	function popup2() {
		var url = "${pageContext.request.contextPath}/resumePopUp2.do";
		var name = "popup2";
		var option = "width = 500, height = 400, top = 100, left = 200, location = no"
		window.open(url, name, option);
	}

	function popup3() {
		var url = "${pageContext.request.contextPath}/resumePopUp3.do";
		var name = "popup3";
		var option = "width = 500, height = 400, top = 100, left = 200, location = no"
		window.open(url, name, option);
	}
	
	function popup4() {
		var url = "${pageContext.request.contextPath}/resume/resumePopUp4.jsp";
		var name = "popup4";
		var option = "width = 500, height = 400, top = 100, left = 200, location = no"
		window.open(url, name, option);
	}

	function fncAddRow(ary) {
		var tableID = document.getElementById('intro_tb');
		var newRow = tableID.insertRow();

		var colsCnt = 1;

		for (var i = 0; i < colsCnt; i++) {
			var colnum = 0;
			try {
				colnum = tableID.col.length;
			} catch (e) {
				colnum = 0;
			}

			var newCell = newRow.insertCell();
			newCell.align = 'center';
			var rownum = tableID.rows.length;
			newCell.innerHTML = ary[i];
		}
	}

	function fncAddRow2(ary) {
		var tableID = document.getElementById('licence_tb');
		var newRow = tableID.insertRow();

		var colsCnt = 3;

		for (var i = 0; i < colsCnt; i++) {
			var colnum = 0;
			try {
				colnum = tableID.col.length;
			} catch (e) {
				colnum = 0;
			}

			var newCell = newRow.insertCell();
			newCell.align = 'center';
			var rownum = tableID.rows.length;
			newCell.innerHTML = ary[i];
		}
	}

	function fncAddRow3(ary) {
		var tableID = document.getElementById('edu_tb');
		var newRow = tableID.insertRow();

		var colsCnt = 4;

		for (var i = 0; i < colsCnt; i++) {
			var colnum = 0;
			try {
				colnum = tableID.col.length;
			} catch (e) {
				colnum = 0;
			}

			var newCell = newRow.insertCell();
			newCell.align = 'center';
			var rownum = tableID.rows.length;
			newCell.innerHTML = ary[i];
		}
	}
	
	function fncAddRow4(ary) {
		var tableID = document.getElementById('career_tb');
		var newRow = tableID.insertRow();

		var colsCnt = 6;

		for (var i = 0; i < colsCnt; i++) {
			var colnum = 0;
			try {
				colnum = tableID.col.length;
			} catch (e) {
				colnum = 0;
			}

			var newCell = newRow.insertCell();
			newCell.align = 'center';
			var rownum = tableID.rows.length;
			newCell.innerHTML = ary[i];
		}
	}
</script>
</head>
<body>
	<div id="page">
		<header>
			<div>
				<h1
					onclick="location.href='${pageContext.request.contextPath}/main.jsp'"
					style="cursor: pointer; text-align: center; font-size: 130px; color: #002266; margin-bottom: 40px;">다JOB아</h1>
			</div>
			<nav>
				<a href="#">채용공고</a> <a href="searchHire.jsp">회사검색</a> <a
					href="${pageContext.request.contextPath}/communityList.do">커뮤니티</a>
				<a href="mypage.jsp" style="background-color: #235594">마이페이지</a>
				<c:if test="${sessionID != null }">
					<a href="logout.do">로그아웃</a>
				</c:if>
			</nav>
		</header>
		<div id="container">
			<section class="plus">
				<form id="inform"
					action="${pageContext.request.contextPath}/resumePic.do"
					method="post" enctype="multipart/form-data">
					<article id="point">
						<h2>이력서 추가</h2>
					</article>
					<article class="tb_point">
						<p>기본정보</p>
					</article>
					<table class="tb">
						<tr style="display: none;">
							<td>번호</td>
							<td><input type="text" name="r_num" value="${resume.r_num }"></td>
						</tr>
						<tr style="display: none;">
							<td>아이디</td>
							<td><input type="text" name="m_id" value="${resume.m_id }"></td>
						</tr>
						<tr>
							<td id="td1">제목</td>
							<td id="td2"><input type="text" class="input"
								style="width: 500px" name="r_title" value="${resume.r_title }"></td>
						</tr>
						<tr>
							<td id="td1">이름</td>
							<td id="td2"><input type="text" class="input" disabled
								placeholder="이름" name="m_name" value="${member.m_name }"></td>
							<td id="td3" rowspan="2"><input type="image" id="resume_pic"
								src="${resume.r_pic }" style="height: 200px; width: 160px;"></td>
						</tr>
						<tr>
							<td id="td1">사진</td>
							<td id="td2"><input type="file" name="r_pic" id="r_pic"></td>
						</tr>
						<tr>
							<td id="td1">첨부파일</td>
							<td id="td2"><input type="file" name="r_file" id="r_pic"></td>
						</tr>
						<tr>
							<td id="td1">생년월일</td>
							<td id="td2"><input type="text" class="input" disabled
								placeholder="생년월일" name="m_birth" value="${member.m_birth }"></td>
							<c:if test="${member.m_gender == 'female' }">
								<td id="td3" class="select"><input type="radio" id="select"
									name="shop"><label for="select">남자</label> <input
									type="radio" id="select2" name="shop" checked="checked"><label
									for="select2">여자</label></td>
							</c:if>
							<c:if test="${member.m_gender == 'male' }">
								<td id="td3" class="select"><input type="radio" id="select"
									name="shop" checked="checked"><label for="select">남자</label>
									<input type="radio" id="select2" name="shop"><label
									for="select2">여자</label></td>
							</c:if>
						</tr>
						<tr>
							<td id="td1">이메일</td>
							<td id="td2"><input type="text" class="input" disabled
								placeholder="이메일" name="m_email" value="${member.m_email }"></td>
							<td id="td3" style="width: 700px"></td>
						</tr>
						<tr>
							<td id="td1">휴대폰</td>
							<td id="td2"><input type="text" class="input" disabled
								placeholder="휴대폰" name="m_phone" value="${member.m_phone }"></td>
						</tr>
						<tr>
							<td id="td1">주소</td>
							<td id="td2"><input type="text" class="input" disabled
								placeholder="주소" name="m_addr" value="${member.m_addr }"></td>
						</tr>
					</table>
					<article class="tb_point">
						<p>학력사항 								<button type="button" style="float: right;"
									onclick="javascript:popup3()" class="btn">추가</button></p>
					</article>
					<table class="tb" id="edu_tb">
						<tr>
							<td style="text-align: center; font-size: 30px;"> 
									학교명
								</td>
								<td style="text-align: center; font-size: 30px;"> 
									전공
								</td>	
								<td style="text-align: center; font-size: 30px;"> 
									입학날짜
								</td>	
								<td style="text-align: center; font-size: 30px;"> 
									졸업날짜
								</td>
						</tr>
					</table>
					<article class="tb_point">
						<p>경력사항 <button type="button" style="float: right;"
										onclick="javascript:popup4()" class="btn">추가</button></p>
					</article>
						<table class="tb" id="career_tb">
							<tr>
								<td style="text-align: center; font-size: 30px;"> 
									회사명
								</td>
								<td style="text-align: center; font-size: 30px;"> 
									담당업무
								</td>
								<td style="text-align: center; font-size: 30px;"> 
									직급
								</td>
								<td style="text-align: center; font-size: 30px;"> 
									연봉
								</td>
								<td style="text-align: center; font-size: 30px;"> 
									입사날짜
								</td>
								<td style="text-align: center; font-size: 30px;"> 
									퇴사날짜
								</td>
							</tr>
						</table>
					<article class="tb_point">
						<p>자격증<button type="button" style="float: right;"
									onclick="javascript:popup2()" class="btn">추가</button> </p>
					</article>
					<table class="tb" id="licence_tb">
						<tr>
								<td style="text-align: center; font-size: 30px;"> 
									자격증명
								</td>
								<td style="text-align: center; font-size: 30px;"> 
									관리기관
								</td>	
								<td style="text-align: center; font-size: 30px;"> 
									취득날짜
								</td>	
						</tr>
					</table>
					<article class="tb_point">
						<p>자기소개서 <button type="button" style="float: right;"
									onclick="javascript:popup1()" class="btn">추가</button> </p>
					</article>
					<table class="tb" id="intro_tb">
						<tr>
								<td style="text-align: center; font-size: 30px;"> 
									자소서 제목
								</td>
						</tr>
					</table>
					<input type="hidden" name="list_si_num" value=""> 
					<input type="hidden" name="list_lc_num" value=""> 
					<input type="hidden" name="list_edu_num" value=""> 
					<input type="hidden" name="list_edutype_num" value=""> 
					<input type="hidden" name="list_myedu_sdate" value=""> 
					<input type="hidden" name="list_myedu_edate" value="">
					
					<input type="hidden" name="list_career_cr_name" value=""> 
					<input type="hidden" name="list_career_cr_grade" value=""> 
					<input type="hidden" name="list_career_cr_salary" value="">
					<input type="hidden" name="list_career_cr_job" value=""> 
					<input type="hidden" name="list_career_cr_sdate" value=""> 
					<input type="hidden" name="list_career_cr_edate" value="">
					<input type="submit" value="저장" style="float: left;" class="btn	">
				</form>
			</section>
		</div>
		<footer> Copyright & copy </footer>
	</div>
</body>
</html>