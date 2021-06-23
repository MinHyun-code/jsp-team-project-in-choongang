package service.log;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import service.CommandProcess;

public class FindPassAction implements CommandProcess {

	@Override
	  public String requestPro(HttpServletRequest request, HttpServletResponse response)
		         throws ServletException, IOException {
		   System.out.println("<FindPassActionStart>");
		   request.setCharacterEncoding("utf-8");
		   MemberDao md = MemberDao.getInstance();
		   
		      String m_id = request.getParameter("m_id");   
		      String m_name = request.getParameter("m_name");
		      String m_email = request.getParameter("m_email");
		      String m_pass ="";
		      System.out.println(m_name);
		      System.out.println(m_email);
		      System.out.println(m_id);
		      try {
		         
		      m_pass = md.findPass(m_name, m_email, m_id);
		      
		      request.setAttribute("m_pass", m_pass);
		      
		      } catch (SQLException e) {      
		         e.printStackTrace();}
		      System.out.println("m_pass: "+ m_pass);
		      if (m_pass==null)   return "log/findPass.jsp";
		      else          return "log/findPassAfter.jsp";
		   }

		}