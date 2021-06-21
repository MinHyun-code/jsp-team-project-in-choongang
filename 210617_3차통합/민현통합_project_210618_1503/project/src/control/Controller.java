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
// @WebServlet("/Controller") // 주석처리 하는 것은 xml로 쓰겠다!
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;  // 버전
	private Map<String, Object> commandMap = new HashMap<String, Object>(); // do의 것을 파타미터로 받아들이기 위해
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {  // config는 초기화된 파라미터, 이름 변경 가능! (command.pro~~가 파라미터 역할, 뭐 다른거 기재 x)
		//web.xml에서 propertyConfig에 해당하는 init-param 의 값을 읽어옴
		String props = config.getInitParameter("config");
		//명령어와 처리클래스의 매핑정보를 저장할 Properties객체 생성
		System.out.println("Controllor props->"+props);
		Properties pr = new Properties();
		FileInputStream f = null;
		try {
			String configFilePath = config.getServletContext().getRealPath(props);
			f = new FileInputStream(configFilePath);
			//command.properties파일의 정보를 Properties객체에 저장
			pr.load(f); // 파라미터가 메모리에 올라감
		} catch (IOException e) { throw new ServletException(e);
		} finally {
			if (f != null) try { f.close(); } catch(IOException ex) {}
		}
		//Iterator객체는 Enumeration객체를 확장시킨 개념의 객체
			Iterator keyIter = pr.keySet().iterator(); // 키값을 저장해서 나열
		//객체를 하나씩 꺼내서 그 객체명으로 Properties객체에 저장된 객체에 접근
			while( keyIter.hasNext()) {
				String command = (String)keyIter.next();		// writeForm.do
				String className = pr.getProperty(command); // service.WriteFormAction
				System.out.println("Controller className->"+className);
				System.out.println("Controller command->"+command);
				try {
					Class<?> commandClass = Class.forName(className); // 해당 문자열을 클래스로 만든다. (오라클에 올려주기 위해)
//					Object commandInstance = commandClass.newInstance(); // 해당 클래스의 객체를 생성 (줄쳐진거는 앞으로 지원하지 x)
					// ListAction la = new ListAction();
					Object commandInstance = commandClass.getDeclaredConstructor().newInstance();
					/* WriteFormAction wfa = new WriteFormAction(); */ // 컨트롤러 잘못건들면 문제 되기떄문에, 이렇게 x (
					commandMap.put(command, commandInstance); // Map객체인 commandMap에 객체 저장 (키와 값을 둘다 가지고 있어야 밑에서 요청시 줄수 있음)
				} catch (Exception e) {
						throw new ServletException(e);
				}
			}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		requestPro(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		requestPro(request, response);
	}
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = null;
		CommandProcess com=null;
		String command = request.getRequestURI();
		try {
			System.out.println(command); // /ch16/list.do
//			System.out.println(request.getContextPath()); // ch16
//			System.out.println(command.indexOf(request.getContextPath()));  // 0
//			if (command.indexOf(request.getContextPath()) == 0) {
				command = command.substring(request.getContextPath().length());
//			}
			com = (CommandProcess)commandMap.get(command);
			System.out.println("command=> "+ command); // ch16/com
			System.out.println("com=> "+ com);   //ch16/com
			view = com.requestPro(request, response);
			System.out.println("view=> "+ view);	// ch16/com
		} catch (Throwable e) {
			throw new ServletException(e);
		}
		// Ajax String를 포함하고 있으면
		if (command.contains("ajaxTest1")) {
			System.out.println("ajaxTest1 String->"+command);  // 
			// text 있다면 
			String writer =  (String) request.getAttribute("writer");
			System.out.println("Controller writer->"+writer);  // 
			PrintWriter pw = response.getWriter();
			pw.write(writer);
			pw.flush();
		} else if (command.contains("ajaxLikeCompany.do")) {
            System.out.println("AjaxLikeCompanyAction.do String->"+command);  // 
            // text 있다면 
            String resultStr =  (String) request.getAttribute("resultStr");
            System.out.println("Controller ajaxLikeCompany resultStr->"+resultStr);  // 
            PrintWriter pw = response.getWriter();
            pw.write(resultStr);
            pw.flush();
      }
			
		else {  // 일반적인 경우 
			
		    RequestDispatcher dispatcher =   request.getRequestDispatcher(view); //return list.jsp라고 했으므로 list.jsp페이지로 넘어간다.
	        dispatcher.forward(request, response);
		}
	}
	
}
