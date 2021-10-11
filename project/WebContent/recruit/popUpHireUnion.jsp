<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<%
	String context = request.getContextPath();
%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/recruit/popUpHireUnion.css">
<head>
<meta charset="UTF-8">
<title>popUpHireUnion.jsp</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/recruit/kakaoMap.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fe0e9f03162b4483b8714cec0d96833e&libraries=services,clusterer,drawing"></script>
<script defer
	src="${pageContext.request.contextPath}/recruit/kakaoMap.js"></script>
<style type="text/css">
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

 
     // Ajax 사용
    function getLikeCompany(rc_num_val, m_id_val, p_event_val){
    	
//      	alert("getLikeCompany rc_num_val->"+rc_num_val); 
//      	alert("getLikeCompany m_id_val->"+m_id_val); 
//      	alert("getLikeCompany p_event_val->"+p_event_val); 
    	//likeCompany테이블에 rc_num과 m_id입력하고 입력이 됐는지 이미 등록됐는지를 알려주는 경고창 보여주는 기능
    	$.ajax({
    		url:"<%=context%>/ajaxLikeCompany.do",   
    		data:{rc_num    : rc_num_val , 
   			      m_id      : m_id_val ,
   			      p_event   : p_event_val
    		     },
    		dataType:'text',
    		success:function(data){
    			  
    	  		    if ( data == '1' ) {
    	  		    	 heart('1');
       				} else if (  data == '2' ) {
      	  		    	 heart('2');
      				} else if (  data == '3' ) {
      	  		    	 heart('3');
 			    	}else {   // 4
 	   	  		    	 heart('4');
    				}
 
    			 ;
    		}
    	});
    }
     
    function heart(num){
//     	alert('heart num->'+num);
 		if ( num == '1' ) {
 			document.getElementById("img").src = "${pageContext.request.contextPath}/image/5over.png";
 			alert("관심목록에 등록이 되었습니다 마이페이지에서 확인하세요");  //관심목록에 등록이 되어 있지않은 상태에서 클릭해서 등록 해야할 때
		
 		} else if (  num == '2' ) {
			document.getElementById("img").src = "${pageContext.request.contextPath}/image/5out.png";
			alert("관심목록에서 삭제 되었습니다.");
		
		} else if (  num == '3' ) {
			document.getElementById("img").src = "${pageContext.request.contextPath}/image/5over.png";
 			
		} else if( num == '4' ) {   // 4
	   		document.getElementById("img").src = "${pageContext.request.contextPath}/image/5out.png";
	   		
		}

    	
      }

</script>
<script type="text/javascript">
var rc_name = '${list.rc_name}';
var rc_view = '${list.rc_view}';

var company_lan = rc_view[0]+rc_view[1]+".";
for (var i = 2; i<9; i++) {
	company_lan += rc_view[i];
}
company_lan = Number(company_lan);

var company_lon = rc_view[9]+rc_view[10]+rc_view[11]+".";
for (var i = 12; i<rc_view.length; i++) {
	company_lon += rc_view[i];
}
company_lon = Number(company_lon);

console.log('${list.rc_view}');
console.log(company_lan);
console.log(company_lon);

</script>
</head>
<body onload="getLikeCompany(${list.rc_num}, '${sessionID}', 'L')">
	<div
		style="background-color: white; width: 870px; border: 1px solid #e5e6eb;">
		<div class="dtitle">
			<form
				action="${pageContext.request.contextPath}/apply.do?rc_num=${list.rc_num}"
				method="POST">
				<table class="hire">
					<tr>
						<td
							style="width: 500px; font-size: 30px; height: 60%; padding-left: 50px; padding-top: 30px;">${list.rc_name}</td>
						<c:if test="${sessionM_TF == '1' }">
							<td id="c" rowspan="2" style="width: 100px; height: 150px;">



								<img id="img"
								onclick="getLikeCompany(${list.rc_num}, '${sessionID}', 'C' )"
								src="${pageContext.request.contextPath}/image/5out.png"
								style="width: 45px; height: 45px;">
							</td>
						</c:if>

						<c:if test="${sessionID == null }">
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</c:if>



					<c:if test="${sessionM_TF == '1' }">
						<td rowspan="2"><input type="hidden" name="rc_num"
							value="${list.rc_num }"> <input type="submit"
							value="입사지원" id="jiwon" style="margin-right: 50px;"></td>
					</c:if>
					</tr>
					<c:set var="mclass" value="${mclass }" />
					<c:if test="${mclass == '10'}">
						<tr>

							<td style="font-size: 35px; height =40%; padding-left: 50px;">(정규직)${list.rc_title}</td>
						</tr>
					</c:if>
					<c:if test="${mclass == '11'}">
						<tr>

							<td style="font-size: 35px; height :40%; padding-left: 50px;">(인턴)${list.rc_title}</td>
						</tr>
					</c:if>
					<c:if test="${mclass == '12'}">
						<tr>

							<td style="font-size: 35px; height :40%; padding-left: 50px;">(계약직)${list.rc_title}</td>
						</tr>
					</c:if>
					<c:if test="${mclass == null}">
						<tr>

							<td style="font-size: 35px; height :40%; padding-left: 50px;">${list.rc_title}</td>
						</tr>	
					</c:if>
				</table>
			</form>
		</div>
		<br> <br>
		<hr>
		<br>
		<div id="dcontent">
			<img alt="hire"
				src="${pageContext.request.contextPath}/${list.rc_scrap}"
				width="870px;">
		</div>
		<br>
		<hr>
		<br>
		<div id="dfoot">
			<table id="foottb" style="margin-left: 25px;">
				<tr>
					<td></td>
					<td style="font-size: 25px; padding-left: 50px;">${list.rc_name }</td>
				</tr>
				<tr>
					<td rowspan="5" style="border: 1px solid #e5e6eb; width: 260px;"><img
						alt="hireLogo"
						src="${pageContext.request.contextPath}/${list.rc_content}"
						width="260px" height="155px;"></td>
				</tr>
				<tr>
					<td style="padding-left: 60px; width: 100px;">대표자명</td>
					<td width="100px">${list.m_name}</td>
					<td style="padding-left: 30px;">기업 설립일</td>
					<td><c:set var="TextValue" value="${list.m_birth }" />
						${fn:substring(TextValue,0,4) } 년 ${fn:substring(TextValue,4,6) }
						월 ${fn:substring(TextValue,6,8) } 일</td>
				</tr>
				<tr>
					<td style="padding-left: 60px; width: 100px;">사원 수</td>
					<td width="100px">${list.m_email}</td>
					<td style="padding-left: 30px;">업종</td>
					<td>${list.m_gender}</td>
				</tr>
				<tr>
					<td style="padding-left: 60px; width: 100px;">연봉</td>
					<td width="100px">${list.rc_salary }만원</td>
					<td style="padding-left: 30px;">홈페이지</td>
					<td><a href="${list.rc_link}"> 해당 페이지로 이동 하기 </a>
				</tr>
				<tr>
					<td style="padding-left: 60px; width: 100px;">연매출 액</td>
					<td colspan="3">${list.m_phone}</td>
				</tr>
				<tr>
					<td></td>
					<td style="padding-left: 60px;">주소</td>
					<td colspan="3">${list.m_addr}</td>
				</tr>
			</table>
			<div id="map" style="width: 100%; height: 350px;"></div>


		</div>
	</div>
</body>
</html>