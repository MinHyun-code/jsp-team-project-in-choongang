package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PostMember;
import dao.PostMember_dao;

public class SearchFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("searchFormAxction start");
		
		try {
			
			
		} catch (Exception e) {
		
		}
		
		
		return "searchForm.jsp";
	}

}
