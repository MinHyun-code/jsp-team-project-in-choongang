<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/post_style.css" type="text/css">
<script type="text/javascript"></script>
<!-- <script> -->
<!-- //     function openPopup(){ -->
<!-- //         window.open("m_writePro.do", "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=700, height=700, left=0, top=0" ); -->
<!-- //     } -->
<!-- </script> -->
</head>
<body>
<!--  -->
<form action="m_writePro.do?board_no=${board_no }&pageNum=${pageNum }" method="post" enctype="multipart/form-data" >
	 
	<div id="mark">
		<a href="list.do"><img src="images/mark.png"></a> 
	</div>
	
	<div id= "menu">
		<ul>
			<li><a href="list.do">커뮤니티</a></li>
			<li><a href="matching.do">매칭</a></li>
			<li><a href="list.do">장터</a></li>
			<li><a href="list.do">베스트여행지</a></li>
			<li><a href="list.do">통합검색</a></li>
		</ul>
	</div>
	
	<div id="login">
		<a href="login.do"><input type="button" id="log_but" value="로그인"></a>
	</div>
		
	<div id="post_title">
		<a href='matching.do'>매칭 게시판</a>
	</div>
	
	<div class="content">
	
		<table class="select_st">
			<tr><td><br><input type="hidden" name="board_no" value="${board_no}">
						<input type="hidden" name="post_no" value="${post_no}">
						<input type="hidden" name="member_id" value="ex0010">
						<input type="hidden" name="nickname" value="${nickname }">
						<input type="hidden" name="ref" value="${ref }">
						<input type="hidden" name="re_level" value="${re_level}">
						<input type="hidden" name="re_step"  value="${re_step}"></td></tr>
			<tr>
				<th>장소<th>
			</tr>
			<tr>
				<td>
					<select name="cate_place">
						<option value="1" selected="selected">바다</option>
						<option value="2">산</option>
						<option value="3">도심</option>
					</select>
				</td>
			</tr>
			<tr><td><br></td></tr>
			<tr>
				<th>목적<th>
			</tr>
			<tr>
				<td>
					<select name="cate_goal">
						<option value="1" selected="selected">힐링</option>
						<option value="2">관광</option>
						<option value="3">맛집</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>교통<th>
			</tr>
			<tr>
				<td>
					<select name="cate_ride">
						<option value="1" selected="selected">도보</option>
						<option value="2">자동차</option>
						<option value="3">기차</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>인원모집<th>
			</tr>
			<tr>
				<td>
					<select name="cate_with">
						<option value="1" selected="selected">카풀</option>
						<option value="2">가이드</option>
						<option value="3">친구</option>
					</select>
				</td>
			</tr>
			<tr><td><br></td></tr>
			<tr>
				<td colspan="11">
					<input type="text" name="post_title" required="required" size="122px">
				</td>
			</tr>
		</table>
		<div>
			<table class="post_st">
				<tr>
					<th><input type = "file" name = "attach"></th>
				</tr>
				<tr>
					<td><textarea rows="30" cols="125" name="content" required="required"></textarea></td></tr>
				<tr>
					<td><input type="password" name="passwd" required="required"></td></tr>
				<tr>
					<td class="table_line">
							<input type="submit" value="확인">
				    	<input type="reset" value="다시작성">
				    </td>
			    </tr>
			</table>
		</div>
	</div>
</form>
</body>
</html>