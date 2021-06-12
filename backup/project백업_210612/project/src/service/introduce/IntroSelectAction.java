package service.introduce;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.Self_Intro;
import service.CommandProcess;

public class IntroSelectAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		MemberDao md = MemberDao.getInstance();
		int si_num = Integer.parseInt(request.getParameter("si_num"));
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("sessionID");
		
		try {
			Self_Intro self = md.self_select(si_num, m_id);
			request.setAttribute("si_num", si_num);
			request.setAttribute("self", self);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "introduce/introduceUpdate.jsp";
	}

}
