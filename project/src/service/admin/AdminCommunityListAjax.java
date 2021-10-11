package service.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;
import service.community.CommunityPageNumbering;

public class AdminCommunityListAjax implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			//기본 변수 선언
			request.setCharacterEncoding("utf-8");
			BoardDao bd = BoardDao.getInstance();
			int pageSize = 10;
			int pageNum = 1;
			if (request.getParameter("pageNum") != null && !request.getParameter("pageNum").equals("")) {
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
			}
			int totCnt;
			CommunityPageNumbering pageNumbering = null;
			List<Board> list = null;
			
			//커뮤니티 게시글 리스트 가져오기 + 페이징처리
			totCnt = bd.getTotalCnt();
			pageNumbering = new CommunityPageNumbering(totCnt, pageNum, pageSize);
			list = bd.list(pageNumbering.getStartRow(), pageNumbering.getEndRow());
			
			//Attribute
			request.setAttribute("list", list);
			request.setAttribute("totCnt", pageNumbering.getTotCnt());
			request.setAttribute("pageNum", pageNumbering.getPageNum());
			request.setAttribute("currentPage", pageNumbering.getCurrentPage());
			request.setAttribute("pageCnt", pageNumbering.getPageCnt());
			request.setAttribute("startPage", pageNumbering.getStartPage());
			request.setAttribute("endPage", pageNumbering.getEndPage());
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "admin/adminCommunityList.jsp";
	}

}