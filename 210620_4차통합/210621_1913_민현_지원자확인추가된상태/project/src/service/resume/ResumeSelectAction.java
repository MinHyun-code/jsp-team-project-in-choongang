package service.resume;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Career;
import dao.Member;
import dao.MemberDao;
import dao.Resume;
import dao.Resume_Edu;
import dao.Resume_Intro;
import dao.Resume_Licence;
import service.CommandProcess;

public class ResumeSelectAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		MemberDao md = MemberDao.getInstance();
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("sessionID");
		try {
			Member member = md.select(m_id);
			Resume resume = md.resume_select(r_num, m_id);
			List<Resume_Edu> edu_list = md.edu_select(r_num, m_id); 
			List<Resume_Intro> intro_list = md.intro_select(r_num, m_id); 
			List<Resume_Licence> licence_list = md.licence_select(r_num, m_id); 
			List<Career> career_list = md.career_select(r_num, m_id); 
			
			request.setAttribute("resume", resume);
			request.setAttribute("member", member);
			request.setAttribute("edu_list", edu_list);
			request.setAttribute("intro_list", intro_list);
			request.setAttribute("licence_list", licence_list);
			request.setAttribute("career_list", career_list);
			
			System.out.println(edu_list.get(0).getMyedu_sdate());
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "resume/resumeUpdate.jsp";
	}


}
