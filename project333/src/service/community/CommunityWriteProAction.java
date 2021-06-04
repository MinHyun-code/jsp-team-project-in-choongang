package service.community;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.Board;
import dao.BoardDao;
import service.CommandProcess;
public class CommunityWriteProAction implements CommandProcess {
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("--CommunityWriteProAction");
	        request.setCharacterEncoding("utf-8"); 
	        String pageNum = request.getParameter("pageNum");
	        Board board = new Board();
	        board.setBd_code(Integer.parseInt(request.getParameter("bd_code")));
//			board.setBd_num(Integer.parseInt(request.getParameter("bd_num")));
	        board.setM_id(request.getParameter("m_id"));
	        board.setSubject(request.getParameter("subject"));
	        board.setContent(request.getParameter("content"));
	        board.setCategory(0);
	        board.setRead_count(0);
	        board.setTags(null);
	        board.setIs_adopted(0);
	        board.setFile_name(null);
//	        board.setRef(Integer.parseInt(request.getParameter("bd_num")));
			board.setRe_step(1);
			board.setRe_level(1);
			System.out.println("hihi");
	        BoardDao bd = BoardDao.getInstance();//DB 
	        int result = bd.insert(board);
	        System.out.println("result: "+result);
//	        request.setAttribute("bd_num", board.getBd_num());
	        request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
		} catch(Exception e) { 
			e.printStackTrace(); }
        return "community/communityWritePro.jsp";
	}
}