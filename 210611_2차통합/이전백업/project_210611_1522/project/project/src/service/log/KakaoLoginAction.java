package service.log;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import service.CommandProcess;

public class KakaoLoginAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String m_id = (String) request.getAttribute("m_id");
		int loginResult = 0;
		try {
			MemberDao md = MemberDao.getInstance();
		    loginResult = md.kakaoLogin(m_id);
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
