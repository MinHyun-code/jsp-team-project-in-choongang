package service.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import service.CommandProcess;

public class AdminRecruitDeleteAjax implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			
			
			int rc_num = Integer.parseInt(request.getParameter("rc_num"));
			
			MemberDao md = MemberDao.getInstance();
			int result = md.delete(rc_num);
			
			request.setAttribute("result", result);
		} catch (Exception e) {
			e.getStackTrace();
		}
		return "adminRecruitList.do";
	}

}
