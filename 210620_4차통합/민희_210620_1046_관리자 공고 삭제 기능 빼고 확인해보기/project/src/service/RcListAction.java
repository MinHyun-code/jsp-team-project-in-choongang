package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RecruitDao;
import dao.RecruitDto;



public class RcListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
		
	
		try {
			RecruitDao rda = RecruitDao.getInstance();
			ArrayList<RecruitDto> rclist1 = rda.rclist();  //데이터 베이스의 모든 값을 가지는 ArrayList객체를 만드는 일을 하는 메소드 rclist

			request.setAttribute("list",rclist1);  //list는 이제부터 rclist(=rclist1)의 속성을 가지게 된다.
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		return "recruit/rclist.jsp";		
		}
	}


