package service.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class CommunityAnswerWriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String m_id = request.getParameter("m_id");
		int bd_code = Integer.parseInt(request.getParameter("bd_code"));
		int target_bd_num = Integer.parseInt(request.getParameter("target_bd_num"));
		String pageNum = request.getParameter("pageNum");
		
		//check sessionID
		if(m_id.equals("")) {
			System.out.println("sessionID is not verified");
			return "communityContent.do";
		}
		
		try {
			BoardDao bd = BoardDao.getInstance();
			
			Board board = new Board();
	        board.setBd_code(Integer.parseInt(request.getParameter("bd_code")));
	        board.setBd_num(target_bd_num);
	        board.setM_id(request.getParameter("m_id"));
	        board.setSubject(request.getParameter("subject"));
	        board.setContent(request.getParameter("content"));
	        board.setCategory(0);
	        board.setRead_count(0);
	        board.setTags(null);
	        board.setIs_adopted(0);
	        board.setFile_name(null);
			board.setRe_step(bd.searchMaxStep(target_bd_num)+1);
			board.setRe_level(2);
			
	         
	        bd.insert(board);
	        
	        
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "communityContent.do";
	}

}
