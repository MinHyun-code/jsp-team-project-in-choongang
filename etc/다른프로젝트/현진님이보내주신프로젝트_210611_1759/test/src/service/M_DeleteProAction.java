package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PostMember_dao;


public class M_DeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. Parameter -> num ,passwd,  pageNum
		// 2. BoardDao bd 생성
		// 3. int result = bd.delete(num, passwd);
		// 4. request -> num , pageNum , result 저장
		try {
			int board_no = Integer.parseInt(request.getParameter("board_no"));
			int post_no = Integer.parseInt(request.getParameter("post_no"));
			
			String passwd = request.getParameter("passwd");
			String pageNum = request.getParameter("pageNum");
			
			PostMember_dao pmd = PostMember_dao.getInstance();
			int result = pmd.delete(board_no, post_no, passwd); 
			
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("board_no", board_no);
			request.setAttribute("post_no", post_no);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "m_deletePro.jsp";
	}

}
