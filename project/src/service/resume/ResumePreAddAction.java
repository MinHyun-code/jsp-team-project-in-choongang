package service.resume;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Member;
import dao.MemberDao;
import dao.Resume;
import service.CommandProcess;

public class ResumePreAddAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("sessionID");
		
		MemberDao md = MemberDao.getInstance();
		Resume resume = new Resume();
		
		resume.setM_id(m_id);
		
		int selfResult = 0;
		
		try {
			Member member = md.select(m_id);
			selfResult = md.resumePreAdd(resume); 
			request.setAttribute("resume", resume);
			request.setAttribute("member", member);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (selfResult == 1) {
			request.setAttribute("selfResult", selfResult);

			return "resume/resumeAdd.jsp";
		} else {
			request.setAttribute("selfResult", 0);
			return "resumeList.do";
		}
	}

}
