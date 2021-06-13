package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class ListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		BoardDao bd = BoardDao.getInstance();
		
		try {
			int board_no=1;
			int totCnt = bd.getTotalCnt(board_no);
			request.setAttribute("totCnt", totCnt);
			String pageNum = request.getParameter("pageNum");
			if (pageNum==null || pageNum.equals("")) {pageNum ="1";}
			
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage - 1)* pageSize+1;
			int endRow = startRow + pageSize -1 ;
			int startNum = totCnt - startRow +1;
			List<Board> list = bd.list(startRow, endRow, board_no);  
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			int startPage = (int)(currentPage -1 )/blockSize*blockSize +1; 
			int endPage = startPage + blockSize -1;
			
			if (endPage > pageCnt) endPage = pageCnt;
			
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("list", list);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			
			System.out.println("---------------------------------------------------------------------------------");
			System.out.println("startNum --> "+ startNum);
			System.out.println("totCnt --> "+ totCnt);
			System.out.println("currentPage --> "+ currentPage);
			System.out.println("blockSize --> "+ blockSize);
			System.out.println("pageSize --> "+ pageSize);
			System.out.println("pageCnt --> "+ pageCnt);
			System.out.println("startPage --> "+ startPage);
			System.out.println("endPage --> "+ endPage);
			
			
			
			
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
		}
		return "list.jsp";
	}
	
	
	
	
}
