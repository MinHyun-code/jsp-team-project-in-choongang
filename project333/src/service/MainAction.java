package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.Member;
import dao.MemberDao;
import dao.RecruitDao;
import dao.RecruitDto;

public class MainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");

			// 커뮤니티 인기글 리스트
			BoardDao bd = BoardDao.getInstance();
			List<Board> listPopularInfo = bd.listPopular(1, 10);
			List<Board> listPopularQnA = bd.listPopular(2, 10);
			request.setAttribute("listPopularInfo", listPopularInfo);
			request.setAttribute("listPopularQnA", listPopularQnA);

			// 채용 공고 리스트
			RecruitDao rda = RecruitDao.getInstance();
			ArrayList<RecruitDto> rclist1 = rda.rclist(); // 데이터 베이스의 모든 값을 가지는 ArrayList객체를 만드는 일을 하는 메소드 rclist
			request.setAttribute("listRc", rclist1); // list는 이제부터 rclist(=rclist1)의 속성을 가지게 된다.

			// 채용 공고에 대한 회사 리스트
			MemberDao md = MemberDao.getInstance();
			List<Member> listCompany = md.selectCompany(rclist1);

			request.setAttribute("listCompany", listCompany);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "main.jsp";
	}

}
