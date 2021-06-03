package service.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Comment;
import dao.CommentDao;
import service.CommandProcess;

public class CommunityCommentReplyAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		try {
			CommentDao cd = CommentDao.getInstance();
			Comment comment = new Comment();
			comment.setBd_code(Integer.parseInt(request.getParameter("bd_code")));
			comment.setBd_num(Integer.parseInt(request.getParameter("bd_num")));
			comment.setBd_cm_num(Integer.parseInt(request.getParameter("target_bd_cm_num")));
			comment.setM_id((String)request.getSession().getAttribute("sessionID"));
			comment.setContent(request.getParameter("content"));
			comment.setRef(Integer.parseInt(request.getParameter("target_ref")));
			comment.setRe_step(Integer.parseInt(request.getParameter("target_re_step")));
			comment.setRe_level(Integer.parseInt(request.getParameter("target_re_level")));
			
			cd.insertReply(comment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "communityContent.do";
	}

}
