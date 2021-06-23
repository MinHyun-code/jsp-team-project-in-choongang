package service.introduce;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.Self_Intro;
import service.CommandProcess;

public class IntroAddAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String si_ques = request.getParameter("si_ques");
		String si_content = request.getParameter("si_content");		
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("sessionID");
		
		MemberDao md = MemberDao.getInstance();
		Self_Intro self = new Self_Intro(); 
		
		self.setM_id(m_id);
		self.setSi_ques(si_ques);
		self.setSi_content(si_content);
		
		int selfResult = 0;
		
		try {
			selfResult = md.selfAdd(self);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (selfResult == 1) {
			request.setAttribute("selfResult", selfResult);
			return "introduceList.do";
		} else {
			request.setAttribute("selfResult", 0);
			return "introduce/introduceAdd.jsp";
		}
	}
}
