package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PostMember;
import dao.PostMember_dao;

public class Ajax_M_Re_ReCommentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Ajax_M_ReCommentAction start");
		
		PostMember_dao pmd = PostMember_dao.getInstance();
		PostMember postmember = new PostMember();
		
		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html;charset=utf-8");
		
		try {
			int board_no = Integer.parseInt(request.getParameter("board_no"));
			int post_no = Integer.parseInt(request.getParameter("post_no"));
			String post_title = request.getParameter("post_title");
			int ref = Integer.parseInt(request.getParameter("ref"));
			int re_step = Integer.parseInt(request.getParameter("re_step"));
			int re_level = Integer.parseInt(request.getParameter("re_level"));
			String content = request.getParameter("content");
			String member_id = request.getParameter("member_id");
			String passwd = request.getParameter("passwd");
			
			postmember.setBoard_no(Integer.parseInt(request.getParameter("board_no")));
			postmember.setPost_no(Integer.parseInt(request.getParameter("post_no")));
			postmember.setRef(Integer.parseInt(request.getParameter("ref")));
			postmember.setRe_step(Integer.parseInt(request.getParameter("re_step")));
			postmember.setRe_level(Integer.parseInt(request.getParameter("re_level")));
			postmember.setPost_title(request.getParameter("post_title"));
			postmember.setContent(request.getParameter("content"));
//			postmember.setContent("content");
			postmember.setPasswd(request.getParameter("passwd"));
			postmember.setMember_id(request.getParameter("member_id"));
			
			
			System.out.println("Ajax_M_ReCommentAction  board_no-> " +board_no );
			System.out.println("Ajax_M_ReCommentAction  post_no-> " +post_no );
			System.out.println("Ajax_M_ReCommentAction  post_title-> " +post_title );
			System.out.println("Ajax_M_ReCommentAction  ref-> " +ref );
			System.out.println("Ajax_M_ReCommentAction  re_step-> " +re_step );
			System.out.println("Ajax_M_ReCommentAction  re_level-> " +re_level );
			System.out.println("Ajax_M_ReCommentAction  member_id -> " +member_id );
			System.out.println("Ajax_M_ReCommentAction  passwd -> " + passwd);
				
			
			int result = pmd.insert(postmember);
			
			System.out.println("Ajax_M_ReCommentAction  result-> " +result );
			
			request.setAttribute("content", content);
			System.out.println("Ajax_M_ReCommentAction  content-> " +content );

			
			
		} catch (Exception e) {
			System.out.println("Ajax_M_ReCommentAction Exception->" + e.getMessage());
		}
		
		return "Ajax_M_ReCommentAction";
	}

}
