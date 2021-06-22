<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dropDown.css">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script defer src="${pageContext.request.contextPath}/mainCarousel.js"></script>
<script defer src="${pageContext.request.contextPath}/mainRecruit.js"></script>
</head>
<body>
	<div id="page">
		<header>
			<div id="re">
				<div id="top1">&nbsp;&nbsp;</div>
				<div id="top2">
					<a href="${pageContext.request.contextPath}/main.do" style="cursor: pointer; text-align: center; font-size: 130px; color: #002266; margin-bottom: 40px; text-decoration: none;">
						<b>다JOB아</b>
					</a>
				</div>
				<div id="top3">
					<div id="top3_1">
						<c:if test="${sessionID == null }">
							<a href="${pageContext.request.contextPath}/join.do" style="color: #002266;">
								<img alt="join.png" src="${pageContext.request.contextPath}/image/join.png" width="50px" height="50px"><br>JOIN
							</a>
						</c:if>
						<c:if test="${sessionID != null }">
							<a href="${pageContext.request.contextPath}/logout.do" style="color: #002266;">
								<img alt="logout.png" src="${pageContext.request.contextPath}/image/logout.png" width="50px" height="50px"><br>LOGOUT
							</a>
						</c:if>

					</div>
					<div id="top3_2">
						<c:if test="${sessionID == null }">
							<a href="${pageContext.request.contextPath}/log/login.jsp" style="color: #002266;">
								<img alt="login.png" src="${pageContext.request.contextPath}/image/login.png" width="50px" height="50px"><br>LOGIN
							</a>
						</c:if>
						<c:if test="${sessionM_TF == '1' }">
							<a href="${pageContext.request.contextPath}/mypage.do" style="color: #002266;">
								<img alt="my.png" src="${pageContext.request.contextPath}/image/my.png" width="50px" height="50px"><br>MY
							</a>
						</c:if>
					</div>
				</div>
			</div>
			<div id="nav">
				<nav>
					<ul id="main-menu">
						<li>
							<a href="${pageContext.request.contextPath}/rclist.do">채용공고</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/searchHire.do">채용검색</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/communityList.do">커뮤니티</a>
							<ul id="sub-menu">
								<li id="asideMenuCommunity">
									<a href="${pageContext.request.contextPath}/communityList.do">커뮤니티</a>
								</li>
								<li id="asideMenuWrite">
									<a href="${pageContext.request.contextPath}/communityWriteForm.do">글 작성하기</a>
								</li>
								<li id="asideMenuInfo">
									<a href="${pageContext.request.contextPath}/communityList.do?bd_code=1&pageNum=1">정보공유</a>
								</li>
								<li id="asideMenuToktok">
									<a href="${pageContext.request.contextPath}/communityList.do?bd_code=2&pageNum=1">취준톡톡</a>
								</li>
								<!-- 							<li id="asideMenuMyTok"><a href="#">내 질문 보기</a></li> -->
							</ul>
						</li>
							<c:if test="${ sessionID == 'admin' || sessionM_TF == '3' }">
								<li>
									<a href="${pageContext.request.contextPath}/adminMain.do" style="padding: 20px 50px;">관리자페이지</a>
								</li>
							</c:if>
							<c:if test="${sessionM_TF == '0' }">
								<li>
									<a href="${pageContext.request.contextPath}/hireList.do" style="padding: 20px 50px;">공고관리</a>
									<ul id="sub-menu">
									<li id="asideMenuMyTok">
											<a href="${pageContext.request.contextPath}/hireList.do" style="padding: 20px 50px;">공고관리</a>
									</li>
										<li id="asideMenuCommunity">
											<a href="${pageContext.request.contextPath}/recruit/hireAdd.jsp">공고등록</a>
									</li>
									</ul>
								</li>
						</c:if>
						<c:if test="${sessionM_TF == '1' }">
							<li>
								<a href="${pageContext.request.contextPath}/mypage.do">마이페이지</a>
								<ul id="sub-menu">
									<li id="asideMenuMyTok">
										<a href="${pageContext.request.contextPath}/mypage.do">마이페이지</a>
									</li>
									<li id="asideMenuCommunity">
										<a href="${pageContext.request.contextPath}/mypageApply.do">지원현황</a>
									</li>
									<li id="asideMenuWrite">
										<a href="${pageContext.request.contextPath}/preferList.do">관심공고</a>
									</li>
									<li id="asideMenuInfo">
										<a href="${pageContext.request.contextPath}/mypageSelect.do">회원정보 수정</a>
									</li>
									<li id="asideMenuToktok">
										<a href="${pageContext.request.contextPath}/resumeList.do">이력서 관리</a>
									</li>
									<li id="asideMenuMyTok">
										<a href="${pageContext.request.contextPath}/introduceList.do">자기소개서 관리</a>
									</li>
								</ul> 
							</li>
						</c:if>
						<c:if test="${sessionID != null }">
							<li>
								<a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
							</li>
						</c:if>
						<c:if test="${sessionID == null }">
							<li>
								<a href="${pageContext.request.contextPath}/log/login.jsp">로그인</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
		</header>
		<div id="upperWrap">
			<div id="container">
				<div id="mainUpperPart">
					<div id="mainUpperPart_left">
						<div class="slide_box">
							<div class="slide_list">
								<div id="lastClone" class="slide_item slide_item_5">
									<div class="category">추천기업</div>
									<div class="rc_name">${listRc[2].rc_name}</div>
									<div class="company_info_title">기업정보</div>
									<div class="company_info">- 업종: ${listCompany[2].m_gender}</div>
									<div class="company_info">- 사원수: ${listCompany[2].m_email}</div>
									<div class="company_info">- 매출액: ${listCompany[2].m_phone}</div>
									<div class="company_rc_link">
										<a href="#" target="_blank" onclick="window.open('${pageContext.request.contextPath}/popUpHireUnion.do?rc_num=${listRc[1].rc_num}','name','resizable=no width=1050 height=1200'); return false"> 회사 공고 보러가기 </a>
									</div>
								</div>

								<div class="slide_item slide_item_1">
									<div class="category">추천기업</div>
									<div class="rc_name">${listRc[1].rc_name}</div>
									<div class="company_info_title">기업정보</div>
									<div class="company_info">- 업종: ${listCompany[1].m_gender}</div>
									<div class="company_info">- 사원수: ${listCompany[1].m_email}</div>
									<div class="company_info">- 매출액: ${listCompany[1].m_phone}</div>
									<div class="company_rc_link">
										<a href="#" target="_blank" onclick="window.open('${pageContext.request.contextPath}/popUpHireUnion.do?rc_num=${listRc[1].rc_num}','name','resizable=no width=1050 height=1200'); return false"> 회사 공고 보러가기 </a>
									</div>
								</div>

								<div class="slide_item slide_item_2">
									<div class="category">추천기업</div>
									<div class="rc_name">${listRc[8].rc_name}</div>
									<div class="company_info_title">기업정보</div>
									<div class="company_info">- 업종: ${listCompany[8].m_gender}</div>
									<div class="company_info">- 사원수: ${listCompany[8].m_email}</div>
									<div class="company_info">- 매출액: ${listCompany[8].m_phone}</div>
									<div class="company_rc_link">
										<a href="#" target="_blank" onclick="window.open('${pageContext.request.contextPath}/popUpHireUnion.do?rc_num=${listRc[8].rc_num}','name','resizable=no width=1050 height=1200'); return false"> 회사 공고 보러가기 </a>
									</div>
								</div>

								<div class="slide_item slide_item_3">
									<div class="category">추천기업</div>
									<div class="rc_name">${listRc[11].rc_name}</div>
									<div class="company_info_title">기업정보</div>
									<div class="company_info">- 업종: ${listCompany[11].m_gender}</div>
									<div class="company_info">- 사원수: ${listCompany[11].m_email}</div>
									<div class="company_info">- 매출액: ${listCompany[11].m_phone}</div>
									<div class="company_rc_link">
										<a href="#" target="_blank" onclick="window.open('${pageContext.request.contextPath}/popUpHireUnion.do?rc_num=${listRc[1].rc_num}','name','resizable=no width=1050 height=1200'); return false"> 회사 공고 보러가기 </a>
									</div>
								</div>

								<div class="slide_item slide_item_4">
									<div class="category">추천기업</div>
									<div class="rc_name">${listRc[7].rc_name}</div>
									<div class="company_info_title">기업정보</div>
									<div class="company_info">- 업종: ${listCompany[7].m_gender}</div>
									<div class="company_info">- 사원수: ${listCompany[7].m_email}</div>
									<div class="company_info">- 매출액: ${listCompany[7].m_phone}</div>
									<div class="company_rc_link">
										<a href="#" target="_blank" onclick="window.open('${pageContext.request.contextPath}/popUpHireUnion.do?rc_num=${listRc[1].rc_num}','name','resizable=no width=1050 height=1200'); return false"> 회사 공고 보러가기 </a>
									</div>
								</div>

								<div class="slide_item slide_item_5">
									<div class="category">추천기업</div>
									<div class="rc_name">${listRc[2].rc_name}</div>
									<div class="company_info_title">기업정보</div>
									<div class="company_info">- 업종: ${listCompany[2].m_gender}</div>
									<div class="company_info">- 사원수: ${listCompany[2].m_email}</div>
									<div class="company_info">- 매출액: ${listCompany[2].m_phone}</div>
									<div class="company_rc_link">
										<a href="#" target="_blank" onclick="window.open('${pageContext.request.contextPath}/popUpHireUnion.do?rc_num=${listRc[2].rc_num}','name','resizable=no width=1050 height=1200'); return false"> 회사 공고 보러가기 </a>
									</div>
								</div>

								<div id="firstClone" class="slide_item slide_item_1">
									<div class="category">추천기업</div>
									<div class="rc_name">${listRc[1].rc_name}</div>
									<div class="company_info_title">기업정보</div>
									<div class="company_info">- 업종: ${listCompany[1].m_gender}</div>
									<div class="company_info">- 사원수: ${listCompany[1].m_email}</div>
									<div class="company_info">- 매출액: ${listCompany[1].m_phone}</div>
									<div class="company_rc_link">
										<a href="#" target="_blank" onclick="window.open('${pageContext.request.contextPath}/popUpHireUnion.do?rc_num=${listRc[1].rc_num}','name','resizable=no width=1050 height=1200'); return false"> 회사 공고 보러가기 </a>
									</div>
								</div>
							</div>
						</div>
						<button class="slideBtn moveBtn_0"></button>
						<button class="slideBtn moveBtn_1"></button>
						<button class="slideBtn moveBtn_2"></button>
						<button class="slideBtn moveBtn_3"></button>
						<button class="slideBtn moveBtn_4"></button>
						<!-- 					<button class="slideBtn prevBtn">prev</button> -->
						<button class="slideBtn nextBtn">next</button>
						<button class="slideBtn playBtn">
							<svg width="6px" height="6px" viewBox="0 0 6 6" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="btn">
					        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
					            <g transform="translate(-615.000000, -536.000000)" fill="white" fill-rule="nonzero">
					                <g transform="translate(330.000000, 192.000000)">
					                    <g transform="translate(229.000000, 344.000000)">
					                        <g transform="translate(56.000000, 0.000000)">
					                            <rect x="0" y="0" width="1.5" height="6"></rect>
					                            <rect x="4.5" y="0" width="1.5" height="6"></rect>
					                        </g>
					                    </g>
					                </g>
					            </g>
					        </g>
					    </svg>
						</button>
					</div>
					<div id="mainUpperPart_center">
						<div class="slide_box_center">
							<div class="slide_list_center">
								<div id="lastClone_center" class="slide_item_center">
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularInfo[2].bd_code}&bd_num=${listPopularInfo[2].bd_num}">
											<input type="image" name="file_pic" src="${listPopularInfo[2].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_info">정보공유</div>
											<div class="subject">${listPopularInfo[2].subject}</div>
											<div class="tags">${listPopularInfo[2].tags}</div>
										</a>
									</div>
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularQnA[2].bd_code}&bd_num=${listPopularQnA[2].bd_num}">
											<input type="image" name="file_pic" src="${listPopularQnA[2].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_QnA">취준톡톡</div>
											<div class="subject">${listPopularQnA[2].subject}</div>
											<div class="tags">${listPopularQnA[2].tags}</div>
										</a>
									</div>
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularInfo[3].bd_code}&bd_num=${listPopularInfo[3].bd_num}">
											<input type="image" name="file_pic" src="${listPopularInfo[3].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_info">정보공유</div>
											<div class="subject">${listPopularInfo[3].subject}</div>
											<div class="tags">${listPopularInfo[3].tags}</div>
										</a>
									</div>
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularQnA[3].bd_code}&bd_num=${listPopularQnA[3].bd_num}">
											<input type="image" name="file_pic" src="${listPopularQnA[3].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_QnA">취준톡톡</div>
											<div class="subject">${listPopularQnA[3].subject}</div>
											<div class="tags">${listPopularQnA[3].tags}</div>
										</a>
									</div>								
								</div>

								<div class="slide_item_center">
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularInfo[0].bd_code}&bd_num=${listPopularInfo[0].bd_num}">
											<input type="image" name="file_pic" src="${listPopularInfo[0].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_info">정보공유</div>
											<div class="subject">${listPopularInfo[0].subject}</div>
											<div class="tags">${listPopularInfo[0].tags}</div>
										</a>
									</div>
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularQnA[0].bd_code}&bd_num=${listPopularQnA[0].bd_num}">
											<input type="image" name="file_pic" src="${listPopularQnA[0].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_QnA">취준톡톡</div>
											<div class="subject">${listPopularQnA[0].subject}</div>
											<div class="tags">${listPopularQnA[0].tags}</div>
										</a>
									</div>
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularInfo[1].bd_code}&bd_num=${listPopularInfo[1].bd_num}">
											<input type="image" name="file_pic" src="${listPopularInfo[1].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_info">정보공유</div>
											<div class="subject">${listPopularInfo[1].subject}</div>
											<div class="tags">${listPopularInfo[1].tags}</div>
										</a>
									</div>
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularQnA[1].bd_code}&bd_num=${listPopularQnA[1].bd_num}">
											<input type="image" name="file_pic" src="${listPopularQnA[1].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_QnA">취준톡톡</div>
											<div class="subject">${listPopularQnA[1].subject}</div>
											<div class="tags">${listPopularQnA[1].tags}</div>
										</a>
									</div>
								</div>

								<div class="slide_item_center">
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularInfo[2].bd_code}&bd_num=${listPopularInfo[2].bd_num}">
											<input type="image" name="file_pic" src="${listPopularInfo[2].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_info">정보공유</div>
											<div class="subject">${listPopularInfo[2].subject}</div>
											<div class="tags">${listPopularInfo[2].tags}</div>
										</a>
									</div>
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularQnA[2].bd_code}&bd_num=${listPopularQnA[2].bd_num}">
											<input type="image" name="file_pic" src="${listPopularQnA[2].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_QnA">취준톡톡</div>
											<div class="subject">${listPopularQnA[2].subject}</div>
											<div class="tags">${listPopularQnA[2].tags}</div>
										</a>
									</div>
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularInfo[3].bd_code}&bd_num=${listPopularInfo[3].bd_num}">
											<input type="image" name="file_pic" src="${listPopularInfo[3].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_info">정보공유</div>
											<div class="subject">${listPopularInfo[3].subject}</div>
											<div class="tags">${listPopularInfo[3].tags}</div>
										</a>
									</div>
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularQnA[3].bd_code}&bd_num=${listPopularQnA[3].bd_num}">
											<input type="image" name="file_pic" src="${listPopularQnA[3].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_QnA">취준톡톡</div>
											<div class="subject">${listPopularQnA[3].subject}</div>
											<div class="tags">${listPopularQnA[3].tags}</div>
										</a>
									</div>
								</div>

								<div class="slide_item_center">
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularInfo[4].bd_code}&bd_num=${listPopularInfo[4].bd_num}">
											<input type="image" name="file_pic" src="${listPopularInfo[4].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_info">정보공유</div>
											<div class="subject">${listPopularInfo[4].subject}</div>
											<div class="tags">${listPopularInfo[4].tags}</div>
										</a>
									</div>
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularQnA[4].bd_code}&bd_num=${listPopularQnA[4].bd_num}">
											<input type="image" name="file_pic" src="${listPopularQnA[4].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_QnA">취준톡톡</div>
											<div class="subject">${listPopularQnA[4].subject}</div>
											<div class="tags">${listPopularQnA[4].tags}</div>
										</a>
									</div>
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularInfo[5].bd_code}&bd_num=${listPopularInfo[5].bd_num}">
											<input type="image" name="file_pic" src="${listPopularInfo[5].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_info">정보공유</div>
											<div class="subject">${listPopularInfo[5].subject}</div>
											<div class="tags">${listPopularInfo[5].tags}</div>
										</a>
									</div>
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularQnA[5].bd_code}&bd_num=${listPopularQnA[5].bd_num}">
											<input type="image" name="file_pic" src="${listPopularQnA[5].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_QnA">취준톡톡</div>
											<div class="subject">${listPopularQnA[5].subject}</div>
											<div class="tags">${listPopularQnA[5].tags}</div>
										</a>
									</div>
								</div>

								<div class="slide_item_center">
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularInfo[0].bd_code}&bd_num=${listPopularInfo[0].bd_num}">
											<input type="image" name="file_pic" src="${listPopularInfo[0].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_info">정보공유</div>
											<div class="subject">${listPopularInfo[0].subject}</div>
											<div class="tags">${listPopularInfo[0].tags}</div>
										</a>
									</div>
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularQnA[0].bd_code}&bd_num=${listPopularQnA[0].bd_num}">
											<input type="image" name="file_pic" src="${listPopularQnA[0].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_QnA">취준톡톡</div>
											<div class="subject">${listPopularQnA[0].subject}</div>
											<div class="tags">${listPopularQnA[0].tags}</div>
										</a>
									</div>
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularInfo[1].bd_code}&bd_num=${listPopularInfo[1].bd_num}">
											<input type="image" name="file_pic" src="${listPopularInfo[1].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_info">정보공유</div>
											<div class="subject">${listPopularInfo[1].subject}</div>
											<div class="tags">${listPopularInfo[1].tags}</div>
										</a>
									</div>
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularQnA[1].bd_code}&bd_num=${listPopularQnA[1].bd_num}">
											<input type="image" name="file_pic" src="${listPopularQnA[1].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_QnA">취준톡톡</div>
											<div class="subject">${listPopularQnA[1].subject}</div>
											<div class="tags">${listPopularQnA[1].tags}</div>
										</a>
									</div>
								</div>

								<div class="slide_item_center">
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularInfo[2].bd_code}&bd_num=${listPopularInfo[2].bd_num}">
											<input type="image" name="file_pic" src="${listPopularInfo[2].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_info">정보공유</div>
											<div class="subject">${listPopularInfo[2].subject}</div>
											<div class="tags">${listPopularInfo[2].tags}</div>
										</a>
									</div>
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularQnA[2].bd_code}&bd_num=${listPopularQnA[2].bd_num}">
											<input type="image" name="file_pic" src="${listPopularQnA[2].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_QnA">취준톡톡</div>
											<div class="subject">${listPopularQnA[2].subject}</div>
											<div class="tags">${listPopularQnA[2].tags}</div>
										</a>
									</div>
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularInfo[3].bd_code}&bd_num=${listPopularInfo[3].bd_num}">
											<input type="image" name="file_pic" src="${listPopularInfo[3].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_info">정보공유</div>
											<div class="subject">${listPopularInfo[3].subject}</div>
											<div class="tags">${listPopularInfo[3].tags}</div>
										</a>
									</div>
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularQnA[3].bd_code}&bd_num=${listPopularQnA[3].bd_num}">
											<input type="image" name="file_pic" src="${listPopularQnA[3].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_QnA">취준톡톡</div>
											<div class="subject">${listPopularQnA[3].subject}</div>
											<div class="tags">${listPopularQnA[3].tags}</div>
										</a>
									</div>
								</div>
								
								<div id="firstClone_center" class="slide_item_center">
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularInfo[0].bd_code}&bd_num=${listPopularInfo[0].bd_num}">
											<input type="image" name="file_pic" src="${listPopularInfo[0].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_info">정보공유</div>
											<div class="subject">${listPopularInfo[0].subject}</div>
											<div class="tags">${listPopularInfo[0].tags}</div>
										</a>
									</div>
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularQnA[0].bd_code}&bd_num=${listPopularQnA[0].bd_num}">
											<input type="image" name="file_pic" src="${listPopularQnA[0].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_QnA">취준톡톡</div>
											<div class="subject">${listPopularQnA[0].subject}</div>
											<div class="tags">${listPopularQnA[0].tags}</div>
										</a>
									</div>
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularInfo[1].bd_code}&bd_num=${listPopularInfo[1].bd_num}">
											<input type="image" name="file_pic" src="${listPopularInfo[1].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_info">정보공유</div>
											<div class="subject">${listPopularInfo[1].subject}</div>
											<div class="tags">${listPopularInfo[1].tags}</div>
										</a>
									</div>
									<div class="block">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${listPopularQnA[1].bd_code}&bd_num=${listPopularQnA[1].bd_num}">
											<input type="image" name="file_pic" src="${listPopularQnA[1].file_name }" class="center_block_pic">
											<div class="bd_code bd_code_QnA">취준톡톡</div>
											<div class="subject">${listPopularQnA[1].subject}</div>
											<div class="tags">${listPopularQnA[1].tags}</div>
										</a>
									</div>
								</div>
							</div>
						</div>
						<button class="slideBtn_center prevBtn_center">
							<svg xmlns="http://www.w3.org/2000/svg" width="6" height="10" viewBox="0 0 6 10" class="btn">
							<g fill="none" fill-rule="evenodd">
								<path fill-rule="nonzero" d="M0 0L6 0 6 10 0 10z"></path>
								<path stroke="#9398AA" stroke-width="1.2" d="M-1 3L3 7 7 3" transform="rotate(90 3 5)" class="change"></path>
							</g>
						</svg>
						</button>
						<button class="slideBtn_center nextBtn_center">
							<svg xmlns="http://www.w3.org/2000/svg" width="6" height="10" viewBox="0 0 6 10" class="btn">
						<g fill="none" fill-rule="evenodd">
							<path fill-rule="nonzero" d="M0 0L6 0 6 10 0 10z"></path>
							<path stroke="#9398AA" stroke-width="1.2" d="M-1 3L3 7 7 3" transform="matrix(0 1 1 0 -2 2)" class="change"></path>
						</g>
					</svg>
						</button>
					</div>
					<div id="mainUpperPart_right">
						<div class="part_title">
							추천 공고
							<a class="part_title_link" href="${pageContext.request.contextPath}/rclist.do">공고 더보기</a>
						</div>
						<div class="part_right_block part_right_block_1">
							<a href="#" target="_blank" onclick="window.open('${pageContext.request.contextPath}/popUpHireUnion.do?rc_num=${listRc[4].rc_num}','name','resizable=no width=1050 height=1200'); return false">
								<div class="rc_name">${listRc[4].rc_name}</div>
								<div class="rc_title">${listRc[4].rc_title}</div>
								<div class="rc_salary">급여 ${listRc[4].rc_salary} 만원</div>
								<div class="company_category">#${listCompany[4].m_gender}</div>
								<div class="rc_date">${listRc[4].rc_date}</div>
							</a>
						</div>
						<div class="part_right_block part_right_block_2">
							<a href="#" target="_blank" onclick="window.open('${pageContext.request.contextPath}/popUpHireUnion.do?rc_num=${listRc[15].rc_num}','name','resizable=no width=1050 height=1200'); return false">
								<div class="rc_name">${listRc[15].rc_name}</div>
								<div class="rc_title">${listRc[15].rc_title}</div>
								<div class="rc_salary">급여 ${listRc[15].rc_salary} 만원</div>
								<div class="company_category">#${listCompany[15].m_gender}</div>
								<div class="rc_date">${listRc[15].rc_date}</div>
							</a>
						</div>
						<div class="part_right_block part_right_block_3">
							<a href="#" target="_blank" onclick="window.open('${pageContext.request.contextPath}/popUpHireUnion.do?rc_num=${listRc[7].rc_num}','name','resizable=no width=1050 height=1200'); return false">
								<div class="rc_name">${listRc[7].rc_name}</div>
								<div class="rc_title">${listRc[7].rc_title}</div>
								<div class="rc_salary">급여 ${listRc[7].rc_salary} 만원</div>
								<div class="company_category">#${listCompany[7].m_gender}</div>
								<div class="rc_date">${listRc[7].rc_date}</div>
							</a>
						</div>
						<div class="part_right_block part_right_block_4">
							<a href="#" target="_blank" onclick="window.open('${pageContext.request.contextPath}/popUpHireUnion.do?rc_num=${listRc[2].rc_num}','name','resizable=no width=1050 height=1200'); return false">
								<div class="rc_name">${listRc[2].rc_name}</div>
								<div class="rc_title">${listRc[2].rc_title}</div>
								<div class="rc_salary">급여 ${listRc[2].rc_salary} 만원</div>
								<div class="company_category">#${listCompany[2].m_gender}</div>
								<div class="rc_date">${listRc[2].rc_date}</div>
							</a>
						</div>
					</div>
				</div>
				<div class="recruit_recommend_title">채용 공고</div>
				<!-- 채용공고 -->
				<div id="recruit_recommend_container">

					<c:forEach items="${listRc}" var="rdt" begin="0" end="99" varStatus="status">
						<a href="#" target="_blank" onclick="window.open('${pageContext.request.contextPath}/popUpHireUnion.do?rc_num=${rdt.rc_num}','name','resizable=no width=1050 height=1200'); return false">
							<div class="recruit_recommend_division recruit_recommend_division_${status.index}">
								<div class="recruit_recommend_block">
									<div class="recruit_recommend_block_img">
										<img src="${rdt.rc_content}">
									</div>
									<div class="recruit_recommend_block_title">${rdt.rc_title}&nbsp;</div>
									<div class="recruit_recommend_block_content">
										<br> <br>
										<div class="rc_name">${rdt.rc_name}</div>
										<div class="rc_salary">
											<br>${rdt.rc_title}<br>급여 ${rdt.rc_salary} 만원
										</div>
										<div class="rc_date">
											<br> <br> <br>공고일 : ${rdt.rc_date}
										</div>
									</div>
								</div>
							</div>
						</a>
					</c:forEach>
				</div>

				<!-- 커뮤니티 -->
				<div id="community_popular_container">
					<div id="community_popular_info" class="community_popular_part">
						<div class="community_popular_title">커뮤니티 인기글</div>
						<c:forEach var="board" items="${listPopularInfo}" begin="0" end="3">
							<table>
								<tr>
									<td rowspan="3" class="community_popular_table_pic">
										<input type="image" name="file_pic" src="${board.file_name }" class="community_popular_table_pic">
									</td>
									<td class="community_popular_table_subject">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${board.bd_code}&bd_num=${board.bd_num}">${board.subject}</a>
									</td>
								</tr>
								<tr>
									<td class="community_popular_table_content">
										<c:choose>
											<c:when test="${fn:length(board.content) gt 150}">
												<c:out value="${fn:substring(board.content, 0, 150)} ${'...'}"></c:out>
											</c:when>
											<c:otherwise>
												<c:out value="${board.content}" />
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
									<td class="community_popular_table_tags">${board.tags}</td>
								</tr>
							</table>
						</c:forEach>
					</div>
					<div id="community_popular_QnA" class="community_popular_part">
						<div class="community_popular_title">취준톡톡 인기글</div>
						<c:forEach var="board" items="${listPopularQnA}" begin="0" end="3">
							<table>
								<tr>
									<td rowspan="3" class="community_popular_table_pic">
										<input type="image" name="file_pic" src="${board.file_name }" class="community_popular_table_pic">
									</td>
									<td class="community_popular_table_subject">
										<a href="${pageContext.request.contextPath}/communityContent.do?bd_code=${board.bd_code}&bd_num=${board.bd_num}">${board.subject}</a>
									</td>
								</tr>
								<tr>
									<td class="community_popular_table_content">
										<c:choose>
											<c:when test="${fn:length(board.content) gt 150}">
												<c:out value="${fn:substring(board.content, 0, 150)} ${'...'}"></c:out>
											</c:when>
											<c:otherwise>
												<c:out value="${board.content}" />
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
									<td class="community_popular_table_tags">${board.tags}</td>
								</tr>
							</table>
						</c:forEach>
					</div>
				</div>

			</div>
		</div>
		<footer> Copyright & copy </footer>
</body>
</html>