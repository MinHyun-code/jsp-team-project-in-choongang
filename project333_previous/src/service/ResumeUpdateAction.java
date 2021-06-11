package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.Resume;

public class ResumeUpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			System.out.println("----ResumeUpdateAction.java");			
			request.setCharacterEncoding("utf-8");
			MemberDao md = MemberDao.getInstance();
			Resume resume = new Resume();
//			resume.setR_num(Integer.parseInt(request.getParameter("r_num")));
			resume.setR_num(Integer.parseInt((String)request.getAttribute("r_num")));
			
			resume.setM_id((String)request.getSession().getAttribute("sessionID"));
			
			
//			resume.setR_title(request.getParameter("r_title"));
//			resume.setR_pic(request.getParameter("r_pic"));
//			resume.setR_file(request.getParameter("r_file"));
			resume.setR_title((String)request.getAttribute("r_title"));
			resume.setR_pic((String)request.getAttribute("upLoadFilename2"));
			resume.setR_file((String)request.getAttribute("upLoadFilename"));
			System.out.println((String)request.getAttribute("r_title"));
			System.out.println("in ResumeUpdateAction: "+(String)request.getAttribute("upLoadFilename"));
			
			
			
			
			int result = md.resume_update(resume);
			 
			request.setAttribute("result", result);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "resumeList.do";
	}

}
