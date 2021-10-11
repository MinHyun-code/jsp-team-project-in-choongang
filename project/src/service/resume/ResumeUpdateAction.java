package service.resume;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.Resume;
import service.CommandProcess;
public class ResumeUpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			System.out.println("----ResumeUpdateAction.java");			
			request.setCharacterEncoding("utf-8");
			MemberDao md = MemberDao.getInstance();
			Resume resume = new Resume();
			HttpSession session = request.getSession();
			String m_id = (String)session.getAttribute("sessionID");
//			resume.setR_num(Integer.parseInt(request.getParameter("r_num")));
			int r_num=Integer.parseInt((String)request.getAttribute("r_num"));
			String list_career_cr_name = (String)request.getAttribute("list_career_cr_name");
			String list_career_cr_grade = (String)request.getAttribute("list_career_cr_grade");
			String list_career_cr_salary = (String)request.getAttribute("list_career_cr_salary");
			String list_career_cr_job = (String)request.getAttribute("list_career_cr_job");
			String list_career_cr_sdate = (String)request.getAttribute("list_career_cr_sdate");
			String list_career_cr_edate = (String)request.getAttribute("list_career_cr_edate");
			
			String list_si_num = (String)request.getAttribute("list_si_num");
			String list_lc_num = (String)request.getAttribute("list_lc_num");
			String list_mylc_date = (String)request.getAttribute("list_mylc_date");
			String list_edu_num = (String)request.getAttribute("list_edu_num");
			String list_edutype_num = (String)request.getAttribute("list_edutype_num");
			String list_myedu_sdate = (String)request.getAttribute("list_myedu_sdate");
			String list_myedu_edate = (String)request.getAttribute("list_myedu_edate");
			
			md.resume_career_delete(r_num);
			md.resume_intro_delete(r_num); // 자소서 등록 전, 등록 자소서 초기화
			md.resume_licence_delete(r_num);
			md.resume_myedu_delete(r_num);
			String[] splited = list_si_num.split(",");
			if (!list_si_num.equals("")) {
				for(String i : splited) { 
					md.resumeIntroAdd(r_num,Integer.parseInt(i));
				}
			}
			String[] splited2 = list_lc_num.split(",");
			String[] splited2_1 = list_mylc_date.split(",");
			if (!list_lc_num.equals("")) {
				for(int i = 0; i < splited2.length; i++) { 
					md.resumeLicenceAdd(r_num, Integer.parseInt(splited2[i]), splited2_1[i]);
				}
			}
			String[] splited3_1 = list_edu_num.split(",");
			String[] splited3_2 = list_edutype_num.split(",");
			String[] splited3_3 = list_myedu_sdate.split(",");
			String[] splited3_4 = list_myedu_edate.split(",");
			 
			if (!list_edu_num.equals("")) {
				for(int i = 0; i < splited3_1.length; i++) {
					md.resumeEduAdd(r_num, Integer.parseInt(splited3_1[i]), splited3_3[i], splited3_4[i], Integer.parseInt(splited3_2[i]));
				}
			}
			
			String[] splited4_1 = list_career_cr_name.split(",");
			String[] splited4_2 = list_career_cr_grade.split(",");
			String[] splited4_3 = list_career_cr_salary.split(",");
			String[] splited4_4 = list_career_cr_job.split(",");
			String[] splited4_5 = list_career_cr_sdate.split(",");
			String[] splited4_6 = list_career_cr_edate.split(",");
			
			if (!list_career_cr_name.equals("")) {
				for(int i = 0; i < splited4_1.length; i++) {
					md.resumeCareerAdd(r_num, splited4_1[i], splited4_2[i] , Integer.parseInt(splited4_3[i]), splited4_4[i], splited4_5[i], splited4_6[i]);
				}
			}
			String resume_r_pic = (String)request.getAttribute("resume_r_pic");
			String resume_r_file = (String)request.getAttribute("resume_r_file");
			resume.setR_num(r_num);
			resume.setM_id((String)request.getSession().getAttribute("sessionID"));
//			resume.setR_title(request.getParameter("r_title"));
//			resume.setR_pic(request.getParameter("r_pic"));
//			resume.setR_file(request.getParameter("r_file"));
//			System.out.println("upLoadFilename2: "+(String)request.getAttribute("upLoadFilename2"));
			if(((String)request.getAttribute("upLoadFilename2")).equals("fileSave/null")) {
				resume.setR_pic(resume_r_pic);
			} else {
				resume.setR_pic((String)request.getAttribute("upLoadFilename2"));
			}
			if(((String)request.getAttribute("upLoadFilename")).equals("fileSave/null")) {
				resume.setR_file(resume_r_file);
			} else {
				resume.setR_file((String)request.getAttribute("upLoadFilename"));
			}
//			resume.setR_pic((String)request.getAttribute("upLoadFilename2"));
			resume.setR_title((String)request.getAttribute("r_title"));
//			resume.setR_file((String)request.getAttribute("upLoadFilename"));
			System.out.println("in ResumeUpdateAction: "+(String)request.getAttribute("upLoadFilename"));
			System.out.println("list_career_cr_name>>>>>" + list_career_cr_name);
			
			
			
			int result = md.resume_update(resume);
			 
			request.setAttribute("result", result);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "resumeList.do";
	}

}
