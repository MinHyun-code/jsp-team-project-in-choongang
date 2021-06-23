package service.community;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class CommunityListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
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
			
			//정보공유, 취준톡톡
			if (request.getParameter("bd_code") != null && !request.getParameter("bd_code").equals("") && !request.getParameter("bd_code").equals("0")) {
				int bd_code = Integer.parseInt(request.getParameter("bd_code"));
				request.setAttribute("bd_code", bd_code);
				totCnt = bd.getTotalCnt(bd_code);
				System.out.println("totCnt: "+totCnt);
				pageNumbering = new CommunityPageNumbering(totCnt, pageNum, pageSize);
				System.out.println("startRow, endRow: "+pageNumbering.getStartRow()+","+pageNumbering.getEndRow());
				list = bd.listSearch(pageNumbering.getStartRow(), pageNumbering.getEndRow(), bd_code);
			} else { //커뮤니티 메인
				request.setAttribute("bd_code", 0);
				String word = request.getParameter("word");
				request.setAttribute("word", word);
				String replacedWord;
				if (word == null || word.equals("")) {
					replacedWord = "|";
				} else {
					replacedWord = word.replace(" ", "|");
				}
				System.out.println("replacedWord-> " + replacedWord);
				totCnt = bd.getTotalCnt(replacedWord);
				pageNumbering = new CommunityPageNumbering(totCnt, pageNum, pageSize);
				list = bd.listSearch(pageNumbering.getStartRow(), pageNumbering.getEndRow(), replacedWord);
			}

			// set attribute about page
			request.setAttribute("list", list);
			request.setAttribute("totCnt", pageNumbering.getTotCnt());
			request.setAttribute("pageNum", pageNumbering.getPageNum());
			request.setAttribute("currentPage", pageNumbering.getCurrentPage());
			request.setAttribute("pageCnt", pageNumbering.getPageCnt());
			request.setAttribute("startPage", pageNumbering.getStartPage());
			request.setAttribute("endPage", pageNumbering.getEndPage());

			// selectPopular
			List<Board> listPopularInfo = bd.listPopular(1, 4);
			List<Board> listPopularQnA = bd.listPopular(2, 4);
			request.setAttribute("listPopularInfo", listPopularInfo);
			request.setAttribute("listPopularQnA", listPopularQnA);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "community/community.jsp";
//		return "list.jsp";
	}

}
