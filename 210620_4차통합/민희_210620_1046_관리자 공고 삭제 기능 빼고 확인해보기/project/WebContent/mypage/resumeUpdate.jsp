<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/mypage/resumeUpdate.css">
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
                if(!f.type.match("image.*")) {
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
					href="${pageContext.request.contextPath}/communityList.do">커뮤니티</a> <a href="mypage.jsp"
					style="background-color: #235594">마이페이지</a>
				<c:if test="${sessionID != null }">
					<a href="logout.do">로그아웃</a>
				</c:if>
			</nav>
		</header>
		<div id="container">
			<section class="plus">
				<form id="inform"
					action="${pageContext.request.contextPath}/resumePic.do"
					method="post"
					enctype="multipart/form-data">
					<article id="point">
						<h2>이력서 수정</h2>
					</article>

					<table id="resume">
						<tr style="display: none;">
							<td>번호</td>
							<td><input type="text" name="r_num" value="${resume.r_num }"></td>
						</tr>
						<tr style="display: none;">
							<td>아이디</td>
							<td><input type="text" name="m_id" value="${resume.m_id }"></td>
						</tr>
						<tr>
							<td id="td1" style="width: 10%; background-color: #EAEAEA;">제목</td>
							<td style="background-color: #EAEAEA;"><input type="text"
								style="width: 500px" name="r_title" value="${resume.r_title }"></td>
							<td id="td1" style="width: 10%; background-color: #EAEAEA;">작성일자</td>
							<td style="background-color: #EAEAEA;"><input type="text"
								style="width: 200px" disabled placeholder="date" name="r_date"
								value="${resume.r_date }"></td>
						</tr>
						<tr>
							<td rowspan="3" id="td1"
								style="width: 10%; background-color: #EAEAEA;">사진</td>
							<td rowspan="3" style="background-color: #EAEAEA;"><img
								alt="사진" id="resume_pic"
								src="${pageContext.request.contextPath}/${resume.r_pic }"
								style="height: 200px; width: 170px; margin-left: 80px; margin-top: 30px">
								<input type="file" name="r_pic" id="r_pic" style="width: 30%;"></td>
							<td id="td1" style="width: 10%; background-color: #EAEAEA;">이름</td>
							<td style="background-color: #EAEAEA;"><input type="text"
								style="width: 200px" disabled placeholder="date" name="m_name"
								value="${member.m_name }"></td>
						</tr>
						<tr>
							<td id="td1" style="width: 10%; background-color: #EAEAEA;">생년월일</td>
							<td style="background-color: #EAEAEA;"><input type="text"
								style="width: 200px" disabled placeholder="date" name="m_birth"
								value="${member.m_birth }"></td>
						</tr>
						<tr>
							<td id="td1" style="width: 10%; background-color: #EAEAEA;">전화번호</td>
							<td style="background-color: #EAEAEA;"><input type="text"
								style="width: 200px;" disabled placeholder="date" name="m_phone"
								value="${member.m_phone }"></td>
						</tr>
						<tr>
							<td id="td1" style="width: 10%; background-color: #EAEAEA;">파일</td>
							<td colspan="3" style="background-color: #EAEAEA;"><input
								type="text"
								style="width: 700px; margin-top: 20px; margin-left: 20px"
								value="${resume.r_file }"> <input type="file"
								name="r_file" style="width: 30%;"></td>
						</tr>
						<tr>
							<td id="td1" style="width: 10%; background-color: #EAEAEA;">이메일</td>
							<td colspan="3" style="background-color: #EAEAEA;"><input
								type="text" style="width: 200px;" disabled placeholder="date"
								name="m_email" value="${member.m_email }"></td>
						</tr>
						<tr>
							<td id="td1" style="width: 10%; background-color: #EAEAEA;">주소</td>
							<td colspan="3" style="background-color: #EAEAEA;"><input
								type="text" style="width: 700px" disabled placeholder="date"
								name="m_addr" value="${member.m_addr }"></td>
						</tr>
						<tr>
							<td id="td1" style="width: 10%; background-color: #EAEAEA;">자기소개서</td>
							<td colspan="2" style="background-color: #EAEAEA;"><input
								type="text" style="width: 500px"></td>
							<td style="background-color: #EAEAEA;"></td>
						</tr>
						<tr>
							<td id="td1" style="width: 10%; background-color: #EAEAEA;">전화번호</td>
							<td style="background-color: #EAEAEA;"><input type="text"
								style="width: 200px;" disabled placeholder="date" name="m_phone"
								value="${member.m_phone }"></td>
						</tr>
					</table>
					
					<input type="submit" value="저장" style="float: left;">
					<button type="button" style="float: right;"
								onclick="window.open('${pageContext.request.contextPath}/resumePopUp.do?m_id=${resume.m_id }',
								'name','resizable=no width=600 height=500');return false">추가</button>
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