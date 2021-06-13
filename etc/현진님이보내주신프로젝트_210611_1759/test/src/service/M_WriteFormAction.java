package service;



import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import dao.PostMember;
import dao.PostMember_dao;

public class M_WriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		System.out.println("WriteFormAction Start...");
		
		
	  try {
    	  	
			int post_no = 0, ref = 0, re_level = 0, re_step = 0;
			int board_no = 1;
//			String member_id = request.getParameter("member_id");
			String member_id = "ex0001";			
    		String pageNum = request.getParameter("pageNum");
    			
    		
    		if (pageNum == null) {
    			pageNum = "1";
    		}
    		
     		if (request.getParameter("member_id") == "ex0010") {
     			
				member_id = request.getParameter("member_id");
     		}
     		
    		// 댓글용도 
     		if(request.getParameter("post_no") != null) {
				
				board_no = Integer.parseInt(request.getParameter("board_no"));
				post_no = Integer.parseInt(request.getParameter("post_no"));
				PostMember_dao pmd = PostMember_dao.getInstance();
				  PostMember postmember = new PostMember();
				
				
				pmd.select(board_no, post_no);
				
				ref = postmember.getRef();
				re_level = postmember.getRe_level();
				re_step = postmember.getRe_step();
			}
     		
			request.setAttribute("board_no", board_no);
			request.setAttribute("post_no", post_no);
			request.setAttribute("member_id", member_id);
			
			request.setAttribute("ref", ref);
			request.setAttribute("re_level", re_level);
			request.setAttribute("re_step", re_step);
			request.setAttribute("pageNum", pageNum);
			
			
		}catch(Exception e) {	
			System.out.println(e.getMessage());	
		}
      
	  return "m_writeForm.jsp";
	}

}
