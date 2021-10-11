package service.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Member;
import dao.MemberDao;
import service.CommandProcess;

public class MypageUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("<myPageUpdatePro Start...>");
		try {
			request.setCharacterEncoding("utf-8");
			MemberDao md = MemberDao.getInstance();
			Member member = new Member();
			String m_birth1 = request.getParameter("m_birth1");
			String m_birth2 = request.getParameter("m_birth2");
			String m_birth3 = request.getParameter("m_birth3");
			
			String m_birth = m_birth1 + m_birth2 + m_birth3;
			
			member.setM_id((String)request.getSession().getAttribute("sessionID"));
			member.setM_pass(request.getParameter("m_pass"));
			member.setM_birth(m_birth);
			member.setM_name(request.getParameter("m_name"));
			member.setM_addr(request.getParameter("m_addr"));
			member.setM_email(request.getParameter("m_email"));
			member.setM_phone(request.getParameter("m_phone"));
			int result = md.update(member);

			request.setAttribute("result", result);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mypage/mypageUpdatePro.jsp";
	}

}
