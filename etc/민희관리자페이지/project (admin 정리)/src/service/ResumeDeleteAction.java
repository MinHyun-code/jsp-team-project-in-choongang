package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;

public class ResumeDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int result = 0;
		MemberDao md = MemberDao.getInstance();
		HttpSession session = request.getSession();
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		String m_id = (String)session.getAttribute("sessionID");
		try {
			result = md.resume_delete(r_num, m_id);  
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		request.setAttribute("result", result);
		return "mypage/resumeDelete.jsp";
	}

}
