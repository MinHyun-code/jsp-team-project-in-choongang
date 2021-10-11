package service.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ApplyRecruit;
import dao.Member;
import dao.MemberDao;
import dao.RecruitDao;
import dao.RecruitDto;
import dao.Resume;
import service.CommandProcess;

public class MypageAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("<mypageaction Start>");
			HttpSession session = request.getSession();
			String m_id=String.valueOf(session.getAttribute("sessionID"));
			MemberDao md = MemberDao.getInstance();
			Member member = md.select(m_id);
			
			request.setAttribute("member", member);
			
			/*ApplyRecruit ar = new ApplyRecruit();*/
			List<ApplyRecruit> list = md.my_list2(m_id);
			request.setAttribute("list", list);
			
			List<RecruitDto> list2 = md.inter_list(m_id);		
			request.setAttribute("list2", list2);
			
			List<Resume> list3 = md.re_list(m_id);
			request.setAttribute("list3", list3);
			
			RecruitDao rd = RecruitDao.getInstance();
			List<RecruitDto> rclist = rd.rclist();
			request.setAttribute("rclist", rclist);
			
			int applyCnt = md.applyCnt(m_id);
			request.setAttribute("applyCnt", applyCnt);
			
			int interCnt = md.interCnt(m_id);
			request.setAttribute("interCnt", interCnt);
			
			int resumeCnt = md.resumeCnt(m_id);
			request.setAttribute("resumeCnt2", resumeCnt);
			
			int recruitCnt = rd.totalCnt();
			request.setAttribute("recruitCnt", recruitCnt);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "mypage/mypage.jsp";
	}

}
