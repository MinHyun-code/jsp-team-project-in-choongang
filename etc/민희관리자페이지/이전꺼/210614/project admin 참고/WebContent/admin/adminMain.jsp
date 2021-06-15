<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/adminMain.css">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
</head>
<body>
	<h1>(톱니바퀴) 관리자페이지</h1>
	<br>
	<br>
	<button id="button_member_list" class="button_ajax">회원관리</button>
	<button id="button_community_list" class="button_ajax">커뮤니티</button>
	<button id="button_recruit_list" class="button_ajax">채용공고</button>
	<table class="search">
		<tr>
			<td>
				<select class="type" id="type" name="type">
					<option ${(type == "id")?"selected":"" } value='id'>아이디</option>
					<option ${(type == "name")?"selected":"" } value='name'>이름</option>
				</select>
			</td>
			<td>
				<input type="text" class="keyword" name="keyword" id="keyword" value="${keyword }">
			</td>
			<td>
				<button type="button" class="btnSearch" id="btnSearch" name="btnSearch" data-type="${type }" data-keyword="${keyword }" data-current_page="${currentPage}">검색</button>
				<!-- 				<button type="button" class="btnSearch" name="btnSearch" data-test="1">검색1</button> -->
			</td>
		</tr>
	</table>
	<div id="div_list"></div>
	<script>
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
			$('.button_ajax').attr('style','color: lightgray !important; background-color: #d3d3d338 !important;');
		}

		function addColor(name){
			$(name).css("background-color","lightblue");
			$(name).css("color","white");
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
// 							document.getElementById('keyword').focus();
							var len = $('#keyword').val().length;
							$('#keyword').focus();
							$('#keyword')[0].setSelectionRange(len, len);
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
	</script>
	<script>
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
	
	</script>
</body>
</html>