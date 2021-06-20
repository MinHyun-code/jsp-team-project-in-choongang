package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.Resume;

public class ResumePopUpAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("ResumeListAction Start...");
		MemberDao md = MemberDao.getInstance();
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("sessionID");
		try {
			int resumeCnt = md.resumeCnt();			
			String pageNum = request.getParameter("pageNum");
			if(pageNum==null || pageNum.equals("")) { pageNum = "1";}
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 4, blockSize = 10;
			int startRow = (currentPage -1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int startNum = resumeCnt - startRow + 1;
			List<Resume> list = md.resume_list(startRow, endRow, m_id);   
			int pageCnt = (int)Math.ceil((double)resumeCnt/pageSize);
			int startPage = (int)(currentPage-1)/blockSize * blockSize + 1;
			int endPage = startPage + blockSize - 1; 
			if(endPage > pageCnt) endPage = pageCnt;
			
			request.setAttribute("resumeCnt", resumeCnt);
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
		return "mypage/resumePopUp.jsp";
	}
}
