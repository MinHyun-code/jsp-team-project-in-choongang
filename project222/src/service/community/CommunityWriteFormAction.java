package service.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class CommunityWriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
      try {
    	  	request.setCharacterEncoding("utf-8"); 
    		String pageNum = request.getParameter("pageNum");
    		if (pageNum == null) pageNum = "1";
    		if (request.getParameter("subject") != null) {
    			System.out.println(request.getParameter("subject"));
    		}
		}catch(Exception e) {	
			System.out.println(e.getMessage());	
		}
      
	  return "community/communityWriteForm.jsp";
	}

}
