package service.community.temp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.CommentDao;
import service.CommandProcess;

public class AdminCommunityDeleteAjax implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			
			/* 나중에 관리자인지 세션으로 확인하는 거 여기에 추가*/
			
			int bd_code = Integer.parseInt(request.getParameter("bd_code"));
			int bd_num = Integer.parseInt(request.getParameter("bd_num"));
			String m_id = request.getParameter("m_id");
			
			CommentDao cd = CommentDao.getInstance();
			cd.deleteForBoard(bd_code, bd_num);
			
			BoardDao bd = BoardDao.getInstance();
			int result = bd.delete(bd_code, bd_num, m_id);
			if(result > 0) { // do 'delete' related answer
				bd.deleteAnswer(bd_code, bd_num);
			}
			
			request.setAttribute("result", result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "adminCommunityList.do";
	}

}
