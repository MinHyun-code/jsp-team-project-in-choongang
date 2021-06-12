package service.log;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import service.CommandProcess;

public class JoinConfirmIdAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			String id = request.getParameter("m_id");
			MemberDao md = MemberDao.getInstance();
			int result = md.checkId(id);
			request.setAttribute("result", result);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return "log/confirmId.jsp";
	}

}
