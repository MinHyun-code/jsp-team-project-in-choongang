<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/community/temp/ajax001.css">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
</head>
<body>
	<button id="button_community_list" class="button_ajax">커뮤니티</button>
	<button id="button_recruit_list" class="button_ajax">채용공고</button>
	<div id="div_list"></div>
	<script>
		//ajax 리스트 불러오기
		$(()=>{
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
		
		})
		
		//버튼 색 변경 함수
		function resetColor() {
			$('.button_ajax').attr('style','color: lightgray !important; background-color: #d3d3d338 !important;');
		}

		function addColor(name){
			$(name).css("background-color","lightblue");
			$(name).css("color","white");
		}
		
		//ajax 페이지 번호 링크 처리
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
</body>
</html>