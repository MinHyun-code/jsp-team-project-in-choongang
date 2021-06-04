package service.temp.cookie;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

public class CookieMakeAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("---CookieMakeAction");
		
		String yourName = request.getParameter("yourName");
		System.out.println("yourName: " + yourName);
		
		Cookie cookie = new Cookie("savedName", URLEncoder.encode(yourName,"utf-8"));
		System.out.println(cookie);
		
		
	    response.addCookie(cookie);
	    
	    
		return "temp/cookieStatus.jsp";
	}

}
