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
	href="${pageContext.request.contextPath}/mypage/resumeAdd.css">
<script type="text/javascript" src="./js/jquery.js"></script>
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


	function fncAddRow(ary)
	{
	    var tableID = document.getElementById('resume');
	    var newRow    = tableID.insertRow(10);

	    var colsCnt    = 2;

	    for( var i=0; i<colsCnt; i++ )
	    {
	        var colnum    = 0;
	        try
	        {
	            colnum    = tableID.col.length;
	        }
	        catch (e)
	        {
	            colnum = 0;
	        }

	        var newCell      = newRow.insertCell();
	        newCell.align    = 'center';
	        var    rownum    = tableID.rows.length;
	        newCell.innerHTML = ary[i];
	    }
	}
	
	function fncAddRow2(ary)
	{
	    var tableID = document.getElementById('resume');
	    var newRow    = tableID.insertRow();

	    var colsCnt    = 2;

	    for( var i=0; i<colsCnt; i++ )
	    {
	        var colnum    = 0;
	        try
	        {
	            colnum    = tableID.col.length;
	        }
	        catch (e)
	        {
	            colnum = 0;
	        }

	        var newCell      = newRow.insertCell();
	        newCell.align    = 'center';
	        var    rownum    = tableID.rows.length;
	        newCell.innerHTML = ary[i];
	    }
	}
	
	function fncAddRow3(ary)
	{
	    var tableID = document.getElementById('resume');
	    var newRow    = tableID.insertRow();

	    var colsCnt    = 4;

	    for( var i=0; i<colsCnt; i++ )
	    {
	        var colnum    = 0;
	        try
	        {
	            colnum    = tableID.col.length;
	        }
	        catch (e)
	        {
	            colnum = 0;
	        }

	        var newCell      = newRow.insertCell();
	        newCell.align    = 'center';
	        var    rownum    = tableID.rows.length;
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

					<table id="resume" style="background-color: #EAEAEA; border: 1;">
						<tr style="display: none;">
							<td>번호</td>
							<td><input type="text" name="r_num" value="${resume.r_num }"></td>
						</tr>
						<tr style="display: none;">
							<td>아이디</td>
							<td><input type="text" name="m_id" value="${resume.m_id }"></td>
						</tr>
						<tr>
							<td id="td1" style="width: 10%;">제목</td>
							<td style="background-color: #EAEAEA;"><input type="text"
								style="width: 500px" name="r_title" value="${resume.r_title }"></td>
							<td id="td1" style="width: 10%;">작성일자</td>
							<td><input type="text" style="width: 200px" disabled
								placeholder="date" name="r_date" value="${resume.r_date }"></td>
						</tr>
						<tr>
							<td rowspan="3" id="td1" style="width: 10%;">사진</td>
							<td rowspan="3"><img alt="사진" id="resume_pic"
								src="${resume.r_pic }"
								style="height: 200px; width: 170px; margin-left: 80px; margin-top: 30px">
								<input type="file" name="r_pic" id="r_pic" style="width: 30%;"></td>
							<td id="td1" style="width: 10%;">이름</td>
							<td><input type="text" style="width: 200px" disabled
								placeholder="date" name="m_name" value="${member.m_name }"></td>
						</tr>
						<tr>
							<td id="td1" style="width: 10%;">생년월일</td>
							<td><input type="text" style="width: 200px" disabled
								placeholder="date" name="m_birth" value="${member.m_birth }"></td>
						</tr>
						<tr>
							<td id="td1" style="width: 10%;">전화번호</td>
							<td><input type="text" style="width: 200px;" disabled
								placeholder="date" name="m_phone" value="${member.m_phone }"></td>
						</tr>
						<tr>
							<td id="td1" style="width: 10%;">파일</td>
							<td colspan="3">
								<input type="file" name="r_file" style="width: 30%;"></td>
						</tr>
						<tr>
							<td id="td1" style="width: 10%;">이메일</td>
							<td colspan="3"><input type="text" style="width: 200px;"
								disabled placeholder="date" name="m_email"
								value="${member.m_email }"></td>
						</tr>
						<tr>
							<td id="td1" style="width: 10%;">주소</td>
							<td colspan="3"><input type="text" style="width: 700px"
								disabled placeholder="date" name="m_addr"
								value="${member.m_addr }"></td>
						</tr>
						<tr>
							<td id="td1" style="width: 10%;">자기소개서</td>
							<td colspan="2"
								style="text-align: center; font-size: 30px; width: 600px;">
								이력서에 넣을 자기소개서를 선택하세요</td>
							<td>
								<button type="button" style="float: right;"
									onclick="javascript:popup1()" class="btn">추가</button>
							</td>
						</tr>

						<tr>
							<td id="td1" style="width: 10%;">자격증</td>
							<td colspan="2"
								style="text-align: center; font-size: 30px; width: 600px;">
								이력서에 넣을 자격증을 선택하세요</td>
							<td>
								<button type="button" style="float: right;"
									onclick="javascript:popup2()"
									class="btn">추가</button>
							</td>
						</tr>
						<tr>
							<td id="td1" style="width: 10%;">학력</td>
							<td colspan="2"
								style="text-align: center; font-size: 30px; width: 600px;">
								이력서에 넣을 학교를 선택하세요</td>
							<td>
								<button type="button" style="float: right;"
									onclick="javascript:popup3()"
									class="btn">추가</button>
							</td>
						</tr>
					</table>
					<input type="hidden" name="num" value="0">
					<input type="hidden" name="num1" value="0">
					<input type="hidden" name="list_si_num" value="">
					<input type="hidden" name="list_lc_num" value="">
					<input type="hidden" name="list_edu_num" value="">
					<input type="submit" value="저장" style="float: left;" class="btn	">
				</form>
			</section>
		</div>
		<aside id="right">
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/introduceList.do">자기소개서
						관리</a></li>
				<li style="background-color: #235594"><a
					href="${pageContext.request.contextPath}/resumeList.do">이력서 관리</a></li>
				<li><a href="#">입사지원 현황</a></li>
				<li><a href="#">관심공고</a></li>
				<li><a
					href="${pageContext.request.contextPath}/mypageSelect.do">회원정보
						수정</a></li>
			</ul>
		</aside>
		<footer> Copyright & copy </footer>
	</div>
</body>
</html>