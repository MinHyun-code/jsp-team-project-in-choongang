package service.temp.file;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

public class Path implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("--service.temp.file.Path");
		String a = request.getSession().getServletContext().getRealPath("");
		String b = request.getSession().getServletContext().getRealPath("fileSave");
		String c = request.getContextPath();
		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		return "temp/file/nothing";
	}

}
