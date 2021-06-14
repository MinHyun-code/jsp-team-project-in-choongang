<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정</title>
<link rel="stylesheet" href="css/post_style.css" type="text/css">
<script>
    function openPopup(){
        window.open("p_updatePro.do", "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500px, height=300px, left=500px, top=500px" );
    }
</script>
</head><body>
<form action="p_updatePro.do" method="post">
		<input type="hidden" name="num" value="${board.num}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<div id="mark">
			<a href="matching.do"><img src="images/mark.png"></a> 
		</div>
		
		<div id= "menu">
			<ul>
				<li><a href="matching.do">커뮤니티</a></li>
				<li><a href="matching.do">매칭</a></li>
				<li><a href="matching.do">장터</a></li>
				<li><a href="matching.do">베스트여행지</a></li>
				<li><a href="matching.do">통합검색</a></li>
			</ul>
		</div>
		
		<div id="login">
			<a href="list.do"><input type="button" id="log_but" value="로그인"></a>
		</div>
			
		<div id="post_title">
			게시글 수정
		</div>
	
	<div class="content">
				<input type="hidden" name="board_no" value="${post.board_no}">
				<input type="hidden" name="post_no" value="${post.post_no }">
				<input type="hidden" name="member_id" value="${member_id}">
				
				<table class="post_st">
					<tr><td><br></td></tr>
					<tr>
						<td>
							<input type="file" value="${post.attach }">
						</td>
					</tr>
					<tr>
						<td>
							제목 : <input type="text" size="116px" name="post_title" required="required" value="${post.post_title}" class="left">
						</td>
					</tr>
					<tr>
						<td>
							<textarea rows="30" cols="125" name="content" required="required" class="left">
							${board.content}
							</textarea>
						</td>
					</tr>
					<tr>
						<td>
							비밀번호 : <input type="password" name="passwd" required="required" value="${post.passwd}">
							<a href="#none" onclick="openPopup()"><input type="submit" value="수정완료" style="right: 0px;"></a>
						</td>
					</tr>
				</table>
		
	</div>
</form>
</body>
</html>