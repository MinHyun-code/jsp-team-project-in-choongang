package service.community;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class CommunityWriteProAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("--CommunityWriteProAction");
			request.setCharacterEncoding("utf-8");
			System.out.println("UploadBoard3 doPost Start...");
			String filename = "";
			String upLoadFilename = "";
			String fileSave = "community/fileSave";
			String realPath = request.getSession().getServletContext().getRealPath(fileSave);
			int maxSize = 5 * 1024 * 1024; // 5MB
//			String realPath = "C:/jsp/jspSrc/project/WebContent/resume_pic";
			System.out.println("realPath -->" + realPath);
			MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8",
					new DefaultFileRenamePolicy());
			Enumeration en = multi.getFileNames();
			int i = 0;
			while (en.hasMoreElements()) {
				++i;
				// input 태그의 속성이 file인 태그의 name 속성값 : 파라미터 이름 m
				String filename1 = (String) en.nextElement();
				// 서버에 저장된 파일 이름
				filename = multi.getFilesystemName(filename1);
				// 전송 전 원래의 파일 이름
				String original = multi.getOriginalFileName(filename1);
				// 전송된 파일의 내용 타입
				String type = multi.getContentType(filename1);
				// 전송된 파일 속성이 file인 태그의 name 속성값을 이용해 파일객체 생성
				File file = multi.getFile(filename);
				System.out.println("real Path -->" + realPath + "<br>");
				System.out.println("파라메타 이름 -->" + filename1 + "<br>");
				System.out.println("실제 파일 이름 -->" + original + "<br>");
				System.out.println("저장된 파일 이름 -->" + filename + "<br>");
				System.out.println("파일 타입 -->" + type + "<br>");
				if (file != null) {
					System.out.println("크기 : " + file.length() + "<br>");
				}
				upLoadFilename = "community/fileSave/" + filename;
				System.out.println("전달 upLoadFilename ->" + upLoadFilename);
				request.setAttribute("filename", "fileSave/" + filename);

				if (i == 1) {
					request.setAttribute("file_name", upLoadFilename);
				}
				if (i == 2) {
					request.setAttribute("upLoadFilename2", upLoadFilename);
				}

			}

			request.setAttribute("pageNum", multi.getParameter("pageNum"));
			request.setAttribute("bd_code", multi.getParameter("bd_code"));
			request.setAttribute("m_id", multi.getParameter("m_id"));
			request.setAttribute("subject", multi.getParameter("subject"));
			request.setAttribute("content", multi.getParameter("content"));
			request.setAttribute("tags", multi.getParameter("tags"));

			String pageNum = (String) request.getAttribute("pageNum");
			Board board = new Board();
			board.setBd_code(Integer.parseInt((String) request.getAttribute("bd_code")));
			board.setM_id((String) request.getAttribute("m_id"));
			board.setSubject((String) request.getAttribute("subject"));
			board.setContent((String) request.getAttribute("content"));
			board.setCategory(0);
			board.setRead_count(0);
			board.setTags((String) request.getAttribute("tags"));
			board.setIs_adopted(0);
			String file_name = (String) request.getAttribute("file_name");
			if (board.getBd_code() == CommunityGlobal.INFO) {
				file_name = (file_name.equals("community/fileSave/null")) ? "community/fileSave/default_info.png"
						: file_name;
			}
			if (board.getBd_code() == CommunityGlobal.QnA) {
				file_name = (file_name.equals("community/fileSave/null")) ? "community/fileSave/default_qna.png"
						: file_name;
			}
			board.setFile_name(file_name);
			board.setRe_step(1);
			board.setRe_level(1);
			BoardDao bd = BoardDao.getInstance();// DB
			int result = bd.insert(board);
			System.out.println("result: " + result);
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "community/communityWritePro.jsp";
	}
}