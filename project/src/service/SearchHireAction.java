package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.RecruitDao;
import dao.RecruitDto;

public class SearchHireAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			RecruitDao rda = RecruitDao.getInstance();
			int totCnt = rda.totalCnt(); // 37
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10, blockSize = 10; // blockSize: size of row in a page.
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int startNum = totCnt - startRow + 1;
			List<RecruitDto> rclist1 = rda.list(startRow, endRow); // 데이터 베이스의 모든 값을 가지는 ArrayList객체를 만드는 일을 하는 메소드 rclist
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
			request.setAttribute("list", rclist1); // list는 이제부터 rclist(=rclist1)의 속성을 가지게 된다.
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

		return "recruit/searchHire.jsp";
	}
}