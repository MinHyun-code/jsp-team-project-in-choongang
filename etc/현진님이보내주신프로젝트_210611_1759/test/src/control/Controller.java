package control;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

/**
 * Servlet implementation class Controller
 */
//@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> commandMap = new HashMap<String, Object>();

	/**
	 * Default constructor.
	 */
	public Controller() {
		super();
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("<Controller init Start...>");
		// web.xml에서 propertyConfig에 해당하는 init-param의 값을 읽어옴
		String props = config.getInitParameter("config");
		System.out.println("config	: " + config);
		System.out.println("props	: " + props);
		// 명령어와 처리클래스의 매핑정보를 저장할 Properties 객체 생성
		Properties pr = new Properties();
		FileInputStream f = null;

		try {
			String configFilePath = config.getServletContext().getRealPath(props);
			f = new FileInputStream(configFilePath);
			System.out.println("configFilePath	: " + configFilePath);
			// command.properties 파일의 정보를 Properties 객체에 저장
			pr.load(f);
		} catch (IOException e) {
			throw new ServletException(e);
		} finally {
			if (f != null)
				try {
					f.close();
				} catch (IOException ex) {

				}
		}

		// Iterator 객체는 Enumeration 객체를 확장시킨 개념의 객체
		Iterator<?> keyIter = pr.keySet().iterator();
		// 객체를 하나씩 꺼내서 그 객체명으로 Properties 객체에 저장된 객체에 접근
		while (keyIter.hasNext()) {
			String command = (String) keyIter.next(); // writeForm.do
			String className = pr.getProperty(command); // service.WriteFormAction
			System.out.println("command		: " + command);
			System.out.println("className	: " + className);

			try {
				Class<?> commClass = Class.forName(className); // 해당 문자열을 클래스로
//				Object commandInstance = commClass.newInstance(); // 해당 클래스의 객체를 생성
//				ListAction la = new ListAction();
				Object commandInstance = commClass.getDeclaredConstructor().newInstance(); // 해당 클래스의 객체를 생성

				commandMap.put(command, commandInstance); // Map 객체인 commandMap에 객체 저장
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
		System.out.println();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		requestPro(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		requestPro(request, response);
	}

	private void requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("<Controller requestPro Start...>");
		String view = null;
		CommandProcess com = null;
		String command = request.getRequestURI();

		try {
			System.out.println("command_before	: " + command);
//			System.out.println(request.getContextPath());
//			System.out.println(command.indexOf(request.getContextPath()));

//			if (command.indexOf(request.getContextPath()) == 0)
			command = command.substring(request.getContextPath().length());

			com = (CommandProcess) commandMap.get(command);
			System.out.println("command_after	: " + command);
			System.out.println("com : " + com);
			System.out.println();
			view = com.requestPro(request, response);
			System.out.println("view : " + view);
			System.out.println();
		} catch (Exception e) {
			throw new ServletException(e);
		}

		// Ajax String을 포함하고 있으면
		if (command.contains("ajax_m_recomment")) {
			System.out.println("ajax String : " + command);
			// text가 있다면
			String content = (String) request.getAttribute("content");
			System.out.println("Controller writer : " + content);
			PrintWriter pw = response.getWriter();
			pw.write(content);
			pw.flush();
		}else if (command.contains("ajax_m_re_recomment")) {
			System.out.println("ajax String : " + command);
			// text가 있다면
			String content = (String) request.getAttribute("content");
			System.out.println("Controller writer : " + content);
			PrintWriter pw = response.getWriter();
			pw.write(content);
			pw.flush(); 
		}else { // 일반적인 경우
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
	}

}
