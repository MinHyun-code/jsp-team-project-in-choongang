package service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RecruitDao;
import dao.RecruitDto;

public class PreferListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RecruitDao rda = RecruitDao.getInstance();
		
		HttpSession session = request.getSession();
		String m_id=String.valueOf(session.getAttribute("sessionID"));
		System.out.println("m_id --------->"+ m_id); //값 잘 들어옴
		ArrayList<RecruitDto> preferList = rda.preferList(m_id);
		System.out.print(preferList);
		request.setAttribute("preferList", preferList);
		return "mypage/mypagePreferList.jsp";
	}

}
