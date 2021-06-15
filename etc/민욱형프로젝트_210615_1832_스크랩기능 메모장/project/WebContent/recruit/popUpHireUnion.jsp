<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%
	String context = request.getContextPath();
%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/recruit/searchHire.css">
<head>
<meta charset="UTF-8">
<title>popUpHireUnion.jsp</title>
<style type="text/css"> 

#btn{ 
     width:100px;
     height: 45px;
     border : 0;
     border-radius: 15px;
	 font-size: 15px;
	 font-weight: 600;
     color : #235594
}

#btn:hover{ 
   background-color:#1F96B8;
   color: white;
   }
  #s {
	text-align: center;
    }

 #c{
    text-align: center;
 }
  
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
    			  	console.log("data in ajax: "+data);
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
</head>
<body onload="getLikeCompany(${list.rc_num}, '${sessionID}', 'L')">
	<div class="dtitle">
<%-- 		<form action="${pageContext.request.contextPath}/apply.do" --%>
<!-- 			method="POST"> </form>-->
			<table style="width: 100%; height: 100%; margin: 2%">
				<tr>
					<td style="font-size: 40px; height: 60%;">${list.rc_name}</td>
					
					 <c:if test="${sessionID != null }">
               <td id="c" rowspan="2">
               
               
               
                    <img id="img" onclick="getLikeCompany(${list.rc_num}, '${sessionID}', 'C' )" 
                         src="${pageContext.request.contextPath}/image/5out.png" 
                         style="width:45px; height:45px;">
               </td>
              </c:if>

			  <c:if test="${sessionID == null }">
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			  </c:if>
					
					
					
					
					<td rowspan="2"><input type="hidden" name="rc_num"
						value="${list.rc_num }"> <input type="submit" value="지원하기"
						style="width: 80%; height: 60%;"></td>
				</tr>
				<tr>
					<td style="font-size: 30px" height="40%">${list.rc_title}</td>
				</tr>
			</table>
		
	</div>
	<div id="dcontent">
		<img alt="hire"
			src="${pageContext.request.contextPath}/${list.rc_scrap}"
			width="100%">
	</div>
	<div id="dfoot">
		<table id="foottb">
			<tr>
				<td rowspan="5" width="30%"><img alt="hireLogo"
					src="${pageContext.request.contextPath}/${list.rc_content}"
					width="100%"></td>
			</tr>
			<tr>
				<td id="s">${list.rc_name}</td>
				<td id="s" colspan="2">공고일 : ${list.rc_date}</td>

				
			</tr>
			<tr>
				<td id="s">홈페이지</td>
				<td id="s"><a href="${list.rc_link}"> 해당 페이지로 이동 하기 </a>
			</tr>
		</table>
	</div>
</body>
</html>