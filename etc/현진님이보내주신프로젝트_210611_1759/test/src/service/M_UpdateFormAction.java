package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Post;
import dao.Post_dao;

public class M_UpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int board_no = Integer.parseInt(request.getParameter("board_no"));
			int post_no = Integer.parseInt(request.getParameter("post_no"));
			
			String pageNum = request.getParameter("pageNum");
			Post_dao pd = Post_dao.getInstance();
			Post post = pd.select(board_no, post_no);
			
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("post", post);
		}catch(Exception e) {	
			System.out.println(e.getMessage());	}
		return "p_updateForm.jsp";
	}

}
