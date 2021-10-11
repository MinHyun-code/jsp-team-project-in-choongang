package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Member;
import dao.MemberDao;
import dao.RecruitDao;
import dao.RecruitDto;

public class PreferListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RecruitDao rda = RecruitDao.getInstance();
		MemberDao md = MemberDao.getInstance();
		
		int result = 1;
		HttpSession session = request.getSession();
		String m_id=String.valueOf(session.getAttribute("sessionID"));
		try {
			ArrayList<RecruitDto> preferList = rda.preferList(m_id);
            Member member = md.select(m_id);
			int preferCnt = rda.preferCnt(m_id);
			int preferCnt2 = rda.preferCnt2(m_id);
			request.setAttribute("preferList", preferList);
			request.setAttribute("preferCnt", preferCnt);
			request.setAttribute("preferCnt2", preferCnt2);
			request.setAttribute("member", member);
			request.setAttribute("result", result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "recruit/preferList.jsp";
	}

}
