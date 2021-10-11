package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.Resume;

public class ApplyAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	System.out.println("<ApplyAction Start>");
	MemberDao md = MemberDao.getInstance();
	HttpSession session = request.getSession();
	String m_id = (String)session.getAttribute("sessionID");
	int rc_num = Integer.parseInt(request.getParameter("rc_num"));
	request.setAttribute("rc_num", rc_num);
	try {
		List<Resume> resumeList = md.resume_list(m_id);
		request.setAttribute("resumeList", resumeList);
		System.out.println("resumeList.size: "+ resumeList.size());
		System.out.println("resumeList: "+resumeList.get(0).getR_title());
		int result = md.applyCheck(m_id,rc_num);
		request.setAttribute("result", result);
	} catch (Exception e) {
		// TODO: handle exception
	}
		return "mypage/apply.jsp";
	}

}
