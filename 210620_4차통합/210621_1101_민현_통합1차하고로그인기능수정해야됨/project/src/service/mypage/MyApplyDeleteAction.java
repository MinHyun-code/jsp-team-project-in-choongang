package service.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import service.CommandProcess;

public class MyApplyDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("<MyApplyDeleteAction Start>");
		
		int result = 0;
		request.setCharacterEncoding("utf-8");
		MemberDao md = MemberDao.getInstance();
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("sessionID");
		int rc_num = Integer.parseInt(request.getParameter("rc_num"));
		System.out.println("m_id, rc_num: " + m_id + ", " + rc_num);
		try {
		result = md.myapply_delete(m_id, rc_num);
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		request.setAttribute("result", result);
		return "mypageApply.do";
	}

}
