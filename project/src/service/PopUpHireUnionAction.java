package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Classify;
import dao.PopUpHire;
import dao.RecruitDao;
import dao.RecruitDto;

public class PopUpHireUnionAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int rc_num = Integer.parseInt(request.getParameter("rc_num"));
		 
		try {
			RecruitDao rda = RecruitDao.getInstance();
			PopUpHire popUp = rda.popUpHireUnion(rc_num);
			int mclass = rda.popUpHireUnion2(rc_num);
			request.setAttribute("list",popUp);
			request.setAttribute("mclass",mclass);
						 
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
		
		
		return "recruit/popUpHireUnion.jsp";
	}

}
