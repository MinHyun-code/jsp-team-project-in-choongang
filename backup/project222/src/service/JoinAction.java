package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Member;
import dao.MemberDao;

public class JoinAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String m_id = request.getParameter("m_id");
		String m_pass = request.getParameter("m_pass");
		String m_birth = request.getParameter("m_birth");
		String m_name = request.getParameter("m_name");
		String m_addr = request.getParameter("m_addr");
		String m_gender = request.getParameter("m_gender");
		String m_email = request.getParameter("m_email");
		String m_phone = request.getParameter("m_phone");
		String m_pic = request.getParameter("m_pic");
		
		
		MemberDao md = MemberDao.getInstance();
		Member member = new Member();
		member.setM_id(m_id);
		member.setM_pass(m_pass);
		member.setM_birth(m_birth);
		member.setM_name(m_name);
		member.setM_addr(m_addr);
		member.setM_gender(m_gender);
		member.setM_email(m_email);
		member.setM_phone(m_phone);
		member.setM_pic(m_pic);
		int joinResult = 0;
		try {
			joinResult = md.join(member);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (joinResult == 1) {
			request.setAttribute("joinResult", joinResult);
			return "log/login.jsp";
		} else {
			request.setAttribute("joinResult", 0);
			return "log/join.jsp";
		}
	}

}
