package service;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
public class CommunityContentAction implements CommandProcess{
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			int bd_code = Integer.parseInt(request.getParameter("bd_code"));
			int bd_num = Integer.parseInt(request.getParameter("bd_num"));
			String pageNum = request.getParameter("pageNum");
			BoardDao bd = BoardDao.getInstance();
			bd.readCount(bd_code, bd_num); 
			Board board = bd.select(bd_code, bd_num);
			
//			request.setAttribute("bd_num", bd_num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("board", board);
		} catch(Exception e) { System.out.println(e.getMessage()); }
		return "community/communityContent.jsp";
	}
}