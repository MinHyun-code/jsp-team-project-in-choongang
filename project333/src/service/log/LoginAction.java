package service.log;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import service.CommandProcess;

public class LoginAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("LoginActon Start...");
		request.setCharacterEncoding("UTF-8");
		String m_id = request.getParameter("m_id");
		String m_pass = request.getParameter("m_pass");

		// temp
		int m_tf = -1;

//		int loginResult = 0;
		try {
			MemberDao md = MemberDao.getInstance();
			m_tf = md.login(m_id, m_pass);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		if (m_tf != 2) {
			request.setAttribute("loginResult", 1);
			HttpSession session = request.getSession();
			session.setAttribute("sessionID", m_id);
			session.setAttribute("sessionM_TF", m_tf);
			return "main.jsp";
		} else {
			request.setAttribute("loginResult", 0);
			return "log/login.jsp";
		}
	}

}
