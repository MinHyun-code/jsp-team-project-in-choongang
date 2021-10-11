package service.recruit;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Classify;
import dao.RecruitDao;
import service.CommandProcess;

public class HireListDelAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		try {
		RecruitDao rd = RecruitDao.getInstance();
		HttpSession session = request.getSession();
		String m_id = String.valueOf(session.getAttribute("sessionID"));
		int rc_num = Integer.parseInt(request.getParameter("rc_num"));
		int result2 = rd.classify_delete(rc_num);
		int result3 = rd.likeCompany_delete(rc_num);
		int result4 = rd.apply_delete(rc_num); 
		int result = rd.recruit_delete(m_id, rc_num);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "hireList.do";
	}

}
