<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%
	String context = request.getContextPath();
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/post_style.css" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

function recomment_btn(){
	
	alert('recomment_btn Start...');
	
	var board_no_text = ${postmember.board_no}
	var post_no_text = ${postmember.post_no}
// 	var post_title_text = ${postmember.post_title}
//  문자열 
	var post_title_text = '[답변]' + $('#re_title').val();
	var ref_text = ${postmember.ref}  //숫자형만 가능
	var re_step_text = ${postmember.re_step}
	var re_level_text = ${postmember.re_level}
// 	//현재 아이디 적용 안되있어서 임시로 지정
	var member_id_text = "ex0010";
	var passwd_text = $("#recomment_pw").val();
	var recomment_text = $("#recomment").val();
	
	alert('recomment_btn board_no_text->'+board_no_text);
	alert('recomment_btn post_no_text->'+post_no_text);
	alert('recomment_btn post_title_text->'+post_title_text);
	alert('recomment_btn ref_text->'+ref_text);
	alert('recomment_btn re_step_text->'+re_step_text);
	alert('recomment_btn re_level_text->'+re_level_text);
	alert('recomment_btn member_id_text->'+member_id_text);
	alert('recomment_btn passwd_text_text->'+passwd_text);
	alert('recomment_btn recomment_text->'+recomment_text);

	$.ajax({
		url: "<%=context%>/ajax_m_recomment.do",
		data: {
			board_no : board_no_text,
			post_no : post_no_text,
			post_title : post_title_text,
			ref : ref_text,
			re_step : re_step_text,
			re_level : re_level_text,
			member_id : member_id_text,
			passwd : passwd_text,
			content : recomment_text
		},
		dataType:'text',
		success:function(data){
// 			console.log("댓글작성 성공");
// 			alert("댓글작성 ajax Data"+data);
// 			$('#deptName').val(data);
// 			$('#deptName').html(data);
			location.reload();
		}
	});	

}

function re_recomment_btn(){
	alert('re_recomment_btn Start...');
	
	var board_no_text = ${postmember.board_no}
	var post_no_text = ${postmember.post_no}
//  문자열 
	var post_title_text = '[대댓글]' + $('#re_re_title').val();
	var ref_text = ${postmember.ref}  //숫자형만 가능
//	대댓글 디자인 구현 안되어 있어서 임시로 re_step 번호 1로 고정함
	var re_step_text = 1
	var re_level_text = ${postmember.re_level}
// 	//현재 아이디 적용 안되있어서 임시로 지정
	var member_id_text = "ex0010";
	var passwd_text = $("#re_recomment_pw").val();
	var recomment_text = $("#re_recomment").val();
	
	alert('recomment_btn board_no_text->'+board_no_text);
	alert('recomment_btn post_no_text->'+post_no_text);
	alert('recomment_btn post_title_text->'+post_title_text);
	alert('recomment_btn ref_text->'+ref_text);
	alert('recomment_btn re_step_text->'+re_step_text);
	alert('recomment_btn re_level_text->'+re_level_text);
	alert('recomment_btn member_id_text->'+member_id_text);
	alert('recomment_btn passwd_text_text->'+passwd_text);
	alert('recomment_btn recomment_text->'+recomment_text);

	$.ajax({
		url: "<%=context%>/ajax_m_re_recomment.do",
		data: {
			board_no : board_no_text,
			post_no : post_no_text,
			post_title : post_title_text,
			ref : ref_text,
			re_step : re_step_text,
			re_level : re_level_text,
			member_id : member_id_text,
			passwd : passwd_text,
			content : recomment_text
		},
		dataType:'text',
		success:function(data){
			location.reload();
		}
	});	

}

</script>

</head>
<body>
	<input type="hidden">
	<div id="mark">
		<a href="list.do"><img src="images/mark.png"></a> 
	</div>
	
	<div id= "menu">
		<ul>
			<li><a href="info_travel.do">여행지 정보 제공</a></li>
			<li><a href="matching.do">매칭</a></li>
			<li><a href="market.do">장터</a></li>
			<li><a href="best_info_travel.do">베스트여행지</a></li>
			<li><a href="search.do">통합검색</a></li>
		</ul>
	</div>
	
	<div id="login">
		<a href="login.do"><input type="button" id="log_but" value="로그인"></a>
	</div>
		
	<div id="post_title">
			<a href='matching.do'>매칭 게시판</a>
	</div>
	
	<div class="content">
		<table class="post_st">
			<tr>
				<td colspan="10">
					<br>
				</td>
			</tr>
			<tr>
				<td width="80%">${postmember.post_title}</td>
				<td>조회수 : ${postmember.hits}</td>
				<td>추천수 : ${postmember.recommend}</td>
			</tr>
			<tr>
				<td colspan="10">
					<c:if test="${postmember.attach == null }">
						<img src="images/개.png">
					</c:if>
					<c:if test="${postmember.attach != null }">
						<img src="<%=context %>/${upLoadFilename}">
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="10" height="70">${postmember.content}</td>
			</tr> 
			<tr><td colspan="10">
				<form id="m_recommendForm">
					<input type="button" value="추천" onclick="recommend(${postmember.board_no}&${postmember.post_no }">			
				</form>
			<a href="#none"><input type="button" value="스크랩"></a>
			<a href="#none"><input type="button" value="수정"></a>
			<a href="#none"><input type="button" value="삭제"></a>
			</td></tr>
		</table>
		
		<table>
			<tr>
				<td><h3>댓글</h3></td>
				<td>( ${recomCnt } )</td>
			</tr>
		</table>
		
<!-- 		댓글 작성 -->
		<table class="post_st">
			<tr><td colspan="2"><br></td></tr>
			<tr>
				<td>
					<input type="hidden" id = "re_title" value="${postmember.post_title }" >
					<textarea rows="3px" cols="80px" name="content" id="recomment"></textarea>
				</td>
				<td>
					<input type="password" id="recomment_pw"><br>
					<input type="button" value="댓글 등록" onclick="recomment_btn()">
				</td>
			</tr>
			<tr><td></td></tr>
		</table>


<!-- 		댓글 작성자만 수정, 삭제 가능하게 나중에 수정 -->
		<table class="comment_st">
			<tr>
				<th>작성자</th>
				<th width="70%">댓글 내용</th>
				<th><br></th>
			</tr>
				<c:if test="${totCnt > 0 }">
					<c:forEach var="postmember" items="${list }">
						<tr>
							<td>
								<c:if test="${postmember.re_level > 0 }">
									<img src="images/re.png">
								</c:if>
								${postmember.nickname }</td>
							<td>${postmember.content}</td>
							<td>
								<a href="m_deleteForm.do"><input type="button" value="삭제"></a>
								<a href="m_update.do"><input type="button" value="수정"></a>
								<a href="m_update.do"><input type="button" value="답글" onclick="show_rere()"></a>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${totCnt == 0}">
					<td>데이터 없음</td>
				</c:if>
		</table>
		<table class="comment_st">
			<tr>
				<td>
					<input type="hidden" value="${postmember.re_step }">
					<input type="hidden" id = "re_re_title" value="${postmember.post_title }" >
					<textarea rows="3px" cols="80px" name="content" id="re_recomment"></textarea>
				</td>
				<td>
					<input type="password" id="re_recomment_pw"><br>
					<input type="button" value="대댓글 등록" onclick="re_recomment_btn()">
				</td>
			</tr>
		</table>

	</div>

</body>
</html>