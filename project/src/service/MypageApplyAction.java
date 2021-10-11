package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ApplyRecruit;
import dao.Member;
import dao.MemberDao;

public class MypageApplyAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int result = 1;
		try {
			System.out.println("<MyInterestingPageStart>");
			HttpSession session = request.getSession();
			String m_id = String.valueOf(session.getAttribute("sessionID"));
			MemberDao md = MemberDao.getInstance();
            Member member = md.select(m_id);
			List<ApplyRecruit> list = md.my_list(m_id);
			request.setAttribute("list", list);
			//지원갯수 세기
			int applyCnt = md.applyCnt(m_id); 
			request.setAttribute("applyCnt", applyCnt); 
			request.setAttribute("member", member);
			
			int ap_cnt = md.ap_cnt(m_id);
			request.setAttribute("ap_cnt", ap_cnt);
			request.setAttribute("member", member);
			request.setAttribute("result", result);
		} catch (Exception e) {
		System.out.println(e.getMessage());
		}
		return "mypage/mypageApply.jsp";
	}
}

