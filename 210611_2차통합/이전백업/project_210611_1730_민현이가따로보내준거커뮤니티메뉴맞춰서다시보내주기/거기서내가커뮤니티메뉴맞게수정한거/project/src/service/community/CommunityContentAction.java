package service.community;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.Comment;
import dao.CommentDao;
import service.CommandProcess;
public class CommunityContentAction implements CommandProcess{
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			final int QnA = 2;
			int bd_code = Integer.parseInt(request.getParameter("bd_code"));
			int bd_num = Integer.parseInt(request.getParameter("bd_num"));
			String pageNum = request.getParameter("pageNum");
			BoardDao bd = BoardDao.getInstance();
			bd.readCount(bd_code, bd_num); 
			Board board = bd.select(bd_code, bd_num);
			
			//QnA
			if(board.getBd_code() == QnA) {
				List<Board> answerList = bd.selectAnswer(bd_code, bd_num);
				request.setAttribute("answerList", answerList);
			}
			
			
			CommentDao cd = CommentDao.getInstance();
			List<Comment> commentList = cd.select(board);
			
//			request.setAttribute("bd_num", bd_num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("board", board);
			request.setAttribute("commentList", commentList);
		} catch(Exception e) { System.out.println(e.getMessage()); }
		return "community/communityContent.jsp";
	}
}