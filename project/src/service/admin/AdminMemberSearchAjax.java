package service.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Member;
import dao.MemberDao;
import service.CommandProcess;
import service.community.CommunityPageNumbering;

public class AdminMemberSearchAjax implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			MemberDao md = MemberDao.getInstance();
			
			String type = request.getParameter("type");
			String keyword = request.getParameter("keyword");
			if(type == null || keyword.equals("")) type ="id";
			if(keyword == null || keyword.equals("")) keyword = "";
			request.setAttribute("type", type);
			request.setAttribute("keyword", keyword);
			int pageSize = 10;
			int pageNum = 1;
			if (request.getParameter("pageNum") != null && !request.getParameter("pageNum").equals("")) {
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
			}
			int totCnt;
			int md_totalCnt = md.getTotalCnt();
			CommunityPageNumbering pageNumbering = null;
			
			totCnt = md.getTotalCnt(type, keyword);
			pageNumbering = new CommunityPageNumbering(totCnt, pageNum, pageSize);
			ArrayList<Member> searching = md.md_searching(type, keyword, pageNumbering.getStartRow(), pageNumbering.getEndRow());
			System.out.println("in searching: "+searching.get(0).getM_id());
			request.setAttribute("searchlist", searching);
			request.setAttribute("md_totalCnt", md_totalCnt);
			request.setAttribute("totCnt", pageNumbering.getTotCnt());
			request.setAttribute("pageNum", pageNumbering.getPageNum());
			request.setAttribute("currentPage", pageNumbering.getCurrentPage());
			request.setAttribute("pageCnt", pageNumbering.getPageCnt());
			request.setAttribute("startPage", pageNumbering.getStartPage());
			request.setAttribute("endPage", pageNumbering.getEndPage());
		} catch (Exception e) {
			e.printStackTrace();
		} return "admin/adminSearching.jsp";
	}

}
