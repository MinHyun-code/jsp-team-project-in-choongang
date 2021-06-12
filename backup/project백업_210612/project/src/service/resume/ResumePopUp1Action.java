package service.resume;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.Self_Intro;
import service.CommandProcess;

public class ResumePopUp1Action implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberDao md = MemberDao.getInstance();
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("sessionID");
		try {
			int introCnt = md.introCnt(m_id);
			String pageNum = request.getParameter("pageNum");
			if(pageNum==null || pageNum.equals("")) { pageNum = "1";}
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 4, blockSize = 10;
			int startRow = (currentPage -1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int startNum = introCnt - startRow + 1;
			List<Self_Intro> list = md.intro_list(startRow, endRow, m_id);   
			int pageCnt = (int)Math.ceil((double)introCnt/pageSize);
			int startPage = (int)(currentPage-1)/blockSize * blockSize + 1;
			int endPage = startPage + blockSize - 1; 
			if(endPage > pageCnt) endPage = pageCnt;
			
			request.setAttribute("introCnt", introCnt);
			request.setAttribute("pageNum", pageNum);
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
		
		return "resume/resumePopUp1.jsp";
	}
}
