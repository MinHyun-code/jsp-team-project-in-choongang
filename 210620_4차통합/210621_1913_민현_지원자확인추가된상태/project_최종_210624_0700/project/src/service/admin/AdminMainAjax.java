package service.admin;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.MemberDao;
import dao.RecruitDao;
import service.CommandProcess;

public class AdminMainAjax implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			MemberDao md = MemberDao.getInstance();
		
		try {
			int md_totalCnt = md.getTotalCnt();
			int md_joinCnt = md.md_joinCnt();
			int md_wdCnt = md.md_wdCnt();
			
			request.setAttribute("md_totalCnt", md_totalCnt);
			request.setAttribute("md_joinCnt", md_joinCnt);
			request.setAttribute("md_wdCnt", md_wdCnt);
			
			String read_id = md.read_id();
			String write_id = md.write_id();
			
			request.setAttribute("read_id", read_id);
			request.setAttribute("write_id", write_id);
			
			RecruitDao rd = RecruitDao.getInstance();
			int rc_totalCnt = rd.totalCnt();
			Date rc_date = md.rc_date();
			
			request.setAttribute("rc_totalCnt", rc_totalCnt);
			request.setAttribute("rc_date", rc_date);
			
			BoardDao bd = BoardDao.getInstance();
			int communityCnt = bd.getTotalCnt();
			request.setAttribute("communityCnt", communityCnt);
			
			Date reg_date = md.reg_date();
			request.setAttribute("reg_date", reg_date);
			
		} catch (Exception e) {
			e.getStackTrace();
		} return "admin/adminMain.jsp";
	}

}
