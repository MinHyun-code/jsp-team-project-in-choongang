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
	<button id="button_community_list">커뮤니티</button>
	<button id="button_recruit_list">채용공고</button>
	<div id="div_list"></div>
	<script>
		//ajax 리스트 불러오기
		$(()=>{
			$('#button_community_list').click(()=>{
				$.ajax({
					url:'${pageContext.request.contextPath}/AdminCommunityList.do',
					dataType:'html',
					success: (result) => {
						$('#div_list').html(result);
					}
				})
				
		
			})
			$('#button_recruit_list').click(()=>{
				$.ajax({
					url:'${pageContext.request.contextPath}/AdminRecruitList.do',
					dataType:'html',
					success: (result) => {
						$('#div_list').html(result);
					}
				})
			})	
		
		})
		
		//ajax 페이징
		$(document).on(
				"click", 
				".community_page", 
				e =>{ 
					var pageNum = $(e.currentTarget).data('val');
					$.ajax({
						url:'${pageContext.request.contextPath}/AdminCommunityList.do?pageNum='+pageNum,
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
					var pageNum = $(e.currentTarget).data('val');
					$.ajax({
						url:'${pageContext.request.contextPath}/AdminRecruitList.do?pageNum='+pageNum,
						dataType:'html',
						success: (result) => {
							$('#div_list').html(result);
						}
					})
				});
	</script>
</body>
</html>