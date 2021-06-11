package service.resume;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Member;
import dao.MemberDao;
import dao.Resume;
import dao.Self_Intro;
import service.CommandProcess;

public class ResumeSelectAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		MemberDao md = MemberDao.getInstance();
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("sessionID");
		try {
			Member member = md.select(m_id);
			Resume resume = md.resume_select(r_num, m_id);
			
			request.setAttribute("resume", resume);
			request.setAttribute("member", member);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "resume/resumeUpdate.jsp";
	}

}
