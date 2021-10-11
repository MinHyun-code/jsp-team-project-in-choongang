package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Apply;
import dao.ApplyRecruit;
import dao.MemberDao;

public class ApplyAddAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		MemberDao md = MemberDao.getInstance();
		Apply apply = new Apply();
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("sessionID");
		
		int rc_num = Integer.parseInt((String)request.getParameter("rc_num"));
		int r_num = Integer.parseInt((String)request.getParameter("r_num"));
		

		apply.setM_id(m_id);
		apply.setRc_num(rc_num);
		apply.setR_num(r_num);
		
		int applyResult = 0; 
		request.setAttribute("result", applyResult);
		try {
			applyResult = md.applyAdd(apply); 
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		if (applyResult == 1) {
			return "mypage/applyComplete.jsp";
		} else {
			return "apply.do";
		}
	}

}
