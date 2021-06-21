package service.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class CommunityEditFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("--CommunityEditProAction");
			request.setCharacterEncoding("utf-8");
			int bd_code = Integer.parseInt(request.getParameter("bd_code"));
			int bd_num = Integer.parseInt(request.getParameter("bd_num"));
			String sessionID = (String) request.getSession().getAttribute("sessionID");
			int pageNum = Integer.parseInt(request.getParameter("pageNum").equals("")? "1" : request.getParameter("pageNum"));
			
			
			// select
			BoardDao bd = BoardDao.getInstance();
			Board board = bd.select(bd_code, bd_num);
		
			if (board.getM_id().equals(sessionID)) {
				request.setAttribute("board", board);
				request.setAttribute("pageNum", pageNum);
			} else {
				return "community/community.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "community/communityEditForm.jsp";
	}

}
