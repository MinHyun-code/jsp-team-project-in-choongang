package service.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Comment;
import dao.CommentDao;
import service.CommandProcess;

public class CommunityCommentWriteAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String sessionID = (String)request.getSession().getAttribute("sessionID");
		if(sessionID == null || sessionID.equals("")) {
			System.out.println("non-member try to write comment");
			return "communityContent.do";
		}
		
		try {
			CommentDao cd = CommentDao.getInstance();
			Comment comment = new Comment();
			comment.setBd_code(Integer.parseInt(request.getParameter("bd_code")));
			comment.setBd_num(Integer.parseInt(request.getParameter("bd_num")));
			comment.setM_id((String)request.getSession().getAttribute("sessionID"));
			comment.setContent(request.getParameter("content"));
			cd.write(comment);
			
			System.out.println("comment.setContent: "+ comment.getContent());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		
		return "communityContent.do";
	}
	
}
