<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>

	<h2>게시물을 삭제하시려면 암호를 입력하세요</h2>
	<form action="m_deletePro.do">
	
		<input type="hidden" name="board_no" value="${postmember.board_no }">
		<input type="hidden" name="post_no" value="${postmember.post_no }">
		<input type="hidden" name="pageNum" value="${postmember.pageNum }">
		
		암호 : <input type="text" name="passwd"><p>
		
		<input type="submit" value="확인">
	</form>

</body>
</html>