package service.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class MainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			BoardDao bd = BoardDao.getInstance();
			
			
			// 커뮤니티 인기글
			List<Board> listPopular_info = bd.listPopular(1, 4);
			List<Board> listPopular_QnA = bd.listPopular(2, 4);
			request.setAttribute("listPopular_info", listPopular_info);
			request.setAttribute("listPopular_QnA", listPopular_QnA);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		

		return "main.jsp";
	}

}
