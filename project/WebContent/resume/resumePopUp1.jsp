<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- ------------------------------------------------- 자소서 팝업 --------------------------------- -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resume/resumePopUp1.css">
<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript">
		
		function setText(p){
			
		    var obj = window.event.srcElement;
		    var tr  = obj.parentNode.nodeName;
		    var a   = document.getElementById("si_num_"+p).value;
		    var b   = document.getElementById("si_ques_"+p).value;
		    var ary = new Array();
		    ary.push(a);
		    ary.push(b);
		    opener.fncAddRow(ary);
		    opener.inform.list_si_num.value+=a+",";
		    self.close();
		}
	</script>	
</head>
<body>
	<div id="container">
		<section class="plus">
			<form id="inform" action="" method="post">
				<article id="point">
					<h2>자기소개서</h2>
				</article>
				<table>
					<c:if test="${introCnt > 0 }">
						<c:forEach var="self_intro" items="${list }" varStatus="status">
							<tr>
								<td style="font-size: 27px;">${self_intro.si_ques}</td>
								<td><input type="button" value="추가" class="btn" id="${status.current}"
									onclick="setText('${status.current}');"></td>
								<td><input type="hidden" name="si_num" id="si_num_${status.current}"
									value="${self_intro.si_num }"></td>
								<td><input type="hidden" name="m_id" id="m_id_${status.current}"
									value="${self_intro.m_id }"></td>
								<td><input type="hidden" name="si_ques" id="si_ques_${status.current}"
									value="${self_intro.si_ques }"></td>
								<td><input type="hidden" name="si_content" id="si_content_${status.current}"
									value="${self_intro.si_content }"></td>
							</tr>
							<tr style="height: 30px">
							</tr>
							<c:set var="startNum" value="${startNum - 1 }" />
						</c:forEach>
					</c:if>

					<c:if test="${introCnt == 0 }">

						<h1>데이터가 없네</h1>
					</c:if>
				</table>
			</form>
		</section>
	</div>
	<div class="pageNum">
		<ul>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${currentPage == i}">
					<li><a
						href='${pageContext.request.contextPath}/resumePopUp1.do?pageNum=${i}'
						id="pageSelected">${i}</a></li>
				</c:if>
				<c:if test="${currentPage != i}">
					<li><a
						href='${pageContext.request.contextPath}/resumePopUp1.do?pageNum=${i}'>${i}</a></li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</body>
</html>