package service;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.PostMember;
import dao.PostMember_dao;

public class M_ContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PostMember_dao pmd = PostMember_dao.getInstance();
		PostMember postmember = new PostMember();
		
		try {
			
			System.out.println("Contentaction Start...");
			
			int board_no = 1;
			int post_no = Integer.parseInt(request.getParameter("post_no"));
			System.out.println("post_no >> " + post_no);
			
			
			
			String pageNum = request.getParameter("pageNum");
			
			//댓글 리스트)
			
			int totCnt = pmd.getTotalCnt(board_no);	//
//			request.setAttribute("totCnt", totCnt);
//			if(pageNum == null || pageNum.equals("")) {
//				pageNum = "1";
//			}
//			
//			int currentPage = Integer.parseInt(pageNum);
//			int pageSize = 10;
//			int blockSize = 10;
//			int startRow = (currentPage - 1)*pageSize+1;
//			int endRow = startRow + pageSize -1;
//			int startNum = totCnt - startRow +1;
//			
//			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
//			int startPage = (int)(currentPage -1 )/blockSize*blockSize +1; 
//			int endPage = startPage + blockSize -1;
//			
//			if (endPage > pageCnt) {
//				endPage = pageCnt; 
//			}
			
			int recomCnt = pmd.recomCnt(board_no, post_no);
			
			pmd.hits(post_no, board_no); 
			
			postmember = pmd.select(board_no, post_no);
			
			//이미지 불러온거
			
			
			
			String upLoadFilename = "";
			String save_path = "/file_upload";
			String realPath = request.getServletContext().getRealPath(save_path);
			System.out.println("realPath->" + realPath);
			upLoadFilename = "file_upload/" + postmember.getAttach() ;
			
			
			request.setAttribute("realPath", realPath);
			request.setAttribute("upLoadFilename", upLoadFilename);
			System.out.println("upLoadFilename -> " + upLoadFilename);
			
			List<PostMember> list = pmd.comment_list(board_no, post_no);
			
			
			request.setAttribute("board_no", board_no);
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
//			request.setAttribute("currentPage", currentPage);
//			request.setAttribute("startNum", startNum); 
			request.setAttribute("list", list);
			request.setAttribute("recomCnt", recomCnt);
			System.out.println("recomCnt -> " + recomCnt);
//			request.setAttribute("blockSize", blockSize);
//			request.setAttribute("pageCnt", pageCnt);
//			request.setAttribute("startPage", startPage);
//			request.setAttribute("endPage", endPage);
			
			request.setAttribute("post_no", post_no);
			System.out.println("post_no" + post_no);
			request.setAttribute("board_no", board_no);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("postmember", postmember);
			
			
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "m_content.jsp";
	}

}
