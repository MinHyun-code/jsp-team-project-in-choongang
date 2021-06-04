package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;

public class LoginAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		 System.out.println("LoginActon Start...");
		
		String m_id = request.getParameter("m_id");
		String m_pass = request.getParameter("m_pass");
		
		int loginResult = 0;
		try {
			MemberDao md = MemberDao.getInstance();
		    loginResult = md.login(m_id, m_pass);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		if (loginResult == 1) {
			request.setAttribute("loginResult", loginResult);
			HttpSession session = request.getSession();
			session.setAttribute("sessionID", m_id);
			return "main.jsp";
		} else {
			request.setAttribute("loginResult", loginResult);
			return "log/login.jsp";
		}
	}

}
