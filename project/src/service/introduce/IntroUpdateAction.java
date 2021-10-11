package service.introduce;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.Self_Intro;
import service.CommandProcess;

public class IntroUpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			request.setCharacterEncoding("utf-8");
			MemberDao md = MemberDao.getInstance();
			Self_Intro self = new Self_Intro();
			
			self.setSi_num(Integer.parseInt(request.getParameter("si_num")));
			self.setM_id((String)request.getSession().getAttribute("sessionID"));
			self.setSi_ques(request.getParameter("si_ques"));
			self.setSi_content(request.getParameter("si_content"));
			
			int result = md.self_update(self);
			 
			request.setAttribute("result", result);			
			request.setAttribute("si_num", self.getSi_num());
			request.setAttribute("m_id", self.getM_id());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "introduce/introduceUpdatePro.jsp";
	}
}
