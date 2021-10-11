package service.recruit;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Classify;
import dao.RecruitDao;
import dao.RecruitDto;
import service.CommandProcess;

public class HireAdd2Action implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {
			RecruitDao rd = RecruitDao.getInstance();
			Classify classify = new Classify();
			HttpSession session = request.getSession();
			String m_id=String.valueOf(session.getAttribute("sessionID"));
			classify.setRc_name(m_id);
			classify.setRc_title((String) request.getAttribute("rc_title"));
			classify.setRc_content((String) request.getAttribute("rc_content"));
			classify.setRc_content((String) request.getAttribute("upLoadFilename"));
			classify.setRc_scrap((String) request.getAttribute("upLoadFilename2"));
			classify.setRc_salary(Integer.parseInt((String) request.getAttribute("rc_salary")));
			classify.setRc_link((String) request.getAttribute("rc_link"));
			String code1 = (String) request.getAttribute("code1");
			String[] split_code1 = code1.split(" ");
			classify.setBclass(Integer.parseInt(split_code1[0]));
			classify.setMclass(Integer.parseInt(split_code1[1]));
			classify.setRc_view(Long.parseLong((String) request.getAttribute("rc_view")));
			
			rd.hireAdd(classify);

			String code2 = (String) request.getAttribute("code2");
			String[] split_code2 = code2.split(" ");
			classify.setBclass(Integer.parseInt(split_code2[0]));
			classify.setMclass(Integer.parseInt(split_code2[1]));
			
			rd.hireClassAdd(classify);

			String code3 = (String) request.getAttribute("code3");	
			String[] split_code3 = code3.split(" ");
			classify.setBclass(Integer.parseInt(split_code3[0]));
			classify.setMclass(Integer.parseInt(split_code3[1]));
			
			rd.hireClassAdd(classify);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "rclist.do";
	}

}
