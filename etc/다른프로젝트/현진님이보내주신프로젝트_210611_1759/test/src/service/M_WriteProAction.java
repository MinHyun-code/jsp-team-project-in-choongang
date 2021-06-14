package service;
import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
//import java.util.Arrays;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.PostMember;
import dao.PostMember_dao;

public class M_WriteProAction implements CommandProcess {
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		 System.out.println("M_WriteProAction Start...");
			
		try {
			
			PostMember postmember = new PostMember();
	        PostMember_dao pmd = PostMember_dao.getInstance();
			
	       
	        request.setCharacterEncoding("utf-8"); 
//	        String pageNum = request.getParameter("pageNum");
//	        String[] category = request.getParameterValues("category");
//	        String cate = "";
	        
//	        String cate_place =request.getParameter("cate_place");
//	        String cate_goal =request.getParameter("cate_goal");
//	        String cate_ride =request.getParameter("cate_ride");
//	        String cate_with =request.getParameter("cate_with");
	        
	        
	        
//	        String cate = cate_place + cate_goal + cate_ride + cate_with;
//	        String category = cate;
	        
//	        System.out.println("M_WriteProAction +category.length->"+category.length);	        
	        
	        
	        
	      //파일 업로드 부분
	        System.out.println("UploardBoard3 doPost Start...");
			String filename = "";
			String upLoadFilename = "";
			request.setCharacterEncoding("utf-8");
			int maxSize = 10*1024*1024;  // 10mb
			String save_path = "/file_upload";
			String realPath = request.getServletContext().getRealPath(save_path);
			System.out.println("realPath -> "+realPath);
			MultipartRequest multi = new MultipartRequest(request, realPath, maxSize,"utf-8", 
					new DefaultFileRenamePolicy());
			
			Enumeration en = multi.getFileNames();
			
			String pageNum = multi.getParameter("pageNum");
			
			String cate_place = multi.getParameter("cate_place");
			String cate_goal = multi.getParameter("cate_goal");
	        String cate_ride = multi.getParameter("cate_ride");
	        String cate_with = multi.getParameter("cate_with");
	        
	        String cate = cate_place + cate_goal + cate_ride + cate_with;
	        System.out.println("cate -> " + cate);
	        
	        String category = cate;
	        
	        System.out.println("category -> "+ category);
			
	        while(en.hasMoreElements()){
				//input 태그의 속성이 file인 태그의 name 속성값 : 파라미터 이름
				String filename1 = (String)en.nextElement();
				//서버에 저장된 파일 이름
				filename = multi.getFilesystemName(filename1);
				//전송전 원래의 파일 이름
				String orignal = multi.getOriginalFileName(filename1);
				//전송된 파일의 내용 타입
				String type = multi.getContentType(filename1);
				//전송된 파일속성이 file인 태그의 name 속성값을 이용해 파일 객체 생성
				File file = multi.getFile(filename1);
				System.out.println("real Path : "+realPath + "<br>");
				System.out.println("파라메타 이름 : "+filename1 + "<br>");
				System.out.println("실제 파일 이름 : "+orignal + "<br>");
				System.out.println("저장된 파일 이름 : "+filename + "<br>");
				System.out.println("파일 타입 : "+type + "<br>");
				
				if(file != null){
					int result = 0;
					System.out.println("크기 : " +file.length());
				}
			}
			
			
//		        postmember.setBoard_no(Integer.parseInt(request.getParameter("board_no")));
//		        System.out.println("board_no ->" + Integer.parseInt(request.getParameter("board_no")));
//		        postmember.setPost_no(Integer.parseInt(request.getParameter("post_no")));
//		        System.out.println("post_no ->" + Integer.parseInt(request.getParameter("post_no")));
//		        postmember.setCategory(cate);
//		        System.out.println("category ->" + request.getParameter("category"));
//		        postmember.setPost_title(request.getParameter("post_title"));
//		        System.out.println("post_title ->" + request.getParameter("post_title"));
//		        postmember.setMember_id(request.getParameter("member_id"));
//		        System.out.println("member_id ->" + request.getParameter("member_id"));
//		        postmember.setAttach(attach);
//		        System.out.println("attach ->" + attach );
//		        postmember.setContent(request.getParameter("content"));
//		        System.out.println("content ->" + request.getParameter("content"));
//		        postmember.setPasswd(request.getParameter("passwd"));
//		        System.out.println("passwd ->" + request.getParameter("passwd"));


		        postmember.setBoard_no(Integer.parseInt(multi.getParameter("board_no")));
		        System.out.println("board_no ->" + Integer.parseInt(multi.getParameter("board_no")));
		        postmember.setPost_no(Integer.parseInt(multi.getParameter("post_no")));
		        System.out.println("post_no ->" + Integer.parseInt(multi.getParameter("post_no")));
		        postmember.setCategory(category);
		        System.out.println("category ->" + multi.getParameter("category"));
		        postmember.setPost_title(multi.getParameter("post_title"));
		        System.out.println("post_title ->" + multi.getParameter("post_title"));
		        postmember.setMember_id(multi.getParameter("member_id"));
		        System.out.println("member_id ->" + multi.getParameter("member_id"));
		        postmember.setAttach(filename);
		        System.out.println("attach ->" + multi.getParameter("attach"));
		        postmember.setContent(multi.getParameter("content"));
		        System.out.println("content ->" + multi.getParameter("content"));
		        postmember.setPasswd(multi.getParameter("passwd"));
		        System.out.println("passwd ->" + multi.getParameter("passwd"));      
		       
		    	int result = pmd.insert(postmember);
				
				request.setAttribute("board_no", postmember.getBoard_no());
		        request.setAttribute("post_no", postmember.getPost_no());
		        request.setAttribute("pageNum", pageNum);
		        request.setAttribute("category", cate);
		        
		        
		        
		        request.setAttribute("result", result);
	        
		} catch(Exception e) { 
			System.out.println("에러낫음 + " + e.getMessage());
			System.out.println("insert end");
		}
        return "m_writePro.jsp";
	}
}