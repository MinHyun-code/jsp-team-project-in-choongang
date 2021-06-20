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
	href="${pageContext.request.contextPath}/resume/resumePopUp4.css">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
</head>
<script type="text/javascript">
	function setText() {
		var obj = window.event.srcElement;
		var tr = obj.parentNode.nodeName;
		var a = document.getElementById("cr_name").value;
		var b = document.getElementById("cr_grade").value;
		var c = document.getElementById("cr_salary").value;
		var d = document.getElementById("cr_job").value;
		var e = document.getElementById("cr_sdate").value;
		var f = document.getElementById("cr_edate").value;
		if (a == "") {
			alert("회사명을 입력하세요");
		} else if (b == "") {
			alert("직급을 입력하세요");
		} else if (c == "") {
			alert("연봉을 입력하세요");
		} else if (d == "") {
			alert("담당업무를 입력하세요");
		} else if (e == "") {
			alert("입사날짜를 입력하세요");
		} else if (f == "") {
			alert("퇴사날짜를 입력하세요");
		} else {
			var ary = new Array();
			ary.push(a);
			ary.push(b);
			ary.push(c);
			ary.push(d);
			ary.push(e);
			ary.push(f);
			opener.fncAddRow4(ary);
			opener.inform.list_career_cr_name.value += a + ",";
			opener.inform.list_career_cr_grade.value += b + ",";
			opener.inform.list_career_cr_salary.value += c + ",";
			opener.inform.list_career_cr_job.value += d + ",";
			opener.inform.list_career_cr_sdate.value += e + ",";
			opener.inform.list_career_cr_edate.value += f + ",";
			self.close();
		}
	}
</script>
<body>
	<div id="page">
		<div id="container">
			<section id="communityMainTable">
				<article>
					<table class="communityListTable">
						<thead>
							<th>&nbsp;&nbsp;</th>
							<th>&nbsp;&nbsp;</th>
							<th style="font-size: 35px">경력</th>
							<th>&nbsp;&nbsp;</th>
							<th>&nbsp;&nbsp;</th>
						</thead>
						<tr>
							<td style="font-size: 20px;">회사&nbsp&nbsp명 </td>
							<td colspan="4"><input
								type="text" style="width: 300px; height: 25px; font-size: 20px;"
								id="cr_name"></td>

						</tr>
						<tr>
							<td style="font-size: 20px;">담당업무</td> 
							<td colspan="4"><input
								type="text" style="width: 300px; height: 25px; font-size: 20px;"
								id="cr_job"></td>
						</tr>
						<tr>
							<td style="font-size: 20px;">직급</td>
							<td colspan="4"><input
								type="text" style="width: 300px; height: 25px; font-size: 20px;"
								id="cr_grade"></td>							
						</tr>
						<tr>
							<td style="font-size: 20px;">연봉 </td>
							<td colspan="4"><input
								type="text" style="width: 300px; height: 25px; font-size: 20px;"
								id="cr_salary"></td>
						</tr>
						<tr>
							<td colspan="2" style="font-size: 20px">입사날짜 <input
								type="date" id="cr_sdate"></td>
							<td style="font-size: 25px">~</td>
							<td colspan="2" style="font-size: 20px">퇴사날짜 <input
								type="date" id="cr_edate"></td>
						</tr>
					</table>
							<input type="button" onclick="setText()" value="확인"
								class="btn btn_search" style="float: right; margin-right: 80px">
				</article>
			</section>
		</div>
	</div>
</body>

</html>