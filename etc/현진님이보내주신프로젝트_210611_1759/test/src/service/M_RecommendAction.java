package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PostMember;
import dao.PostMember_dao;

public class M_RecommendAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			
			int board_no = Integer.parseInt(request.getParameter("board_no"));
			int post_no = Integer.parseInt(request.getParameter("post_no"));
			int recommend = Integer.parseInt(request.getParameter("recommend"));
			
			
			PostMember_dao pmd = PostMember_dao.getInstance();
//			PostMember postmember = new PostMember();
			pmd.recommend(board_no, post_no);			
			
//			request.setAttribute("postmember", postmember);
			request.setAttribute("recommend", recommend);
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "m_recommend.jsp";
	}

}
