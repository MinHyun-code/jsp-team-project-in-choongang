<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/adminMain.css">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
</head>
<body>
	<div class="admin_set">
	<div class="admin_tap">
		<a onclick="location.href='${pageContext.request.contextPath}/main.do'"><div id="admin_img"><img alt="admin.jpg" src="./image/manager.png" style="width: 150px; height: 150px;"></div></a>
		<div id="manager_page">
			<div id="gear"><img alt="톱니바퀴.png" src="./image/톱니바퀴6.png" onmouseover="this.src='./image/톱니바퀴5.gif'" onmouseout="this.src='./image/톱니바퀴6.png'" style="width: 30px; height: 30px;"></div>
			<a onclick="location.href='${pageContext.request.contextPath}/adminMain.do'"><div id="h1"><b>admin</b></div></a>
		</div>
	<button id="button_member_list" class="button_ajax"><div id="member_list"><b>회원관리</b></div></button>
	<div id="blank"></div>
	<button id="button_community_list" class="button_ajax"><div id="community_list"><b>커뮤니티</b></div></button>
	<div id="blank"></div>
	<button id="button_recruit_list" class="button_ajax"><div id="recruit_list"><b>채용공고</b></div></button>
	</div>
	<div id="table_set">
	<div id="caption0">
		<div id="title0"><h1>관리자페이지</h1></div>
		<hr>
		<div id="content0">회원,커뮤니티,채용공고를 관리한다<br>전체적으로 한눈에 볼 수 있다</div>
	</div>
	<div id="content_set">
	<div id="span_set">
	<div id="span">
		<span class="span1"   data-value='${md_totalCnt}' style="height: calc(${md_totalCnt}px*3);  left: 100px;">${md_totalCnt}</span>
		<span class="span2"  data-value='${communityCnt}' style="height: calc(${communityCnt}px*3); left:300px;">${communityCnt}</span>
		<span class="span3" data-value='${rc_totalCnt}' style="height: calc(${rc_totalCnt}px*3);  left: 500px;">${rc_totalCnt}</span>
	</div>
	<div id="image_set0">
		<div id="image_text00">
			<div id="image00"><img alt="전체.png" src="./image/전체회원1.png" style="width:100px; height: 100px;"></div><div class="text00">전체회원</div>
		</div>
		<div id="image_text01">
			<div id="image01"><img alt="커뮤니티수.png" src="./image/커뮤니티.png" style="width:100px; height: 100px;"></div><div class="text01">커뮤니티</div>
		</div>
		<div id="image_text02">
			<div id="image02"><img alt="채용공고수.png" src="./image/공고1.png" style="width:100px; height: 100px;"></div><div class="text02">채용공고</div>		
	</div>
	</div>
	</div>
	<div id="span_set2">
		<div class="hr1"><hr></div>
	</div>
	<div id="span_set3">
		<div id="square_set1">
		<div id="square1">
			<div id="comment0">가입회원</div><img alt="가입.png" src="./image/가입.png" style="width:100px; height: 100px;"><div id="comment1">${md_joinCnt}</div>
		</div>
		<div id="square2">
			<div id="comment2">탈퇴회원</div><img alt="탈퇴.png" src="./image/탈퇴.png" style="width:100px; height: 100px;"><div id="comment3">${md_wdCnt}</div>
		</div>
		</div>
		<div id="square_set2">
		<div id="square3">
			<div id="comment4">커뮤니티↑</div><img alt="커뮤니티.png" src="./image/커뮤니티 날짜1.png" style="width:100px; height: 100px;"><div id="comment5">${reg_date}</div>
		</div>
		<div id="square4">
			<div id="comment6">채용공고↑</div><img alt="채용공고.png" src="./image/채용공고 날짜3.png" style="width:100px; height: 100px;"><div id="comment7">${rc_date}</div>
		</div>
		</div>
	</div>
	</div>
	<div id="caption">
		<div id="title"><h1>회원관리</h1></div>
		<hr>
		<div id="content2">전체회원을 한눈에 볼 수 있다<br>가입,탈퇴한 회원을 살펴보고 관리한다</div>
	</div>
	<div id="image_set">
		<div id="image_text1">
			<div class="text1">전체</div><div id="image1"><img alt="전체.png" src="./image/전체회원.png" style="width:100px; height: 100px;"></div><div class="text4">${md_totalCnt}</div>
		</div>
		<div id="image_text2">
			<div class="text2">가입</div><div id="image2"><img alt="가입.png" src="./image/가입회원3.png" style="width:100px; height: 100px;"></div><div class="text5">${md_joinCnt}</div>
		</div>
		<div id="image_text3">
			<div class="text3">탈퇴</div><div id="image3"><img alt="탈퇴.png" src="./image/탈퇴회원3.png" style="width:100px; height: 100px;"></div><div class="text6">${md_wdCnt}</div>		
		</div>
	</div>
	<div id="caption2">
		<div id="title2"><h1>커뮤니티 관리</h1></div>
		<hr>
		<div id="content3">커뮤니티 게시판을 한눈에 볼 수 있다<br>작성한 게시글을 삭제할 수 있다</div>
	</div>
	<div id="image_set2">
		<div id="image_text4">
			<div class="text7">조회수↑</div><div id="image4"><img alt="조회수.png" src="./image/조회수5.png" style="width:100px; height: 100px;"></div><div class="text9">${read_id}</div>
		</div>
		<div id="image_text5">
			<div class="text8">글작성↑</div><div id="image5"><img alt="글작성.png" src="./image/글작성3.png" style="width:100px; height: 100px;"></div><div class="text10">${write_id}</div>
		</div>
	</div>
	<div id="caption3">
		<div id="title3"><h1> 채용공고 관리</h1></div>
		<hr>
		<div id="content4">채용공고를 한눈에 볼 수 있다<br>채용공고를 관리할 수 있다</div>
	</div>
	<div id="image_set3">
		<div id="image_text6">
			<div class="text11">채용공고</div><div id="image6"><img alt="채용공고.png" src="./image/공고1.png" style="width:100px; height: 100px;"></div><div class="text13">${rc_totalCnt}</div>
		</div>
		<div id="image_text7">
			<div class="text12">최근날짜</div><div id="image7"><img alt="최근날짜.png" src="./image/날짜2.png" style="width:100px; height: 100px;"></div><div class="text14">${rc_date}</div>
		</div>
	</div>
	<div id="search_box">
	<div class="search" id="search">
			<div id="select">	
				<select class="type" id="type" name="type">
					<option ${(type == "id")?"selected":"" } value='id'>아이디</option>
					<option ${(type == "name")?"selected":"" } value='name'>이름</option>
				</select>	
			</div>
			<div id="text">
				<input type="text" class="keyword" name="keyword" id="keyword" value="${keyword }" placeholder="Search">
			</div>
			<div id="btn2">
				<button type="button" class="btnSearch" id="btnSearch" name="btnSearch" data-type="${type }" data-keyword="${keyword }" data-current_page="${currentPage}"><b>검색</b></button>
<!-- 				<button type="button" class="btnSearch" name="btnSearch" data-test="1">검색1</button> -->
			</div>
	</div>
	<script>
		document.getElementById("caption0").style.display = "block";
		document.getElementById("content_set").style.display = "block";
		document.getElementById("search").style.display = "none";
		document.getElementById("caption").style.display = "none";
		document.getElementById("image_set").style.display = "none";
		document.getElementById("caption2").style.display = "none";
		document.getElementById("image_set2").style.display = "none";
		document.getElementById("caption3").style.display = "none";
		document.getElementById("image_set3").style.display = "none";
		
	</script>
	<div id="div_list"></div>
	</div></div></div>
	<script type="text/javascript">
// 		d3.selectAll("span")
// 		.datum(function () {return this.dataset})
// 		.style("height","10%")
// 		.style("left",(d,i)=>(i*80)+"px")
// 		.transition().duration(1500)
// 		.style("height",d=>d.val+"%");  
			
	</script>
	<script>
		
	 //테이블 정렬
    function sortTable(n){
       var table, rows, switching, o, x, y, shouldSwitch, dir, switchcount = 0;
       table = document.getElementById("communityListTable");
       switching = true;
       dir = "asc";
       
       while (switching) {
          switching = false;
          rows = table.getElementsByTagName("TR");
          
          for (o = 1; o < (rows.length -1); o++) {
             shouldSwitch = false;
             x = rows[o].getElementsByTagName("TD")[n];
             y = rows[o + 1].getElementsByTagName("TD")[n];
             
             if (dir == "asc") {
                if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                   shouldSwitch = true;
                   break;
                }
             } else if (dir == "desc") {
                if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                   shouldSwitch = true;
                   break;
                }
             }
          }
          
          if (shouldSwitch) {
             rows[o].parentNode.insertBefore(rows[o + 1], rows[o]);
             switching = true;
             switchcount++;
          } else {
             if (switchcount == 0 && dir == "asc") {
                dir = "desc";
                console.log('asc->desc');
                switching = true;
             }
          }
       }
    }
 
    function sortTableNumber(n){
        var table, rows, switching, o, x, y, shouldSwitch, dir, switchcount = 0;
        table = document.getElementById("communityListTable");
        switching = true;
        dir = "asc";
        
        while (switching) {
           switching = false;
           rows = table.getElementsByTagName("TR");
           
           for (o = 1; o < (rows.length -1); o++) {
              shouldSwitch = false;
              x = rows[o].getElementsByTagName("TD")[n];
              y = rows[o + 1].getElementsByTagName("TD")[n];
              
              if (dir == "asc") {
                 if (Number(x.innerHTML.toLowerCase()) > Number(y.innerHTML.toLowerCase())) {
                    shouldSwitch = true;
                    break;
                 }
              } else if (dir == "desc") {
                 if (Number(x.innerHTML.toLowerCase()) < Number(y.innerHTML.toLowerCase())) {
                    shouldSwitch = true;
                    break;
                 }
              }
           }
           
           if (shouldSwitch) {
              rows[o].parentNode.insertBefore(rows[o + 1], rows[o]);
              switching = true;
              switchcount++;
           } else {
              if (switchcount == 0 && dir == "asc") {
                 dir = "desc";
                 console.log('asc->desc');
                 switching = true;
              }
           }
        }
     }
	
	
	//ajax 리스트 불러오기		
		
		$(()=>{
			
			$('#button_member_list').click(()=>{
				$.ajax({
					url:'${pageContext.request.contextPath}/adminMemberSearch.do',
					dataType:'html',
					success: (result) => {
						$("#div_list").html(result);
						resetColor();
						addColor('#button_member_list');
					}
				})
			})			
			
			$('#button_community_list').click(()=>{ 
				$.ajax({
					url:'${pageContext.request.contextPath}/adminCommunityList.do',
					dataType:'html',
					success: (result) => {
						$('#div_list').html(result);
						resetColor();
						addColor('#button_community_list');
					}
				})		
			})

			$('#button_recruit_list').click(()=>{
				$.ajax({
					url:'${pageContext.request.contextPath}/adminRecruitList.do',
					dataType:'html',
					success: (result) => {
						$('#div_list').html(result);
						resetColor();
						addColor('#button_recruit_list');
					}
				})
			})
			
// 			$('.btnSearchdocument').click(()=>{
// 				$.ajax({
// 					url:'${pageContext.request.contextPath}/adminMemberSearch.do',
// 					dataType:'html',
// 					success: (searchlist) => {
// 						$('#div_list').html(searchlist);
// 					}
// 				})
// 			})
		
		})
		
		//버튼 색 변경 함수
		function resetColor() {
			$('.button_ajax').attr('style','color: lightgray !important; background-color: #002266 !important;');
		}

		function addColor(name){
			$(name).css("background-color","lightblue");
			$(name).css("color","black");
		}
		
		//ajax 멤버 검색
		
				
		
		//ajax 페이지 번호 링크 처리
		
		$(document).on(
				"click",
				".member_page",
				e => {
					var pageNum = $(e.currentTarget).data('value');
					var type = $(e.currentTarget).data('type');
					var keyword = $(e.currentTarget).data('keyword');
					$.ajax({
						url:'${pageContext.request.contextPath}/adminMemberSearch.do?pageNum='+pageNum
								+'&type='+type
								+'&keyword='+keyword,
						dataType:'html',
						success: (result) => {
							$('#div_list').html(result);
						}
					})
				});
		
		$(document).on(
				"click", 
				".community_page", 
				e =>{ 
					var pageNum = $(e.currentTarget).data('value');
					$.ajax({
						url:'${pageContext.request.contextPath}/adminCommunityList.do?pageNum='+pageNum,
						dataType:'html',
						success: (result) => {
							$('#div_list').html(result);
						}
					})
				});
		
		$(document).on(
				"click", 
				".recruit_page", 
				e =>{ 
					var pageNum = $(e.currentTarget).data('value');
					$.ajax({
						url:'${pageContext.request.contextPath}/adminRecruitList.do?pageNum='+pageNum,
						dataType:'html',
						success: (result) => {
							$('#div_list').html(result);
						}
					})
				});
		
		$(document).on(
				"click",
				".btnSearch",
				e => {
					var type = document.getElementById('type').value;
					var keyword = document.getElementById('keyword').value;
 					var current_page = $(e.currentTarget).data('current_page');
					$.ajax({
						url:'${pageContext.request.contextPath}/adminMemberSearch.do'+
						'?type='+type+
						'&keyword='+keyword,
// 						'&pageNum='+currentPage,
						dataType:'html',
						success: (result) => {
							$('#div_list').html(result);
						}
					})
				});
		
		$(document).on(
				"keyup",
				"#keyword",
				e => {
					var type = document.getElementById('type').value;
					var keyword = document.getElementById('keyword').value;
 					var current_page = document.getElementById('btnSearch').dataset.current_page;
					$.ajax({
						url:'${pageContext.request.contextPath}/adminMemberSearch.do'+
						'?type='+type+
						'&keyword='+keyword,
// 						'&pageNum='+currentPage,
						dataType:'html',
						success: (result) => {
							$('#div_list').html(result);

						}
					})
				});
		
		
		// 탈퇴
		$(document).on(
		"click",
		".button_update_member",
		e => {
			var m_id = $(e.currentTarget).data('m_id');
			var currentPage = $(e.currentTarget).data('current_page');
			$.ajax({
				url:'${pageContext.request.contextPath}/adminMemberUpdate.do'+
					'?m_id='+m_id+
					'&pageNum='+currentPage,
				dataType:'html',
				success: (result) => {
					$('#div_list').html(result);
					document.querySelector('.text5').innerText = Number(document.querySelector('.text5').innerText) - 1;
					document.querySelector('.text6').innerText = Number(document.querySelector('.text6').innerText) + 1;
				}
			})
		});
		
		// 탈퇴 해제
		$(document).on(
		"click",
		".button_recover_member",
		e => {
			var m_id = $(e.currentTarget).data('m_id');
			var currentPage = $(e.currentTarget).data('current_page');
			$.ajax({
				url:'${pageContext.request.contextPath}/adminMemberRecover.do'+
					'?m_id='+m_id+
					'&pageNum='+currentPage,
				dataType:'html',
				success: (result) => {
					$('#div_list').html(result);
					document.querySelector('.text5').innerText = Number(document.querySelector('.text5').innerText) + 1;
					document.querySelector('.text6').innerText = Number(document.querySelector('.text6').innerText) - 1;
				}				
			})
		});
		
		
		//삭제 함수	
		$(document).on(
		"click", 
		".button_delete_community", 
		e =>{ 
			var bd_code = $(e.currentTarget).data('bd_code');
			var bd_num = $(e.currentTarget).data('bd_num');
			var m_id = $(e.currentTarget).data('m_id');
			var currentPage = $(e.currentTarget).data('current_page');
			$.ajax({
				url:'${pageContext.request.contextPath}/adminCommunityDelete.do'+
					'?bd_code='+bd_code+
					'&bd_num='+bd_num+
					'&m_id='+m_id+
					'&pageNum='+currentPage,
				dataType:'html',
				success: (result) => {
					$('#div_list').html(result);
				}
			})
		});
		
		$(document).on(
				"click", 
				".button_delete_recruit", 
				e =>{ 
					var rc_num = $(e.currentTarget).data('rc_num');
					var currentPage = $(e.currentTarget).data('current_page');
					$.ajax({
						url:'${pageContext.request.contextPath}/adminRecruitDelete.do'+
							'?rc_num='+rc_num,
						dataType:'html',
						success: (result) => {
							$('#div_list').html(result);
							document.querySelector('.text13').innerText = Number(document.querySelector('.text13').innerText) - 1;
						}
					})
				});
		
	</script>
</body>
</html>