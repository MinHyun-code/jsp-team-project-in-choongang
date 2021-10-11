package service.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class CommunityEditProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String pageNum = request.getParameter("pageNum");
			request.setAttribute("pageNum", pageNum);
			
			int result;
			String sessionID = (String) request.getSession().getAttribute("sessionID");
			int bd_code = Integer.parseInt(request.getParameter("bd_code"));  
			int bd_num = Integer.parseInt(request.getParameter("bd_num"));
			String editedSubject = request.getParameter("subject");
			String editedContent = request.getParameter("content");
			String editedTags = request.getParameter("tags");
			
			BoardDao bd = BoardDao.getInstance();
			Board board = new Board();
			board.setBd_code(bd_code);
			board.setBd_num(bd_num);
			board.setM_id(sessionID);
			board.setSubject(editedSubject);
			board.setContent(editedContent);
			board.setTags(editedTags);
			result = bd.edit(board);
			request.setAttribute("result", result);
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "community/communityEditPro.jsp";
	}

}
