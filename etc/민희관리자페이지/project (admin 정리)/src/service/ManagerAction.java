package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Member;
import dao.MemberDao;

public class ManagerAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDao md = MemberDao.getInstance();
		try {
			int totCnt = md.getTotalCnt();
			String pageNum = request.getParameter("pageNum");
			if (pageNum==null || pageNum.equals("")) { pageNum = "1";}
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage -1) * pageSize + 1;
			int endRow = startRow + pageSize -1;
			int startNum = totCnt - startRow + 1;
			List<Member> list = md.mb_list(startRow, endRow);
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			
			int startPage;
			int endPage;
			if (currentPage<3) {
				startPage = 1;
				endPage = 5;
			} else {
				startPage = currentPage - 2;
				endPage = currentPage + 2;
			}
			if (endPage > pageCnt) {
				startPage -= endPage-pageCnt;
				endPage = pageCnt;
			}
			if (startPage < 1) {
				startPage = 1;
			}
			
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("list", list);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "Manager.jsp";
	}

}
