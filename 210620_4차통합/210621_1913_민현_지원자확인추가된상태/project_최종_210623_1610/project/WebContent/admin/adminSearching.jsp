<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
		document.getElementById("caption0").style.display = "none";
		document.getElementById("content_set").style.display = "none";
		document.getElementById("search").style.display = "block";
		document.getElementById("caption").style.display = "block";
		document.getElementById("image_set").style.display = "block";
		document.getElementById("caption2").style.display = "none";
		document.getElementById("image_set2").style.display = "none";
		document.getElementById("caption3").style.display = "none";
		document.getElementById("image_set3").style.display = "none";
</script>
<section id="communityMainTable">
	<article>
		<table class="communityListTable" id="communityListTable">
	         <thead>
	            <tr>
	               <th onclick="sortTableNumber(0)">no</th>
	               <th onclick="sortTable(1)">아이디<br>/기업명</th>
	               <th onclick="sortTable(2)">이름<br>/대표자명</th>
	               <th onclick="sortTable(3)">생년월일<br>/설립일</th>
	               <th onclick="sortTable(4)">성별<br>/업종</th>
	               <th onclick="sortTable(5)">이메일<br>/직원수</th>
	               <th onclick="sortTable(6)">전화번호<br>/매출액</th>
	               <th onclick="sortTable(7)">주소</th>
	               <th onclick="sortTable(8)" style="width: 70px;">탈퇴여부</th>
	               <th onclick="sortTable(9)" style="width: 70px;">탈퇴해제</th>
	            </tr>
	         </thead>
			<c:if test="${totCnt > 0 }">
				<c:forEach var="mb" items="${searchlist }">
					<tr>
						<td>${mb.rn}</td>
						<td>${mb.m_id }</td>
						<td>${mb.m_name }</td>
						<td>${mb.m_birth }</td>
						<td>${mb.m_gender }</td>
						<td>${mb.m_email }</td>
						<td>${mb.m_phone }</td>
						<td>${mb.m_addr }</td>
						<c:if test="${mb.m_tf==1 || mb.m_tf==0}">
							<td><button type="button" class="button_update_member btn" data-m_id="${mb.m_id }" data-current_page="${currentPage}">탈퇴</button></td>
							<td>가입</td>
						</c:if>
						<c:if test="${mb.m_tf==2 || mb.m_tf==22}">
							<td>완료</td>
							<td><button type="button" class="button_recover_member btn" data-m_id="${mb.m_id}" data-current_page="${currentPage}">해제</button></td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div class="pageNum">
			<ul>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${currentPage == i }">
						<li><a class="member_page" id="pageSelected" data-value="${i}" data-type="${type }" data-keyword="${keyword }">${i}</a></li>
					</c:if>
					<c:if test="${currentPage != i}">
						<li><a class="member_page" data-value="${i}" data-type="${type }" data-keyword="${keyword }">${i}</a></li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</article>
</section>