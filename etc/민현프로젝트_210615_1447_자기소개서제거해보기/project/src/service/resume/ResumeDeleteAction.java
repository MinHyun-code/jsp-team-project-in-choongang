package service.resume;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import service.CommandProcess;

public class ResumeDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int result = 0;
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		int result5 = 0;
		
		MemberDao md = MemberDao.getInstance();
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("sessionID");
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		try {
			result1 = md.resume_intro_delete(r_num);
			result2 = md.resume_myedu_delete(r_num);
			result3 = md.resume_licence_delete(r_num);
			result4 = md.resume_career_delete(r_num);
			result5 = md.resume_apply_delete(r_num);
			result = md.resume_delete(r_num, m_id);  
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		request.setAttribute("result1", result1);
		request.setAttribute("result2", result2);
		request.setAttribute("result3", result3);
		request.setAttribute("result4", result4);
		request.setAttribute("result5", result5);
		request.setAttribute("result", result);
		return "resume/resumeDelete.jsp";
	}

}
