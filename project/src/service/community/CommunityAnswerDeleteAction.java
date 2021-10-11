package service.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import service.CommandProcess;

public class CommunityAnswerDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			int answer_bd_code = Integer.parseInt(request.getParameter("answer_bd_code"));
			int answer_bd_num = Integer.parseInt(request.getParameter("answer_bd_num"));
			String sessionID = (String) request.getSession().getAttribute("sessionID");
			
			BoardDao bd = BoardDao.getInstance();
			int result = bd.delete(answer_bd_code, answer_bd_num, sessionID);
			System.out.println("result of bd.delete: " + result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} 
		return "communityContent.do";
	}

}
