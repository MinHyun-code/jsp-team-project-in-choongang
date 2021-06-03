package service.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Comment;
import dao.CommentDao;
import service.CommandProcess;

public class CommunityCommentDeleteAction implements CommandProcess {

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
			
			cd.delete(comment);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}

		return "communityContent.do";
	}

}
