package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RecruitDao;

public class AjaxLikeCompanyAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		System.out.println("---LikeCompanyAction");
		RecruitDao rda = RecruitDao.getInstance();
		int result = 0;
		String resultStr = "";
		String showStr = "";

		int rc_num = Integer.parseInt(request.getParameter("rc_num"));
		String m_id = request.getParameter("m_id");
		String p_event = request.getParameter("p_event");
		System.out.println("AjaxLikeCompanyAction rc_num->" + rc_num);
		System.out.println("AjaxLikeCompanyAction m_id->" + m_id);
		System.out.println("AjaxLikeCompanyAction p_event->" + p_event);
		try {
			// Click Event로 전달 -> Insert
			if (p_event.contains("C")) {
				int rc_cnt = rda.rc_Cnt(rc_num, m_id);
				result = rda.insertLikeCompany(m_id, rc_num);
//			    if(result==1) resultStr ="Click: 입력되었습니다";
//			    else resultStr ="Click: 입력이 안됐어요";
				if (result == 1) {
					resultStr = "1";

					// showStr ="관심목록에 등록이 되었습니다 마이페이지에서 확인하세요";
				} else if (rc_cnt == 2) {
					resultStr = "1";
					result = rda.prefer_add(m_id, rc_num);
				} else if (rc_cnt == 1) {
					resultStr = "2";
					result = rda.prefer_delete(m_id, rc_num);
					// showStr ="이미 등록이 되어있습니다.";
				}

				// Load -> Select
			} else {
				System.out.println("AjaxLikeCompanyAction Load p_event->" + p_event);
				result = rda.insertLikeCompany2(m_id, rc_num);
//			    if(result==1) resultStr ="Load: 괌심 목록에 이미 등록 되었습니다";
//			    else resultStr ="Load: 정상적인 조회가 되었습니다.";
				if (result == 1) {
					int rc_cnt = rda.rc_Cnt(rc_num, m_id);
					if (rc_cnt == 2)
						resultStr = "4";
					else
						resultStr = "3";
//			    		showStr ="이미 등록이 되어있습니다.";
				} else {
					resultStr = "4";
					// showStr ="관심목록에 등록해 보세요";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("AjaxLikeCompanyAction Exception: " + e.getMessage());
		}
		System.out.println("showStr: " + showStr);
		System.out.println("resultStr: " + resultStr);
		request.setAttribute("resultStr", resultStr);
		return "ajaxLikeCompany";
	}

}
