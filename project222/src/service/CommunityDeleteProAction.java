package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

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
			String m_id = (String) request.getSession().getAttribute("sessionID");
			
			// do 'delete' in dao.
			BoardDao bd = BoardDao.getInstance();
			int result = bd.delete(bd_code, bd_num, m_id);
			
			request.setAttribute("result", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "community/communityDeletePro.jsp";
	}

}
