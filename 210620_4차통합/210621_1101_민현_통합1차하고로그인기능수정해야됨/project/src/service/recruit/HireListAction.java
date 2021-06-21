package service.recruit;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RecruitDao;
import dao.RecruitDto;
import service.CommandProcess;

public class HireListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String rc_name = String.valueOf(session.getAttribute("sessionID"));
		RecruitDao rd = RecruitDao.getInstance();
		
		try {
			List<RecruitDto> list = rd.list(rc_name);
			request.setAttribute("list", list);
			request.setAttribute("rc_name", rc_name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "recruit/hireList.jsp";
	}

}
