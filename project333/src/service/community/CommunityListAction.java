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
		request.setCharacterEncoding("utf-8");
		String word = request.getParameter("word");
		String replacedWord;
		if (word == null || word.equals("")) {
			replacedWord = "|";
		} else {
			replacedWord = word.replace(" ", "|");
		}
		System.out.println("replacedWord-> " + replacedWord);
		request.setAttribute("word", word);

		BoardDao bd = BoardDao.getInstance();
		try {
			int totCnt = bd.getTotalCnt(replacedWord); // 37
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10, blockSize = 10; // blockSize: size of row in a page.
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int startNum = totCnt - startRow + 1;
			List<Board> list = bd.listSearch(startRow, endRow, replacedWord);
			int pageCnt = (int) Math.ceil((double) totCnt / pageSize);
			int startPage;
			int endPage;
			if (currentPage < 3) {
				startPage = 1;
				endPage = 5;
			} else {
				startPage = currentPage - 2;
				endPage = currentPage + 2;
			}
			if (endPage > pageCnt) {
				startPage -= endPage - pageCnt;
				endPage = pageCnt;
			}
			if (startPage < 1) {
				startPage = 1;
			}

			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("list", list);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);

			System.out.println("-----------------------------------------------"); // /ch16/list.do
			System.out.println("startNum-->" + startNum); // /ch16/list.do
			System.out.println("totCnt-->" + totCnt); // /ch16/list.do
			System.out.println("currentPage-->" + currentPage); // /ch16/list.do
			System.out.println("blockSize-->" + blockSize); // /ch16/list.do
			System.out.println("pageSize-->" + pageSize); // /ch16/list.do
			System.out.println("pageCnt-->" + pageCnt); // /ch16/list.do
			System.out.println("startPage-->" + startPage); // /ch16/list.do
			System.out.println("endPage-->" + endPage); // /ch16/list.do
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "community/community.jsp";
//		return "list.jsp";
	}

}
