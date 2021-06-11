package service.log;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Member;
import dao.MemberDao;
import service.CommandProcess;

public class KakaoJoinAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String m_id = request.getParameter("m_id");
		String m_gender = request.getParameter("m_gender");
		String m_email = request.getParameter("m_email");
		MemberDao md = MemberDao.getInstance();
		Member member = new Member();
		member.setM_id(m_id);
		member.setM_gender(m_gender);
		member.setM_email(m_email);
		int joinResult = 0;
		try {
			joinResult = md.join(member);
			request.setAttribute("m_id", m_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("joinResult", joinResult);
		request.setAttribute("m_id", m_id);
		return "kakaoLogin.do";
	}
}
