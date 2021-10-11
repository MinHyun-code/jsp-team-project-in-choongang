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
	href="${pageContext.request.contextPath}/resume/resumePopUp3.css">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
</head>
<script type="text/javascript">
	function setText(p) {
		var rdoVal = $('input[name="edu_type"]:checked').val();
		var obj = window.event.srcElement;
		var tr = obj.parentNode.nodeName;
		var a = document.getElementById("edu_num_" + p).value;
		var b = document.getElementById("edu_school_" + p).value;
		var c = document.getElementById("edu_job_" + p).value;
		var d = rdoVal;
		var e =  document.getElementById("myedu_sdate").value;
		var f =  document.getElementById("myedu_edate").value;
		if ( e == ""){
            alert("입학날짜를 입력하세요");
    	}
		else if ( f == ""){
            alert("졸업날짜를 입력하세요");
    	} else {
		var ary = new Array();
		ary.push(a);
		ary.push(b);
		ary.push(c);
		ary.push(e);
		ary.push(f);
		ary.push(d);
		opener.fncAddRow3(ary);
		opener.inform.list_edu_num.value += a + ",";
		opener.inform.list_edutype_num.value += d + ",";
		opener.inform.list_myedu_sdate.value += e + ",";
		opener.inform.list_myedu_edate.value += f + ",";
        
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
									formaction="${pageContext.request.contextPath}/resumePopUp3.do">
								</td>
							</tr>
						</table>
					</form>
				</article>
			</section>
			<section id="communityMainTable">
				<article>
				<br>
				입학날짜 : <input type="date" id="myedu_sdate" style="height: 30px">
						졸업날짜 : <input type="date" id="myedu_edate"style="height: 30px">
					<table class="communityListTable">
						<thead>
							<th></th>
							<th></th>
							<th></th>
							<th>&nbsp;학교 명&nbsp;</th>
							<th>&nbsp;전공&nbsp;</th>
							<th>&nbsp;졸업구분&nbsp;</th>
						</thead>
								
							<c:if test="${eduCnt > 0 }">
								<c:forEach var="edu" items="${list }" varStatus="status">
									<tr>
										<td><input type="hidden" name="edu_num"
											id="edu_num_${status.current}" value="${edu.edu_num}"></td>
										<td><input type="hidden"
											id="edu_school_${status.current}" name="edu_school"
											value="${edu.edu_school}"></td>
										<td><input type="hidden" id="edu_job_${status.current}"
											name="edu_job" value="${edu.edu_job}"></td>
										<td width="400px" height="50px"
											style="text-align: center; font-size: 20px;">${edu.edu_school}</td>
										<td width="400px" height="50px"
											style="text-align: center; font-size: 20px;">${edu.edu_job}</td>
										<td width="500px" height="50px"
											style="font-size: 20px; text-align: left;"><label><input
												type="radio" name="edu_type" id="1" value="1"
												onclick="javascript:setText('${status.current}');">졸업</label>
											<label><input type="radio" name="edu_type" id="2"
												value="2" onclick="javascript:setText('${status.current}');">졸업예정</label>
											<label><input type="radio" name="edu_type" id="3"
												value="3" onclick="javascript:setText('${status.current}');">재학</label>
											<label><input type="radio" name="edu_type" id="4"
												value="4" onclick="javascript:setText('${status.current}');">휴학</label></td>
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