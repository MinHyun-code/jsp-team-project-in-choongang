package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.PostMember;
import dao.PostMember_dao;

public class SearchProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
					
		System.out.println("searchproAction start");
		
		try {

			PostMember_dao pmd = PostMember_dao.getInstance();
			PostMember postmember = new PostMember();
			
			String cate_place =request.getParameter("cate_place");
	        String cate_goal =request.getParameter("cate_goal");
	        String cate_ride =request.getParameter("cate_ride");
	        String cate_with =request.getParameter("cate_with");
			
	        String cate = cate_place + cate_goal + cate_ride + cate_with;
	        String category = cate;
	        
//	        category = Integer.parseInt(cate);
	        
//	        System.out.println("category ->" + category);
			
			int kind = Integer.parseInt(request.getParameter("kind"));
			int board_no = kind;
//			int post_no = Integer.parseInt(request.getParameter("post_no"));
			String search_text = request.getParameter("search_text");

			System.out.println("****" + board_no);
			System.out.println("****" + category);
			System.out.println("****" + search_text);
			
			int totCnt = pmd.getsearchTotalCnt(board_no, category, search_text);	
			request.setAttribute("totCnt", totCnt);
			String pageNum = request.getParameter("pageNum");
			
			if(pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10;
			int blockSize = 10;
			int startRow = (currentPage - 1)*pageSize+1;
			int endRow = startRow + pageSize -1;
			int startNum = totCnt - startRow +1; 
			System.out.println(" SearchProAction  startRow -> " +startRow);
			System.out.println(" SearchProAction  endRow -> " +endRow);
			 
			List<PostMember> list = pmd.search(startRow, endRow, board_no, category, search_text);
			
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			int startPage = (int)(currentPage -1 )/blockSize*blockSize +1; 
			int endPage = startPage + blockSize -1;
			
			if (endPage > pageCnt) {
				endPage = pageCnt; 
			}
			
//			postmember.setBoard_no(kind);
//			postmember.setCategory(category);
//			
			request.setAttribute("board_no", kind);
			System.out.println("board_no -> " + kind);
//			request.setAttribute("post_no", post_no);
//			System.out.println("post_no -> " + post_no);
			request.setAttribute("search_text", search_text);
			System.out.println("search_text -> "+search_text);
			request.setAttribute("category", category);
	        System.out.println("category ->" + category);
	        
	        
			request.setAttribute("totCnt", totCnt);
			System.out.println("totCnt -> "+totCnt);
			
			
			request.setAttribute("pageNum", pageNum);
			System.out.println("pageNum -> "+pageNum);
			request.setAttribute("currentPage", currentPage);
			System.out.println("currentPage -> "+currentPage);
			request.setAttribute("startNum", startNum);
			System.out.println("startNum -> "+startNum);
			request.setAttribute("blockSize", blockSize);
			System.out.println("blockSize -> "+blockSize);
			request.setAttribute("pageCnt", pageCnt);
			System.out.println("pageCnt -> "+pageCnt);
			request.setAttribute("startPage", startPage);
			System.out.println("startPage -> "+startPage);
			request.setAttribute("endPage", endPage);
			System.out.println("endPage -> "+endPage);
			
			request.setAttribute("cate_place", cate_place);
			request.setAttribute("cate_goal", cate_goal);
			request.setAttribute("cate_ride", cate_ride);
			request.setAttribute("cate_with", cate_with);

			
			request.setAttribute("list", list);
			System.out.println("list -> "+list);
			
		} catch (Exception e) {
			System.out.println("search_proAction erro ->" + e.getMessage());
		}
		
		return "searchPro.jsp";
	}

}
