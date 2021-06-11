package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RecruitDao;

public class LikeCompanyAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("---LikeCompanyAction");
		RecruitDao rda = RecruitDao.getInstance();

		String m_id = request.getParameter("m_id");
		int rc_num = Integer.parseInt(request.getParameter("rc_num"));
		try {
			System.out.println("before insertLikeCompany");
			int result = rda.insertLikeCompany(m_id, rc_num); // 데이터 베이스의 모든 값을 가지는 ArrayList객체를 만드는 일을 하는 메소드 rclist
			System.out.println("result: " + result);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "recruit/likeCompany.jsp";

	}

}
