package service.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Member;
import dao.MemberDao;
import service.CommandProcess;

public class MypageSelectAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 System.out.println("<myPageActon Start...>");
		try {
//			String m_id = request.getParameter("m_id");
//			session.setAttribute("sessionID", m_id);
			//Object - >String (Object to String) 형변환
			HttpSession session = request.getSession();
			String m_id =String.valueOf(session.getAttribute("sessionID"));
			
			System.out.println("m_id-->"+m_id);
			
			MemberDao md = MemberDao.getInstance();
			Member member = md.select(m_id);
			
			System.out.println(md);
			request.setAttribute("member", member);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "mypage/mypageUpdate.jsp";
	}

}
