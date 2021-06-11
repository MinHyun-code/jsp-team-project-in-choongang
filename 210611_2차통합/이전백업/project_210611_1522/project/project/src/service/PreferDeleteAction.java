package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RecruitDao;

public class PreferDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			RecruitDao rda = RecruitDao.getInstance();
			int rc_num = Integer.parseInt(request.getParameter("rc_num"));
			String m_id = request.getParameter("m_id");
			String pageNum = request.getParameter("pageNum"); 
			int result = rda.delete(rc_num,m_id);
			System.out.println("result-->>>>>>"+result);  
			System.out.println("rc_num----->"+rc_num); 
			System.out.println("m_id----->"+m_id);
			
			request.setAttribute("result", result);
			request.setAttribute("rc_num", rc_num);
			request.setAttribute("m_id",m_id);
			request.setAttribute("pageNum", pageNum);
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return "recruit/preferDeleteList.jsp";
	}

}
