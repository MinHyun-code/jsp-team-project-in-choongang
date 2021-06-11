package service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RecruitDao;
import dao.RecruitDto;

public class SearchingAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RecruitDao rda = RecruitDao.getInstance();
		
		String standard = request.getParameter("standard");
		String name = request.getParameter("name");
			
		
//	 String standard_ = "clvalue1";
//	 if(standard !=null ) {standard=standard_; }
//	 String standard_ = "clvalue2";
//	 if(standard !=null ) {standard=standard_; }
//	 String standard_ = "clvalue3";
//	 if(standard !=null ) {standard=standard_; }
//	 String name_ = "rc_name";
//	  if(name !=null ) {name=name_; }
	
		 
		try {
			
			ArrayList<RecruitDto> searching = rda.searching(standard,name);
			request.setAttribute("searchlist",searching);
			System.out.println("searching");
			System.out.println("size: " + searching.size());
//			System.out.println(searching.get(0).getRc_name());
//			System.out.println(searching.get(1).getRc_name());
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return "recruit/searching.jsp";
	}

}
