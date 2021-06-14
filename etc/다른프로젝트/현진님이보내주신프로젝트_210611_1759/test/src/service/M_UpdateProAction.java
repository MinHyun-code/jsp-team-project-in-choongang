package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.Post;
import dao.PostMember;
import dao.Post_dao;

public class M_UpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try { 
			request.setCharacterEncoding("utf-8"); 
	        String pageNum = request.getParameter("pageNum");
	        PostMember postmember = new PostMember();
	        postmember.setNum(Integer.parseInt(request.getParameter("num")));
	        postmember.setWriter(request.getParameter("writer"));
	        postmember.setEmail(request.getParameter("email"));
	        postmember.setSubject(request.getParameter("subject"));
	        postmember.setPasswd(request.getParameter("passwd"));
	        postmember.setContent(request.getParameter("content"));
	        postmember.setIp(request.getRemoteAddr());
			Post_dao pd = Post_dao.getInstance();
			int result = pd.update(post);
			
			request.setAttribute("result", result);
			request.setAttribute("num", board.getNum());
			request.setAttribute("pageNum", pageNum);
		} catch(Exception e) { 
			System.out.println(e.getMessage()); 
		}
		return "updatePro.jsp";	}

}
