<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/post_style.css" type="text/css">
</head>
<body>
	<div id="mark">
		<a href="list.do"><img src="images/mark.png"></a>
	</div>

	<div id="menu">
		<ul>
			<li><a href="list.do">커뮤니티</a></li>
			<li><a href="list.do">매칭</a></li>
			<li><a href="list.do">장터</a></li>
			<li><a href="list.do">베스트여행지</a></li>
			<li><a href="list.do">통합검색</a></li>
		</ul>
	</div>

	<div id="login">
		<a href="list.do"><input type="button" id="log_but" value="로그인"></a>
	</div>

	<div id="post_title">
		<a href='list.do'>통합검색</a>
	</div>

	<form action="searchPro.do">
		<div class="content">
			<div>
				<table class="select_st">
					<tr>
						<td><br></td>
					</tr>
					<tr><th>장소<th>
						<td>
							<select name="cate_place">
								<option value="1" selected="selected">바다</option>
								<option value="2">산</option>
								<option value="3">도심</option>
							</select>
						</td>
					</tr>
					<tr><th>목적<th>
						<td>
							<select name="cate_goal">
								<option value="1" selected="selected">힐링</option>
								<option value="2">관광</option>
								<option value="3">맛집</option>
							</select>
						</td>
					</tr>
					<tr><th>교통<th>
						<td>
							<select name="cate_ride">
								<option value="1" selected="selected">도보</option>
								<option value="2">자동차</option>
								<option value="3">기차</option>
							</select>
						</td>
					</tr>
					<tr><th>인원모집<th>
						<td>
							<select name="cate_with">
								<option value="1" selected="selected">카풀</option>
								<option value="2">가이드</option>
								<option value="3">친구</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
					<tr>
						<th>게시판</th>
						<td>
							<select name="kind">
								<option value="1" selected="selected">매칭</option>
								<option value="2">커뮤니티</option>
								<option value="3">장터</option>
							</select>
						</td>
						<td></td>
						<td><input type="text" name="search_text"><td>
						<td><input type="submit" name="" id="serch_but" value="검색"><td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</body>
</html>