package service.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.CommentDao;
import service.CommandProcess;

public class CommunityDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// get parameter in request.
			System.out.println("--CommunityDeleteProAction");
			request.setCharacterEncoding("utf-8");
			int bd_code = Integer.parseInt(request.getParameter("bd_code"));
			int bd_num = Integer.parseInt(request.getParameter("bd_num"));
			String m_id = request.getParameter("m_id");
			String sessionID = (String) request.getSession().getAttribute("sessionID");
			
			// check whether request is writer or not
			if (!m_id.equals(sessionID)) {
				int result = -3;
				request.setAttribute("result", result);
				return "community/communityDeletePro.jsp";
			}
			
			// delete comments in the post(board)
			CommentDao cd = CommentDao.getInstance();
			cd.deleteForBoard(bd_code, bd_num);
			
			
			// do 'delete' in dao.
			BoardDao bd = BoardDao.getInstance();
			int result = bd.delete(bd_code, bd_num, sessionID);
			if(result > 0) { // do 'delete' related answer
				bd.deleteAnswer(bd_code, bd_num);
			}
			
			request.setAttribute("result", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "community/communityDeletePro.jsp";
	}

}
