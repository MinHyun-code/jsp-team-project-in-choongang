package service.recruit;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Apply;
import dao.RecruitDao;
import dao.RecruitDto;
import service.CommandProcess;

public class HireApplyAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		RecruitDao rd = RecruitDao.getInstance();
		
		try {
			int rc_num = Integer.parseInt(request.getParameter("rc_num")); 
			List<Apply> list = rd.applyList(rc_num); 
			request.setAttribute("list", list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "recruit/hireApply.jsp";
	}
}
