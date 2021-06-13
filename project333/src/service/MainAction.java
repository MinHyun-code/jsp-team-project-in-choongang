package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class MainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			BoardDao bd = BoardDao.getInstance();
			
			List<Board> listPopularInfo = bd.listPopular(1, 4);
			List<Board> listPopularQnA = bd.listPopular(2, 4);
			request.setAttribute("listPopularInfo", listPopularInfo);
			request.setAttribute("listPopularQnA", listPopularQnA);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "main.jsp";
	}

}
