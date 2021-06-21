package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RecruitDao;

public class LikeCompanyAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("---LikeCompanyAction");
		RecruitDao rda = RecruitDao.getInstance();
		int result = 0;
		HttpSession session = request.getSession();
		String m_id=String.valueOf(session.getAttribute("sessionID"));
		int rc_num = Integer.parseInt(request.getParameter("rc_num"));
		try {
			System.out.println("before insertLikeCompany");
			result = rda.insertLikeCompany(m_id, rc_num); // 데이터 베이스의 모든 값을 가지는 ArrayList객체를 만드는 일을 하는 메소드 rclist
			System.out.println("result: " + result);
			request.setAttribute("result", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "recruit/likeCompany.jsp";
		}

}
