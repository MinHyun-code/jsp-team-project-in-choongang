package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RecruitDao;
import dao.RecruitDto;

public class PopUpHireUnionAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("union");
		System.out.println(name);
		
		try {
			RecruitDao rda = RecruitDao.getInstance();

			RecruitDto rdt = rda.popUpHireUnion(name);
			request.setAttribute("list",rdt);
						
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
		
		
		return "recruit/popUpHireUnion.jsp";
	}

}
