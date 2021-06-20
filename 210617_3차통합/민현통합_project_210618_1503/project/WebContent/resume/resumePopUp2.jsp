<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Community Page</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resume/resumePopUp2.css">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
</head>
<script type="text/javascript">
	function setText(p) {

		var obj = window.event.srcElement;
		var tr = obj.parentNode.nodeName;
		var a = document.getElementById("lc_num_" + p).value;
		var b = document.getElementById("lc_name_" + p).value;
		var c = document.getElementById("lc_organ_" + p).value;
		var d = document.getElementById("mylc_date").value;
		if (d == "") {
			alert("취득날짜를 입력하세요");
		} else {
			var ary = new Array();
			ary.push(a);
			ary.push(b);
			ary.push(c);
			ary.push(d);
			opener.fncAddRow2(ary);
			opener.inform.list_lc_num.value += a + ",";
			opener.inform.list_mylc_date.value += d + ",";
			self.close();
		}
	}
</script>
<body>
	<div id="page">
		<div id="container">
			<section id="communityMainSearch">
				<article>
					<form method="GET">
						<table id="searchBox">
							<tr>
								<td><input type="text" placeholder="Search" name="word"
									id="search"></td>
								<td><input type="submit" value="검색" class="btn btn_search"
									formaction="${pageContext.request.contextPath}/resumePopUp2.do">
								</td>
							</tr>
						</table>
					</form>
				</article>
			</section>
			<section id="communityMainTable">
				<article>
					<br> 취득날짜 : <input type="date" id="mylc_date"
						style="height: 30px">
					<table class="communityListTable">
						<thead>
							<th></th>
							<th></th>
							<th></th>
							<th>&nbsp;자격증 명&nbsp;</th>
							<th>&nbsp;관리기관&nbsp;</th>
						</thead>
						<c:if test="${licenceCnt > 0 }">
							<c:forEach var="licence" items="${list }" varStatus="status">
								<tr onclick="javascript:setText('${status.current}');">
									<td><input type="hidden" name="lc_num"
										id="lc_num_${status.current}" value="${licence.lc_num}"></td>
									<td><input type="hidden" id="lc_name_${status.current}"
										name="lc_name" value="${licence.lc_name}"></td>
									<td><input type="hidden" id="lc_organ_${status.current}"
										name="lc_organ" value="${licence.lc_organ}"></td>
									<td width="400px" height="50px"
										style="text-align: center; font-size: 20px;">${licence.lc_name}</td>
									<td width="400px" height="50px"
										style="text-align: center; font-size: 20px;">${licence.lc_organ}</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
					<!-- 					<div class="pageNum"> -->
					<!-- 						<ul> -->
					<%-- 							<c:forEach var="i" begin="${startPage}" end="${endPage}"> --%>
					<%-- 								<c:if test="${currentPage == i}"> --%>
					<%-- 									<li><a href='${pageContext.request.contextPath}/communityList.do?word=${word}&pageNum=${i}' id="pageSelected">${i}</a></li> --%>
					<%-- 								</c:if> --%>
					<%-- 								<c:if test="${currentPage != i}"> --%>
					<%-- 									<li><a href='${pageContext.request.contextPath}/communityList.do?word=${word}&pageNum=${i}'>${i}</a></li> --%>
					<%-- 								</c:if> --%>
					<%-- 							</c:forEach> --%>
					<!-- 						</ul> -->
					<!-- 					</div> -->
				</article>
			</section>
		</div>
	</div>
</body>

</html>