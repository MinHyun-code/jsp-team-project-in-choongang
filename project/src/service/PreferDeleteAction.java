package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.RecruitDao;

public class PreferDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		int result = 0;
		request.setCharacterEncoding("utf-8");
		RecruitDao rd = RecruitDao.getInstance();
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("sessionID");
		int rc_num = Integer.parseInt(request.getParameter("rc_num"));
		System.out.println("m_id, rc_num: " + m_id + ", " + rc_num);
		try {
		result = rd.prefer_delete(m_id, rc_num);
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		request.setAttribute("result", result);
		return "preferList.do";
	}
}
