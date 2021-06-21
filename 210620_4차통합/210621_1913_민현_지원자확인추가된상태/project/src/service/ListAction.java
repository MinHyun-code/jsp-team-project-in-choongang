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
			int totCnt  = bd.getTotalCnt();	// 36+1=37
			
			String pageNum = request.getParameter("pageNum");	
			if (pageNum==null || pageNum.equals("")) {	pageNum = "1";	}
			
			int currentPage = Integer.parseInt(pageNum); //setAttribute 나 setParameter로 된 것들의 타입은 object타입이다	
			int pageSize  = 10, blockSize = 10;
			// page = 2 -->  startRow = 11 , endRow = 20
			// page = 3 -->  startRow = 21 , endRow = 30
			int startRow = (currentPage - 1) * pageSize + 1;  // start -> 1
			int endRow   = startRow + pageSize - 1;           // start -> 10
			int startNum = totCnt - startRow + 1;
			
			List<Board> list = bd.list(startRow, endRow); //dao의 list메소드의 수행값을 초기화 시킴
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;
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
			 
			System.out.println("-----------------------------------------------");  // /ch16/list.do
			System.out.println("startNum-->" + startNum);  // /ch16/list.do
			System.out.println("totCnt-->" + totCnt);  // /ch16/list.do
			System.out.println("currentPage-->" + currentPage);  // /ch16/list.do
			System.out.println("blockSize-->" + blockSize);  // /ch16/list.do
			System.out.println("pageSize-->" + pageSize);  // /ch16/list.do
			System.out.println("pageCnt-->" + pageCnt);  // /ch16/list.do
			System.out.println("startPage-->" + startPage);  // /ch16/list.do
			System.out.println("endPage-->" + endPage);  // /ch16/list.do
			
		} catch(Exception e) { 
			System.out.println(e.getMessage()); 
		}
		return "recruit/searching.jsp"; //예가 view  controller에 RequestDispatcher코딩이 되어 있어야 넘어간다.
	}

	 //listAction을 복붙할 것!
}
