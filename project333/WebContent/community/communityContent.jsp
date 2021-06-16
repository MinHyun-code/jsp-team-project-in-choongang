<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>${board.subject}</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/community/css/fontello/icon-level-up/css/fontello.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/community/css/community.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/community/css/communityContent.css">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/community/js/community.js"></script>
<script src="${pageContext.request.contextPath}/community/js/communityContent.js"></script>
</head>

<body>
	<div id="page">
		<header>
			<div>
				<h1 onclick="location.href='${pageContext.request.contextPath}/main.jsp'" style="cursor: pointer; text-align: center; font-size: 130px; color: #002266; margin-bottom: 40px;">다JOB아</h1>
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
		</header>


		<div id="container">
			<section id="point">
				<article class="pt pt1">
					<table class="pt_tb pt_tb_board">
						<tr>
							<td id="td_subject" colspan="100">
								<h1>${board.subject}</h1>
							</td>
						</tr>
						<tr>
							<td id="td_m_id">${board.m_id }</td>
							<td id="td_reg_date" colspan="100">
								<fmt:formatDate value="${board.reg_date}" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
						</tr>
						<tr>
							<td id="td_hr" colspan="100">
								<hr>
							</td>
						</tr>
						<c:if test="${not empty board.file_name}">
							<tr>
								<td id="td_board_image" colspan="100">
									<input id="board_image" type="image" name="file_pic" src="${board.file_name }">
								</td>
							</tr>
						</c:if>
						<tr>
							<td class="community_content" colspan="100">${board.content}</td>
						</tr>
						<tr>
							<td id="board_td_tags">${board.tags}</td>
						</tr>
						<tr>
							<!-- only for writer-->
							<c:if test="${sessionID == board.m_id}">
								<td id="td_content_my_btn">
									<form action="${pageContext.request.contextPath}/communityDeletePro.do" method="post">
										<input type="hidden" name="bd_code" value="${board.bd_code}">
										<input type="hidden" name="bd_num" value="${board.bd_num}">
										<input type="hidden" name="m_id" value="${board.m_id}">
										<input type="hidden" name="pageNum" value="${pageNum}">
										<button type="submit" class="btn td_btn btn_comment_delete">삭제</button>
									</form>
									<form action="${pageContext.request.contextPath}/communityEditForm.do" method="post">
										<input type="hidden" name="bd_code" value="${board.bd_code}">
										<input type="hidden" name="bd_num" value="${board.bd_num}">
										<input type="hidden" name="m_id" value="${sessionID}">
										<input type="hidden" name="pageNum" value="${pageNum}">
										<button type="submit" class="btn td_btn">수정</button>
									</form>
								</td>
							</c:if>
						</tr>
					</table>


					<!-- answer -->
					<c:if test="${board.bd_code==2}">
						<form method="post">
							<table class="pt_tb">
								<tr>
									<td>
										<textarea id="content" name="content" placeholder="여러분의 지혜로운 조언을 알려주세요~!" rows="15" class="form_box form_box_answer"></textarea>
									</td>
								</tr>
								<tr>
									<td class="td_write_answer">
										<input type="submit" value="답변등록" class="btn btn_write_answer" formaction="${pageContext.request.contextPath}/communityAnswerWrite.do">
									</td>
								</tr>

							</table>
							<table class="pt_tb pt_tb_answer">
								<tr>
									<td id="comment">
										<h1>
											답변 <span class="show_size">${answerList.size()}</span>건
										</h1>
									</td>
								</tr>
								<tr>
									<td id="td_hr" colspan="100">
										<hr>
									</td>
								</tr>

								<input type="hidden" name="bd_code" value="${board.bd_code}">
								<input type="hidden" name="bd_num" value="${board.bd_num}">
								<input type="hidden" name="target_bd_num" value="${board.bd_num}">
								<input type="hidden" name="m_id" value="${sessionID}">
								<input type="hidden" name="pageNum" value="${pageNum}">
								<input type="hidden" name="subject" value="[답변]">
								</form>
								<c:forEach var="answer" items="${answerList }">
									<form method="post">
										<input type="hidden" name="answer_bd_code" value="${answer.bd_code}">
										<input type="hidden" name="answer_bd_num" value="${answer.bd_num}">
										<input type="hidden" name="bd_code" value="${board.bd_code}">
										<input type="hidden" name="bd_num" value="${board.bd_num}">
										<input type="hidden" name="pageNum" value="${pageNum}">
										<tr class="tr_answer">
											<td class="td_answer_content">${answer.content}</td>
											<td class="td_answer_m_id">${answer.m_id}</td>
											<td class="td_answer_reg_date">
												<fmt:formatDate value="${answer.reg_date}" pattern="yyyy-MM-dd HH:mm:ss" />
											</td>
											<c:if test="${sessionID == answer.m_id}">
												<td>
													<input type="submit" value="삭제" class="btn btn_comment_delete" formaction="${pageContext.request.contextPath}/communityAnswerDelete.do">
												</td>
											</c:if>
										</tr>
									</form>
								</c:forEach>
								</c:if>
							</table>

							<!-- comment -->
							<table class="pt_tb pt_tb_comment">
								<tr>
									<td id="comment">
										<h1>
											댓글 <span class="show_size">${commentList.size()}</span>건
										</h1>
									</td>
								</tr>
								<tr>
									<td id="td_hr" colspan="100">
										<hr>
									</td>
								</tr>
								<c:forEach var="comment" items="${commentList}">
									<form method="post">
										<input type="hidden" name="bd_code" value="${comment.bd_code}">
										<input type="hidden" name="bd_num" value="${comment.bd_num}">
										<input type="hidden" name="pageNum" value="${pageNum}">
										<input type="hidden" name="target_bd_cm_num" value="${comment.bd_cm_num}">
										<input type="hidden" name="target_ref" value="${comment.ref}">
										<input type="hidden" name="target_re_step" value="${comment.re_step}">
										<input type="hidden" name="target_re_level" value="${comment.re_level}">
										<tr class="tr_comment">
											<td class="td_comment_content">
												<c:forEach var="i" begin="0" end="${comment.re_level-1}">
												</c:forEach>
												<c:if test="${comment.re_level>1 }">
													<span class="comment_reply_prefix"><i class="icon-level-down"></i><i class="icon-level-up"></i></span>
												</c:if>
												${comment.content}
											</td>
											<td class="td_comment_m_id">${comment.m_id}</td>
											<td class="td_comment_reg_date">
												<fmt:formatDate value="${comment.reg_date}" pattern="yyyy-MM-dd HH:mm:ss" />
											</td>
											<c:if test="${sessionID == comment.m_id}">
												<td>
													<input type="submit" value="삭제" class="btn btn_comment_delete" formaction="${pageContext.request.contextPath}/communityCommentDelete.do">
												</td>
											</c:if>

										</tr>
										<tr>
											<td class="td_comment_reply_content">
												<c:forEach var="i" begin="0" end="${comment.re_level}"></c:forEach>
												<input name="content" class="form_box comment_reply_box comment_reply_box_${comment.bd_cm_num}">
												<c:if test="${comment.re_level == 1 }">
													<input type="button" value="답글쓰기" class="btn btn_reply btn_reply_${comment.bd_cm_num}" onclick="funcReplyBox(${comment.bd_cm_num}, '300px')"></input>
												</c:if>
												<input type="submit" value="등록" class="btn btn_reply  btn_reply2 btn_reply2_${comment.bd_cm_num}" formaction="${pageContext.request.contextPath}/communityCommentReply.do">
											</td>
											<td></td>
										</tr>
									</form>
								</c:forEach>

								<form method="post">
									<input type="hidden" name="bd_code" value="${board.bd_code}">
									<input type="hidden" name="bd_num" value="${board.bd_num}">
									<input type="hidden" name="pageNum" value="${pageNum}">
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>
											<input name="content" class="form_box content_comment_write">
										</td>
									</tr>
									<tr>
										<td>
											<input type="submit" value="댓글등록" class="btn btn_comment_write" formaction="${pageContext.request.contextPath}/communityCommentWrite.do">
										</td>
									</tr>
								</form>
							</table>
				</article>
			</section>
			<section id="">
				<article id=""></article>
				<article></article>
			</section>
			<section id="">
				<article></article>
			</section>
		</div>


		<aside id="right">
			<ul>
				<li id="asideMenuCommunity"><a href="#">커뮤니티</a></li>
				<li id="asideMenuWrite"><a href="${pageContext.request.contextPath}/communityWriteForm.do">글 작성하기</a></li>
				<li id="asideMenuInfo"><a href="#">정보 공유</a></li>
				<li id="asideMenuToktok"><a href="#">취준 톡톡</a></li>
				<li id="asideMenuMyTok"><a href="#">내 질문 보기</a></li>
			</ul>
		</aside>
		<footer> Copyright & copy </footer>

	</div>
</body>

</html>