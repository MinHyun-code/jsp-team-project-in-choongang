package service.log;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import service.CommandProcess;

public class FindIdAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("<FindIDActionStart>");
		request.setCharacterEncoding("utf-8");
		MemberDao md = MemberDao.getInstance();
		
		
			String m_name = request.getParameter("m_name");
			String m_email = request.getParameter("m_email");
			String m_id ="";
			System.out.println(m_name);
			System.out.println(m_email);
			try {
				
			m_id = md.findId(m_name, m_email);
			
			request.setAttribute("m_id", m_id);
			
			} catch (SQLException e) {		
				e.printStackTrace();}
			System.out.println("m_id: "+ m_id);
			if (m_id==null)	return "log/findId.jsp";
			else 			return "log/findIdAfter.jsp";
	}

}