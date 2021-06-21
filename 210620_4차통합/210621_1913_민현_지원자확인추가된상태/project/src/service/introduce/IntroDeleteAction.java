package service.introduce;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import service.CommandProcess;

public class IntroDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int result = 0;
		MemberDao md = MemberDao.getInstance();
		HttpSession session = request.getSession();
		int si_num = Integer.parseInt(request.getParameter("si_num"));
		String m_id = (String)session.getAttribute("sessionID");
		try {
			result = md.self_delete(si_num, m_id);  
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		request.setAttribute("result", result);
		return "introduce/introduceDelete.jsp";
	}
}
